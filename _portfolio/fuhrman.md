---
layout:    project
title:     Automated Fuhrman Grading of Renal Carcinoma
tags:      [research]
description: >
  Machine learning grading of histology images, with 
  the goal of narrowing the gap between computer decision support systems 
  and pathologists' domain expertise. Published in IEEE EMBC 2014.
published: true
status:    active
started_on: 2013-03-01
ended_on:   Present
image:
  feature: fuhrman-feature.jpg
  title:   Automated Fuhrman Grading of Renal Carcinoma
  alt:     Automated Fuhrman Grading of Renal Carcinoma
---
Since Spring 2013 I have been researching clinical diagnosis decision support systems for segmentation, feature extraction, and classification of microscopy for Fuhrman grading of renal carcinoma with Dr. May D. Wang's biomedical image analysis group at Georgia Tech. 

By developing accurate grade classifiers we identify novel features contributing to accuracy that pathologists can use in their own grading judgements and correlate these features with biological markers. Parts of this research have been published at the 36th Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC’ 14) {% cite champion2014semantic %}.

The EMBC paper abstract summarizes the published portion of this research:

> Pattern recognition in tissue biopsy images can assist in clinical diagnosis and identify relevant image characteristics linked with various biological characteristics. Although previous work suggests several informative imaging features for pattern recognition, there exists a semantic gap between characteristics of these features and pathologists’ interpretation of histopathological images. To address this challenge, we develop a clinical decision support system for automated Fuhrman grading of renal carcinoma biopsy images. We extract 1316 color, shape, texture and topology features and develop one vs. all models for four Fuhrman grades. Our models are highly accurate with 90.4% accuracy in a four-class prediction. Predictivity analysis suggests good generalization of the model development methodology through robustness to dataset sampling in cross-validation. We provide a semantic interpretation for the imaging features used in these models by linking features to pathologists’ grading criteria. Our study identifies novel imaging features that are semantically linked to Fuhrman grading criteria.

References
----------

{% bibliography --cited_in_order %}