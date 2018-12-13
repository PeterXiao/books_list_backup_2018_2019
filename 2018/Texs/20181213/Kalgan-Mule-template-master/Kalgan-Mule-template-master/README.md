Kalgan-Mule-template
====================

Kalgan template and mule colour scheme for beamer presentations

The layout theme, called Kalgan, displays the presentation outline on the left, slide numbers in the bottom right corner and also gets rid of the default useless navigation icons. (I have no idea why these exist in the first place! They never seem to work correctly...)

The colour theme, Mule, takes care of all the colours obviously. In the (default) presentation mode it has a dark gradient background with light text on it. To print handouts/notes just switch to handout mode in the TeX-file of the presentation by changing the documentclass as: 

	\documentclass[handout]{beamer}

and Mule then changes all the colours to make them suitable for print.

The dark background colour might interfere with some graphics that might need a lighter background (think line plots). For such situations, Mule defines a new command:

	\bgbox{}

which places a light coloured background behind the LaTeX in the braces.
