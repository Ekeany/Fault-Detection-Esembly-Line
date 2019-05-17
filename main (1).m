close all;
clear variables;
clc;

%DirImages = '\\fs2\18234602\MATLAB\images\1-UnderFilled';
%DirImages = '\\fs2\18234602\MATLAB\images\2-OverFilled';
%DirImages = '\\fs2\18234602\MATLAB\images\3-NoLabel';
%DirImages = '\\fs2\18234602\MATLAB\images\4-NoLabelPrint';
%DirImages = '\\fs2\18234602\MATLAB\images\5-LabelNotStraight';
%DirImages = '\\fs2\18234602\MATLAB\images\6-CapMissing';
%DirImages = '\\fs2\18234602\MATLAB\images\7-DeformedBottle';
%DirImages = '\\fs2\18234602\MATLAB\images\MissingBottle';
%DirImages = '\\fs2\18234602\MATLAB\images\Combinations';
DirImages = '\\fs2\18234602\MATLAB\images\All';


file = GetFileFromDirectory(DirImages);

for i = 1:length(file)
    MissingBottleCap = 0;
    Underfilled = 0;
    labelmissing = 0;
    labelnotPrinted = 0;
    overfilled = 0;
    labelnotstraight = 0;
    bottleDeformed = 0;
    
    % Get file name and file path
    fileName = file(i).name;
    filePath = fullfile(DirImages, fileName);
    disp(fileName);
    
    isMissing = CheckMissingBottle(filePath);
    if isMissing == 1
       disp('No bottle in the frame');
    else
        MissingBottleCap = BottleTopMissing(filePath);
        
        if MissingBottleCap == 1
            disp('Bottle cap is Missing');
        end
        
        Underfilled = CheckBottleUnder_filled(filePath);
        % Underfilled then it cannot be Overfilled
        if Underfilled == 1
            disp('Bottle is Underfilled');
        end
        
        labelmissing = CheckMissingLabel(filePath);
        
        if labelmissing == 1
                disp('Label is Missing');
                overfilled = CheckBottleOver_filled(filePath);
                     if overfilled == 1
                        disp('Bottle is Overfilled')
                     end
        else
            labelnotPrinted = LabelNotPrinted(filePath);
            if labelnotPrinted == 1
                disp('Label not printed')
                overfilled = CheckBottleOver_filled(filePath);
                     if overfilled == 1
                        disp('Bottle is Overfilled')
                     end
            elseif labelnotPrinted == 0 && Underfilled == 0
                labelnotstraight = CheckIfLabelIsStr8t(filePath);
                if labelnotstraight == 1
                   disp('Label is not Straight')
                   overfilled = CheckBottleOver_filled(filePath);
                        if overfilled == 1 
                            disp('Bottle is Overfilled')
                        end
                else
                    bottleDeformed = DeformedBottle(filePath);
                    if bottleDeformed == 1
                        disp('Bottle is Deformed'); 
                    else
                        overfilled = CheckBottleOver_filled(filePath);
                        if overfilled == 1 
                            disp('Bottle is Overfilled')
                     end
                    end 
                end
            
                
            end
        end
    end
    if MissingBottleCap == 0 && Underfilled == 0 && labelmissing == 0 && labelnotPrinted == 0 && overfilled == 0 && labelnotstraight == 0 && bottleDeformed == 0
    disp('Bottle is Standard')
    end
end


function result = DeformedBottle(image)
image = imread(image);
x = imcrop(image,[109.510000000000,163.510000000000,131.980000000000,31.9800000000000]);
red_channel = x(:, :, 1);
imageR = imadjust(red_channel);
BW1 = edge(imageR,'sobel','horizontal');
BW = bwareaopen(BW1,60);
cutskelimg = bwmorph(BW,'skel');
mn =bwmorph(cutskelimg,'endpoints');
[row column] = find(mn);
x = length(column);
if (column(x)-column(1)) < 110
    result = 1;
else
    result = 0;
end
end



function file_ = GetFileFromDirectory(Path)

if ~isdir(Path)
    disp('no such directory exists');
    return;
end

filePath = fullfile(Path, '*.jpg');
file_ = dir(filePath);
end

function ans = LabelNotPrinted(image)
x = imread(image);
x = imcrop(x,[124.510000000000,192.510000000000,109.980000000000,67.9800000000000]);
image = rgb2gray(x);
BW = imbinarize(image, double(145/256));
nBlack = sum(BW(:) == 0);
nWhite = numel(BW(:));
percentage = nBlack/nWhite;
if percentage < 0.50;
    ans = 1;
else
    ans = 0;
end
end

function ans = CheckMissingBottle(image)
x = imread(image);
cropped_x = imcrop(x,[159.510000000000,9.51000000000000,41.9800000000000,276.980000000000]);

grey_cropped_x = rgb2gray(cropped_x);
BW = imbinarize(grey_cropped_x, double(150/256));

nBlack = sum(BW(:) == 0);
nWhite = numel(BW(:));
percentage = nBlack/nWhite;

if percentage < 0.10
    ans = 1;
else
    ans = 0;
end
end

function ans = CheckMissingLabel(image)
x = imread(image);
x = imcrop(x,[124.510000000000,192.510000000000,109.980000000000,67.9800000000000]);
image = rgb2gray(x);
BW = imbinarize(image, double(45/256));
nBlack = sum(BW(:) == 0);
nWhite = numel(BW(:));
percentage = nBlack/nWhite;
if percentage > 0.50;
    ans = 1; 
else
    ans = 0;
end
end

function ans = CheckIfLabelIsStr8t(image)
x = imread(image);
x = imcrop(x,[118.510000000000,154.510000000000,106.980000000000,100.980000000000]);
red_channel = x(:, :, 1);
imageR = imadjust(red_channel);
BW1 = edge(imageR,'sobel','horizontal');
BW = bwareaopen(BW1,45);
cutskelimg = bwmorph(BW,'skel');
mn =bwmorph(cutskelimg,'endpoints');
[row column] = find(mn);
x = length(column);
Angle1 = atan((row(x)- row(1))/(column(x)-column(1)));
if Angle1 > 0.08 && (column(x)-column(1)) < 120
    ans = 1;
else
    ans = 0;
end
end

function ans = CheckBottleUnder_filled(image)
image = imread(image);
image = rgb2gray(image);
I2 = imcrop(image,[136.510000000000,148.510000000000,79.9800000000000,10.9800000000000]);
BW = imbinarize(I2, double(150/256));
BW = imfill(BW,'holes');
nBlack = sum(BW(:) == 0);
nWhite = numel(BW(:));
percentage = nBlack/nWhite;
if percentage < 0.25
    ans = 1;
else
    ans = 0;
end
end

function ans = CheckBottleOver_filled(image)

image = imread(image);
I2 = imcrop(image,[162.510000000000,84.5100000000000,25.9800000000000,80.9800000000000]);
I2 = rgb2gray(I2);
BW = imbinarize(I2, double(100/256));
BW = imfill(BW,'holes');

nBlack = sum(BW(:) == 0);
nWhite = numel(BW(:));
percentage = nBlack/nWhite;

if percentage > 0.4
    ans  = 1;
else
    ans = 0;
end
end

function ans = BottleTopMissing(image)
x = imread(image);
x = imcrop(x,[133.510000000000,3.51000000000000,75.9800000000000,54.9800000000000]);
YCBCR = rgb2ycbcr(x);
red_channel = YCBCR(:,:,3);
imageR = imadjust(red_channel);
BW = imbinarize(red_channel, double(170/256));
nBlack = sum(BW(:) == 0);
nWhite = numel(BW(:));
percentage = (nBlack/nWhite);
if percentage > 0.8
    ans = 1;
else 
    ans = 0;
end
end
