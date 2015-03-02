%Group 19, ENGS 90

%read the images
for iterRow = 1:7
    for iterColumn = 1:6
        

    % imageLocationDye = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\1-36\'; 
    % indexDye = num2str((iterRow-1)*6 + iterColumn);
    
%     imageLocationBilirubin = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\bilirubinVsDye\37-72\';  
%     indexBilirubin = num2str(36 + (iterRow-1)*6 + iterColumn);
%     
    tic
    %Location of images taken on 2-20, samples 1-42
    imageLocation3 = 'C:\Users\Pratap\Documents\5th year Dartmouth\ENGS90\Individual Sample Images, 2-20\2-20\';
    indexTemp = num2str((iterRow-1)*6 + iterColumn);
    
    %select the appropriate image location and index value
    imageLocation = imageLocation3;
    index = indexTemp;
    
    redLightImage = strcat(imageLocation,'red_',index,'.jpg');
    greenLightImage = strcat(imageLocation,'green_',index,'.jpg');
    blueLightImage = strcat(imageLocation,'blue_',index,'.jpg');

        if exist(redLightImage, 'file') && exist(greenLightImage, 'file')...
                && exist(blueLightImage,'file')
            %A [m x n x 3] matrix representation of image of m pixel rows, 
            %n pixel columns and 3 channels
            dataRedLightImage = imread(redLightImage);
            dataGreenLightImage = imread(greenLightImage);
            dataBlueLightImage = imread(blueLightImage);
            
            %region of interest(roi) in each image is a subimage at
            %the specified rows and columns interval. The region of
            %interest is the image of the sample phantom under a specific
            %light. 
            roi_RedLightImage = dataRedLightImage(1500:1800,2900:3200,:);
            roi_GreenLightImage = dataGreenLightImage(1500:1800,2900:3200,:);
            roi_BlueLightImage = dataBlueLightImage(1500:1800,2900:3200,:);
            
            %Average the red, green and blue channel intensities of each pic
            average_RedLightImage(iterRow,iterColumn,:) = mean(mean(roi_RedLightImage)); 
            average_GreenLightImage(iterRow,iterColumn,:) = mean(mean(roi_GreenLightImage));
            average_BlueLightImage(iterRow,iterColumn,:) = mean(mean(roi_BlueLightImage));
        else
            fprintf('Filename does not exist ');
        end
    end
    toc
    %select red,green and blue channels from redLightImage,greenLightImage
    %and blueLightImage respectively
    
    average_RedIntensity = average_RedLightImage(:,:,1); %red is the first channel
    average_GreenIntensity = average_GreenLightImage(:,:,2); %green is the second channel
    average_BlueIntensity = average_BlueLightImage(:,:,3); %blue is the third channel
    
    %save the average values in a matrix format
    save('average_RedIntensity_Dye_1to5','average_RedIntensity');
    save('average_GreenIntensity_Dye_1to5','average_GreenIntensity');
    save('average_BlueIntensity_Dye_1to5','average_BlueIntensity');
    
end


