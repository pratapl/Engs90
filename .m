%Pratap Luitel
%Engs 90
%2/22/2015

%Returns the averaged values of red, green and blue channels seprately
%of an image imageSample
function average_RGB = calculateAverageRGB(imageSample)

% INPUT     
%  imageSample : [m x n x k] matrix containing red,green and blue channels

% OUTPUT
%  averageRGB  : [1 x 3], columns represent the average of the red, green
%                blue channel respectively

[mRows,nColumns,nChannels] = size(imageSample);
average_RGB = mean(mean(imageSample));




end

    