# Fault-Detection-Esembly-Line

In this practical exercise, we are dealing with a bottling production line in a facility bottling CocaCola for the Irish domestic market. We have a set of images, taken under near constant factory lighting conditions, of the bottles as they leave the bottling line. The bottling company require a vision system to automatically identify a number of specific faults that may occur during the filling, labelling and capping stages of production so that these bottles can be intercepted prior to packaging. 

Your task is to design and prototype a vision system to detect the set of fault conditions that may occur together with identifying the type of fault that has occurred. You will develop this prototype system using the software and the techniques discussed in the course. 

## Task Specification – Automated Visual Inspection
You are required to develop a visual inspection system that correctly identifies each of the following fault conditions that may occur in the bottling plant:
1. bottle under-filled or not filled at all
2. bottle over-filled
3. bottle has label missing
4. bottle has label but label printing has failed (i.e. label is white)
5. bottle label is not straight
6. bottle cap is missing
7. bottle is deformed (i.e. squashed) in some way

In each image we are only interested in classifying the central bottle in the image. One image is
taken for each bottle leaving the production line so faults occurring in bottles at the sides will be
detected separately when these particular bottles are themselves photographed central to the image.
Additionally, some images may have no bottle in the centre of the image – this is not a fault, just a 

gap in the production flow stemming from a machine operating further up the line. Images with
faults in the bottles on either side, or a missing bottle in the centre should be ignored by your
system – only the seven faults above must be reported. You can tackle each of the cases in any order
you wish. Some examples contain more than one fault with the central bottle – identify as many as
you can. 
