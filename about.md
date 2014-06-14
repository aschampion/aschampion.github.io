---
layout: page
permalink: /about/
title: About Andrew
tags: []
image:
  feature: abstract-5.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
share: true
custom-scripts: |
  <script src="//rawgithub.com/christianv/jquery-lifestream/master/jquery.lifestream.min.js"></script>
  <script>
    $("#lifestream-gh").lifestream({
      list:[
        {
          service: "github",
          user: "aschampion"
        }
      ],
      limit: 5
    });
    $("#lifestream-tw").lifestream({
      list:[
        {
          service: "twitter",
          user: "aschampion"
        }
      ],
      limit: 5
    });
  </script>
---

I'm a data scientist interested in how machine learning can reshape knowledge discovery and decision making. Specifically, I'm focused on novel modes of explanation and understanding provided by computational and information theoretic models in neuroscience. In practice this plays out as research in high-performance computing, biomedical imaging, and machine learning. Previously I researched human-computer interaction in educational technology.

If that seems eccletic, [my portfolio]({{ site.url }}/portfolio) provides some concrete examples.

##<a href="http://github.com/{{ site.owner.github }}"><i class="icon-github"></i> Recent GitHub activity</a>

<div id="lifestream-gh">&nbsp;</div>

##<a href="http://twitter.com/{{ site.owner.twitter }}"><i class="icon-twitter"></i> Recent Twitter activity</a>

<div id="lifestream-tw">&nbsp;</div>