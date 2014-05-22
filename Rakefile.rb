require "rubygems"
require "bundler/setup"
require "stringex"
require "tmpdir"
require "jekyll"

## -- Config -- ##

public_dir      = "public"    # compiled site directory
posts_dir       = "_posts"    # directory for blog files
new_post_ext    = "md"  # default new post file extension when using the new_post task
new_page_ext    = "md"  # default new page file extension when using the new_page task


#############################
# Create a new Post or Page #
#############################

# usage rake new_post
desc "Create a new post in #{posts_dir}"
task :new_post, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post: ")
  end
  filename = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  tags = get_stdin("Enter tags to classify your post (comma separated): ")
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "modified: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "tags: [#{tags}]"
    post.puts "image:"
    post.puts "  feature: "
    post.puts "  credit: "
    post.puts "  creditlink: "
    post.puts "comments: "
    post.puts "share: "
    post.puts "---"
  end
end

# usage rake new_page
desc "Create a new page"
task :new_page, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your page: ")
  end
  filename = "#{title.to_url}.#{new_page_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  tags = get_stdin("Enter tags to classify your page (comma separated): ")
  puts "Creating new page: #{filename}"
  open(filename, 'w') do |page|
    page.puts "---"
    page.puts "layout: page"
    page.puts "permalink: /#{title.to_url}/"
    page.puts "title: \"#{title}\""
    page.puts "modified: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    page.puts "tags: [#{tags}]"
    page.puts "image:"
    page.puts "  feature: "
    page.puts "  credit: "
    page.puts "  creditlink: "
    page.puts "share: "
    page.puts "---"
  end
end

desc "Generate site files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end


desc "Generate site and publish to GitHub Pages"
task :publish => [:generate] do
  repo = %x(git config remote.origin.url).strip
  deploy_branch = 'gh-pages'
  if repo.match(/github\.io\.git$/)
    deploy_branch = 'master'
  end

  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp

    pwd = Dir.pwd
    Dir.chdir tmp

    keep_deploy_history = true

    system "git init"
    system "git remote add origin #{repo}"
    if keep_deploy_history
      system "git fetch -q"
      system "git branch #{deploy_branch} origin/#{deploy_branch}"
    end
    system "git add ."

    repo = yield repo if block_given?

    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.inspect}"
    system "git push #{repo} #{deploy_branch} --force"

    Dir.chdir pwd
  end
end

desc "Generate site and publish to GitHub Pages using Travis CI credentials"
task :travis => [:generate] do
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
    puts 'Pull request detected. Executing build only.'
    next
  end

  Rake::Task["publish"].invoke do |repo|
    system "git config user.name '#{ENV['GIT_NAME']}'"
    system "git config user.email '#{ENV['GIT_EMAIL']}'"
    repo.gsub(/^git:/, "https://#{ENV['GH_TOKEN']}:")
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end