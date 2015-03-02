%   Group 19, Engs 89
%
% Returns an array with information pertaining to images taken on 2-14-2015.
% The images are of 72 individual phantoms(1-36 with dye, 37-72 with actual
% bilirubin) under three different light sources red, green and blue. 
%
% Input
% -No input required-
%
% Output
% [imageLocation,rowStart,rowEnd,colEnd] : a [1 x 4] vector where
% imageLocation: location of image on the computer. 
% rowStart: starting row for the region of interest 
% rowEnd: ending row for the region of interest
% colStart: starting column for the region of interest
% colEnd: ending column for the region of interest


%imageLocation = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\1-36\';
imageLocationBilirubin = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\37-72\';  

redImage = imread(strcat(imageLocationBilirubin,'red_59.jpg'));

imshow(redImage(1500:1800,2900:3200,:));

mean(mean(redImage(1300:1800,2900:3400,:)))

