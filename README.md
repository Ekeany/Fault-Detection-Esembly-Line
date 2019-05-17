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

## Label Not Printed.
This algorithm aims to detect if a bottle has a label however the printing process has failed. The
algorithm starts by selecting a region of interest demonstrated by (Fig 4.). Again a threshold is
applied and this new image is firstly converted to grayscale before a threshold is applied to convert
the image to binary with the aim of highlighting the white pixels in the image. The central image in
(Fig 4.) represents an image whose label was not printed. Whereas, the image on the right
represents the standard printed label. The fraction of black pixels in the image is then calculated and
if this value is below a threshold of 0.5 the image is flagged for the fault of having no printed label.

<p align="center">
  <img width="602" height="234" src="/Images_/image7.PNG">
</p>

<p align="center">
  <img width="684" height="266" src="/Images_/image8.PNG">
</p>

## Label Not Straight.
The aim of this algorithm was to detect if the label was indeed printed but not straight. The
algorithm begins by selecting a specific region of interest shown in the (Fig 5.). This red channel of
the image is then selected and horizontal edge detection is preformed using the Sobel method. The
Sobel method was the implemented over Canny edge detection as it doesn’t produce as much noise
as it is more efficient and detects too many lines. The unwanted smaller objects were removed from
the image using the “bwareaopen()” function in Matlab. The image was then skeletonized
leaving just the outline of the label, the position of the end points of this line where then located
and using the following equation the angle of the line was calculated.

<p align="center">
  <img width="150" height="67" src="/Images_/image9.PNG">
</p>

If this angle exceeded 0.08 degrees or if the length of the line was less than 120 pixels a fault would
be flagged. One problem arose where the jagged nature of the line was creating numerous end
points (the right image in (Fig 5.)) therefore only the last x coordinate was chosen as the Matlab
find() function scans the image left to right labelling any coordinates it finds from 1 to n.

<p align="center">
  <img width="605" height="299" src="/Images_/image10.PNG">
</p>

<p align="center">
  <img width="687" height="266" src="/Images_/image11.PNG">
</p>

## Bottle Cap Missing.
The aim of this algorithm was to detect if the bottle cap of the central bottle was missing. A region of
interest was first selected demonstrated by (Fig 6.). The red channel of this image was selected, it
was then converted to binary by selecting a suitable threshold that highlighted the red pixels in the
image. The difference in the two images is clear from (Fig 6.) the centre image represents a bottle
with its cap missing whereas the image on the right clearly has the filled outline of the bottle cap.
The fraction of black pixels in the image was found again and if this value was greater than 0.8 then a
flag would be raised.

<p align="center">
  <img width="601" height="268" src="/Images_/image12.PNG">
</p>

<p align="center">
  <img width="699" height="285" src="/Images_/image13.PNG">
</p>

## Bottle Deformed.
The aim of this algorithm was to detect if the body of the central bottle had been deformed in any
way. The algorithm starts by selecting a region of interest shown in (Fig 7.). The red channel is
selected and horizontal edge detection is applied to the grayscale image using the Sobel operator.
The “bwareaopen()” Matlab function is then used to remove small objects from the binary image.
The edge is then skeletonized and the location of the endpoints are calculated. The last endpoint in
the image is then subtracted from the first end point to give the distance of the line if this distance is
then below a certain threshold of 110 pixels the image is flagged as being deformed. The
discrepancy in distance is clearly evident from the difference between the central image in (Fig 7.)
representing the deformed bottle and the image on the right representing the standard bottle
shape.

<p align="center">
  <img width="611" height="291" src="/Images_/image14.PNG">
</p>

<p align="center">
  <img width="688" height="269" src="/Images_/image15.PNG">
</p>

## Missing Bottle.
To detect if the central bottle is missing a specific region of interest is first applied demonstrated by
(Fig 8.). This cropped image is converted to grayscale and a threshold is applied to convert it to
binary. This threshold has been chosen to highlight the empty background in the images this can be
seen in (Fig 8.) as the central image represents the missing bottle example and the image on the
right a standard bottle is present.

<p align="center">
  <img width="609" height="245" src="/Images_/image16.PNG">
</p>

<p align="center">
  <img width="687" height="254" src="/Images_/image17.PNG">
</p>

## Main Program.
The main program has been heuristically structured to optimize the performance of the algorithms
and to stop any overlapping faults being detected i.e. the bottle is deformed and overfilled. The
program begins by using a For loop to iterate through every image in a directory given by the user.
The program starts by detecting if a bottle is missing otherwise it checks for its first fault. The main
part of the program is based around certain faults that cannot co-occur. Therefore if a bottle has no
label then it cannot have the faults “Label missing but not printed” or “Label not straight”. These cooccurrences are processed by a series of if else statements. Another problem that is dealt with by
the main program is that if a bottle is deformed then it is not overfilled. Merely the area inside the
bottle has gotten smaller therefore pushing the liquid upwards. To combat this the overfilled fault is
calculated at the end of any if else statement branch. If no faults are detected then the program will
simply output that the bottles meet the quality standards.

<p align="center">
  <img width="517" height="876" src="/Images_/image18.PNG">
</p>

## Results. 

<p align="center">
  <img width="640" height="372" src="/Images_/image19.PNG">
</p>

## Conclusion.
The program achieved good accuracy on the entire dataset as a whole with approximately 99%
accuracy. However due to the unlabelled data and the size of the “all” image folder human error
may have led to an inflated accuracy score. The one image that the program fails to classify correctly
is a deformed bottle however instead of the deformity being severe and a side profile given. The
image is head on therefore the actually length of the bottles cross section hasn’t been affected by
the deformity. Thus leaving the logic implemented useless in its classification. Another solution I
hypothesis is based on the glare created by the new angles of the deformed bottles therefore
counting the number of pixels with a large grayscale intensity in an appropriate region of interest
may be suitable?.

## References.
1. https://nuigalway.blackboard.com/webapps/blackboard/content/listContent.jsp?course_id=
_98245_1&content_id=_1662102_1
2. https://math.stackexchange.com/

