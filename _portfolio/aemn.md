---
layout:    project
title:     Wind Speed Prediction
description: >
  Predictive machine learning models of wind speed from a dataset spanning more than 20 years of hourly observations of dozens of environmental variables from hundreds of automated monitoring stations in support of a USDA Risk Management Agency grant project.
published: true
status:    past
started_on: 2010-04-01
ended_on:   2012-06-01
image:
  feature: aemn-feature.jpg
  title: Wind Speed Prediction
  alt:   Correlation map image
---
As a graduate research assistant at the University of Georgia I developed machine learning-based predictive models of wind speed from multiple, multivariate climatological data time series for the [Georgia Automated Environmental Monitoring Network (AEMN)](http://www.weather.uga.edu/). A sampling of learning algorithms from regression trees, support vector regression, Bayesian processes, and lazy learners were applied to both inter- and intra-location prediction tasks {% cite knox2012usingposter %}. The primary findings of my work were that Bayesian regression ensembles produced higher accuracy models than other best-in-class learners. Biased resampling of the data demonstrated performance differences were primarily due to the highly kurtotic, skewed distribution of wind speed.

References
----------

{% bibliography --cited_in_order %}