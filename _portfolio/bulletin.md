---
layout:    project
title:     Large Touchscreen Digital Bulletin Board
description: >
  Digital bulletin board for a custom, 102-inch multitouch display at the Georgia Gwinnett College Student Center. Included both a touchscreen UI with paper simulation and a web application for bulletin content creation.
website: http://hercules.ggc.edu/bulletin
published: true
status:    past
started_on: 2010-11-01
ended_on:   2011-09-01
image:
  feature: bulletin-feature.jpg
  title: Large Touchscreen Digital Bulletin Board
  alt:   Large Touchscreen Digital Bulletin Board
---
When Georgia Gwinnett College built their Student Center in 2010, the central walkway was lined with six 40" screens for digital signage and one 102" multitouch screen for student interaction. As an application developer in the school's Department of Technology Development, I created a touch-based interface (in Processing/OpenGL) for viewing and interacting with digital bulletins on the large display. 

<figure>
	<img src="{{ site.url }}/images/bulletin-full.jpg" alt="Board Image" class=".pull-right" />
</figure>

### Interface
Following the skeuomorphic vision for the board, poster bulletins animate like paper in a virtual wind simulated with verlet integration and responsive to gaze-detection cues from an attached camera to grab the attention of passing students (though this feature was not deployed at the installation). More modern interaction contexts allow students to select bulletins that interest them and sign up for email or social media alerts by swiping their student card (also not deployed at installation) or scanning a QR code with their mobile device.

### Layout and Analytics
To generate poster layouts for the display I implemented a genetic algorithm (in C++) to provide more recent posters or upcoming events with the largest amount of screen space, while still layering older or longer lasting posters in the background with a high likelihood for significant screenspace during any given day. Analytics tracked layouts and interactions to provide feedback to poster creators on the effictiveness of their designs and to inform the positioning algorithm on term weighting in its objective function most effective at initiating interaction.

### Backend
Driving this content is a [bulletin management webapplication]({{ page.website }}) (in JRuby/Rails) I created to allow bulletin upload, interactive creation (via a Flash application created by a colleague), and monitoring by content creators, and bulletin approval workflow, revision, and analytics auditing by school staff. The webapp also feeds bulletin content to other school signage systems and online portals, as well as automating the creation and moderation of mailing lists (Python/Mailman) where students can receive information and updates from bulletin creators and event coordinators after signing up via the display.