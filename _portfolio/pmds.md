---
layout:    page
title:     Parallel Molecular Dynamics Simulation
short:     A distributed memory parallel molecular dynamics simulation of micelle formation.
published: true
status:    featured
website:   http://github.com/aschampion/gt-cse6730-pmds
started_on: 2012-03-01
ended_on:   2012-05-01
image:
  feature: pmds-feature.jpg
  title: Parallel Molecular Dynamics Simulation
  alt: PMDS Visualization
---
In Spring 2012 I implemented a 2D parallel molecular dynamics simulation for Georgia Tech's CSE 6730 Modeling & Simulation. Along with a team listed on the [GitHub repo](http://github.com/aschampion/gt-cse6730-pmds), the simulating contains a serial version and two distributed memory decompositions in Fortran 90 and OpenMPI. My contributions to the project also include a rudimentary visualizer in Processing and dataset generator in C99.

We simulated micelle formation by simple hydrophilic and hydrophobic molecules based on the [LAMMPS micelle](http://lammps.sandia.gov/doc/Section_example.html) example simulation.

To try it yourself with `gfortran`:

{% highlight console %}
git clone git@github.com:aschampion/gt-cse6730-pmds.git
cd gt-cse6730-pmds
make all
./pmds # Note that this will take some time and produce a ~200MB dump file
{% endhighlight %}