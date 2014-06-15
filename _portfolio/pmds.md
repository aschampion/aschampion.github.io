---
layout:    project
title:     Parallel Molecular Dynamics Simulation
description:     A distributed memory parallel molecular dynamics simulation of micelle formation.
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
In Spring 2012 I implemented a 2D parallel molecular dynamics simulation for Georgia Tech's CSE 6730 Modeling & Simulation with a team listed on the [GitHub repo](http://github.com/aschampion/gt-cse6730-pmds). The simulation contains a serial implementation and two distributed memory decompositions in Fortran 90 and OpenMPI. My contributions to the project also include a rudimentary visualizer in Processing and dataset generator in C99.

By default the project simulates micelle formation by simple hydrophilic and hydrophobic molecules based on the [LAMMPS micelle example](http://lammps.sandia.gov/doc/Section_example.html).

<figure>
	<iframe name='quickcast' src='http://quick.as/embed/bzorulen' scrolling='no' frameborder='0' width='100%' allowfullscreen></iframe><script src='http://quick.as/embed/script/1.37'></script>
	<figcaption>Visualization of early stage of micelle formation. Note that the video is recorded at a lower framerate than the visualization, causing smooth particle movement to be aliased.</figcaption>
</figure>

The yellow particles represent water-based solution, the green particles hydrophilic lipid heads, and the blue and purple particles hydrophobic lipid tails.

To try it yourself with an MPI-enabled `gfortran`:

{% highlight sh %}
git clone git@github.com:aschampion/gt-cse6730-pmds.git
cd gt-cse6730-pmds
make all
./pmds # Note that this will take some time and produce a ~200MB dump file
{% endhighlight %}

With the simulation results in `out.dump`, you can now open the Processing visualization in `pmds_visualizer/pmds_visualizer.pde`. Note that the visualizer requires the [controlP5](http://www.sojamo.de/libraries/controlP5/) Processing library, and the paths in `pmds_visualizer/visualizer.properties` should resolve to the micelle simulation description file in the repository and `out.dump` file you generated above.