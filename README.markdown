
Overview
--------

ImageTooth is a library that provides programmers and users a simple way to generate images for odontograms. IT allows to choose between png or jpg images.

What Does ImageTooth Do?
------------------------

Tooth image generation.
Together with the library there is a simple script that allows you to create the teeth images directly.
A simple interface for painting teeth faces.
All permutations generating.
A example
First will be install the gem:
gem install imagetooth

One tooth without paint:
------------------------
imagetooth  --image wwwww.png --folder ./
This code generates an image like this:
The filename's characters are:
w - White
g - Green
b - Blue
n - Black
r - Red
and are ordered, begining on the upper face of the the tooth and moving clockwise ending on the center face.
[top][right][bottom][left][center].png

More examples
-------------

Generate a tooth with its top face painted with red:
imagetooth  --image rwwww.png --folder ./
Generate a tooth with its top face painted red and center one green:
imagetooth  --image rwwwg.png --folder ./
Generate a tooth with top face painted red, left one black and center one green:
imagetooth  --image rwwng.png --folder ./
All permutations with 5 faces and 5 colors (3125)
imagetooth --all  --folder images/
this code generates 3125 images that are separated within five folders images/w/ images/g/ images/b/ images/r/ images/n/

please see http://imagetooth.rubyforge.org/
