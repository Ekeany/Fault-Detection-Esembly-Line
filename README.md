# Fault-Detection-Esembly-Line

## Introduction
This assignment deals with the application of image processing techniques within a visual inspection
system. The aim of the assignment is to correctly identify each of the following fault conditions that
may occur in a coca cola bottling plant:
1. Bottle under-filled or not filled at all.
2. Bottle over-filled.
3. The Bottles label is missing.
4. The bottle has a label but the label printing has failed.
5. The Bottle label is crooked.
6. The cap of the bottle is missing.
7. The bottle is deformed
Each image is taken for an individual bottle leaving the production line. Therefore the faults
occurring in the bottles at the sides of the image will be detected separately when they themselves
are photographed at the centre of an image respectively. Some of the images will contain no bottle
at the centre of the image. However this is not a fault but merely a gap in the production flow.
Therefore images with faults in the bottles on either side, or a missing bottle in the centre have been
ignored and only the seven faults above have been considered.

## Algorithms.
### Under filled.
The aim of this algorithm is to detect if a bottle is either under filled or not filled at all. To complete
this task the algorithm focuses its attention to a specific region of interest just above the label
demonstrated in (Fig 1). The new cropped image is then converted to grayscale and a threshold is
then applied to this image to isolate the black pixels. (Fig 1.) Clearly shows the contrast between an
under filled bottle in the central image and normal bottle located on the right hand side. To classify
each case the percentage of black pixels in the entire image is calculated and if this value is below a
certain threshold value of approximately 0.25 then a fault has been detected.

