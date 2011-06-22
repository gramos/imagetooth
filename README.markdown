
ImageTooth 2.0.0
================

ImageTooth is a library that provides programmers and users a simple way to generate images for odontograms. IT allows to choose between png or jpg images.

What Does ImageTooth Do?
------------------------

### Tooth image generation.

Together with the library there is a simple script that allows you to create the teeth images directly.
A simple interface for painting teeth faces.
All permutations generating.

Example:
-------

First, you need to install the gem:

    gem install imagetooth

Then, you can run the imagetooth command, like this:

    imagetooth  --image wwwww.png --folder ./

This code generates an image where the filename's characters means:

* w - White
* g - Green
* b - Blue
* n - Black
* r - Red

and are ordered, begining on the upper face of the the tooth and moving clockwise ending on the center face.
[top][right][bottom][left][center].png
![wwwww.png](/images/wwwww.png)

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


