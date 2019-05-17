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

<p align="center">
  <img width="615" height="258" src="/Images_/image1.PNG">
</p>

<p align="center">
  <img width="682" height="264" src="/Images_/image2.PNG">
</p>

## Over Filled.
The aim of this algorithm was detect if a bottle was overfilled relative to the standard. Again the
algorithm starts by selecting a specific region of interest from the image demonstrated in (Fig 2.).
This new cropped image is converted to grayscale and then to a binary image by applying a
threshold which highlights the black pixels in the image. The centre image in (Fig 2.) displays an
overfilled bottle while the image on the right shows a standardized bottle. The faction of black pixels
in the image is calculated and if it exceeds a threshold of 0.4 then the bottle is flagged as this bottle
is overfilled. This is obviously a crude method however all the images given were grossly over filled
so the sensitivity of the algorithm is negligible.

<p align="center">
  <img width="608" height="244" src="/Images_/image3.PNG">
</p>

<p align="center">
  <img width="672" height="258" src="/Images_/image4.PNG">
</p>

## Bottle Label Missing.
The aim of this algorithm was to detect if the label was missing from the central bottle. Again the
algorithm starts by selecting a specific region of interest demonstrated by (Fig 3.). This cropped
image was then converted to grayscale and a threshold was applied to convert the image to binary.
The applied threshold was chosen to highlight any white pixels in the image. The difference in the
two cases is clearly apparent demonstrated by the below, the central image in (Fig 3.) represents a
bottle with its label missing and the image on the right represents an image that has a label.
Therefore the fraction of black pixels was again calculated. If this value was greater than 0.5 then the
image was flagged as a fault had been detected. Again this algorithm is very basic and if the labels
were torn, ripped or glue applied instead of completely missing then I wouldn’t be confident in its
abilities. 

<p align="center">
  <img width="605" height="234" src="/Images_/image5.PNG">
</p>

<p align="center">
  <img width="680" height="258" src="/Images_/image6.PNG">
</p>
