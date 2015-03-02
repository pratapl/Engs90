
imageLocation1 = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\1-36\';
imageLocation2 = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\37-72\';
imageLocationBilirubin = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\37-72\';  

%location of images taken on 2-20
%there are 42 different samples with varying dye concentration from
%0-15 mg/dL
imageLocation3 = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\2-20\'

for i = 1:42
    index = num2str(i);
    filename = strcat(imageLocation3,'red_',index,'.jpg');
    sampleImage = imread(filename);
    regionOfInterest = sampleImage(1400:1800,3200:3600,:);
    imshow(regionOfInterest);
    size(regionOfInterest)
    pause(0.20);
end

