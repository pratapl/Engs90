%Group 19, ENGS 90
%This file loads the saved data matrices and plots graphs. 

%-----------------------------------------------------------------------
%phantoms with bilirubin
%concentration: 0,2,4,6,8,10

%load the data object storing the average r,g,b values for phantoms with bilirubin
averageRed_Bilirubin = load('average_RedIntensity_Bilirubin');
averageGreen_Bilirubin = load('average_GreenIntensity_Bilirubin');
averageBlue_Bilirubin = load('average_BlueIntensity_Bilirubin');

%load the actual matrix
averageRed_Bilirubin = averageRed_Bilirubin.average_RedIntensity;
averageGreen_Bilirubin = averageGreen_Bilirubin.average_GreenIntensity;
averageBlue_Bilirubin = averageBlue_Bilirubin.average_BlueIntensity;


%-----------------------------------------------------------------------
%phantoms with bilirubin
%concentration: 0,2,4,6,8,10

%load the data object storing average r,g,b values for phantoms with dye
averageRed_Dye = load('average_RedIntensity_Dye');
averageGreen_Dye = load('average_GreenIntensity_Dye');
averageBlue_Dye = load('average_BlueIntensity_Dye');

%load the actual matrix
averageRed_Dye = averageRed_Dye.average_RedIntensity;
averageGreen_Dye = averageGreen_Dye.average_GreenIntensity;
averageBlue_Dye = averageBlue_Dye.average_BlueIntensity;

%-----------------------------------------------------------------------
%phantoms with dye
%concentration: 0,1,2,3,4,5,15

averageRed_Dye_1to5 = load('average_RedIntensity_Dye_1to5');
averageGreen_Dye_1to5= load('average_GreenIntensity_Dye_1to5');
averageBlue_Dye_1to5 = load('average_BlueIntensity_Dye_1to5')

%load the actual matrix
averageRed_Dye_1to5 = averageRed_Dye_1to5.average_RedIntensity;
averageGreen_Dye_1to5 = averageGreen_Dye_1to5.average_GreenIntensity;
averageBlue_Dye_1to5 = averageBlue_Dye_1to5.average_BlueIntensity;


%-----------------------------------------------------------------------
%BlueByGreen vs Green
%Dye
blueByGreen_Dye = averageBlue_Dye./averageGreen_Dye;
x1 = averageGreen_Dye(1,:); y1 = blueByGreen_Dye(1,:);
x2 = averageGreen_Dye(2,:); y2 = blueByGreen_Dye(2,:);
x3 = averageGreen_Dye(3,:); y3 = blueByGreen_Dye(3,:);
x4 = averageGreen_Dye(4,:); y4 = blueByGreen_Dye(4,:);
x5 = averageGreen_Dye(5,:); y5 = blueByGreen_Dye(5,:);
x6 = averageGreen_Dye(6,:); y6 = blueByGreen_Dye(6,:);


figure
subplot(2,2,1);
plot(x1,y1,'ro',x2,y2,'gx',x3,y3,'b+',x4,y4,'c*',x5,y5,'ms',x6,y6,'kd');
xlabel('Green');
ylabel('Blue/Green');
title('Iso-Bilirubin Curves-Dye');
legend('0mg/dL','2mg/dL','4mg/dL','6mg/dL','8mg/dL','10mg/dL','Location','northeast',...
'LineWidth',6);

%Bilirubin
blueByGreen_Bilirubin = averageBlue_Bilirubin./averageGreen_Bilirubin;
x1 = averageGreen_Bilirubin(1,:); y1 = blueByGreen_Bilirubin(1,:);
x2 = averageGreen_Bilirubin(2,:); y2 = blueByGreen_Bilirubin(2,:);
x3 = averageGreen_Bilirubin(3,:); y3 = blueByGreen_Bilirubin(3,:);
x4 = averageGreen_Bilirubin(4,:); y4 = blueByGreen_Bilirubin(4,:);
x5 = averageGreen_Bilirubin(5,:); y5 = blueByGreen_Bilirubin(5,:);
x6 = averageGreen_Bilirubin(6,:); y6 = blueByGreen_Bilirubin(6,:);
subplot(2,2,2);
plot(x1,y1,'ro',x2,y2,'gx',x3,y3,'b+',x4,y4,'c*',x5,y5,'ms',x6,y6,'kd');
xlabel('Green');
ylabel('Blue/Green');
title('Iso-Bilirubin Curves-Bilirubin');
legend('0mg/dL','2mg/dL','4mg/dL','6mg/dL','8mg/dL','10mg/dL','Location','northeast',...
'LineWidth',6);

%1to5 + 15
%Bilirubin
blueByGreen_1to5 = averageBlue_Dye_1to5./averageGreen_Dye_1to5;
x1 = averageGreen_Dye_1to5(1,:); y1 = blueByGreen_1to5(1,:);
x2 = averageGreen_Dye_1to5(2,:); y2 = blueByGreen_1to5(2,:);
x3 = averageGreen_Dye_1to5(3,:); y3 = blueByGreen_1to5(3,:);
x4 = averageGreen_Dye_1to5(4,:); y4 = blueByGreen_1to5(4,:);
x5 = averageGreen_Dye_1to5(5,:); y5 = blueByGreen_1to5(5,:);
x6 = averageGreen_Dye_1to5(6,:); y6 = blueByGreen_1to5(6,:);
x7 = averageGreen_Dye_1to5(7,:); y7 = blueByGreen_1to5(7,:);

subplot(2,2,3);
plot(x1,y1,'ro',x2,y2,'gx',x3,y3,'b+',x4,y4,'c*',x5,y5,'ms',x6,y6,'kd',x7,y7,'bo');
xlabel('Green');
ylabel('Blue/Green');
title('Iso-Bilirubin Curves-Dye');
legend('0mg/dL','1mg/dL','2mg/dL','3mg/dL','4mg/dL','5mg/dL','15mg/dL','Location','northeast',...
'LineWidth',6);


%-----------------------------------------------------------------------
%BlueByRed vs Red
%
%Dye
blueByRed_Dye = averageBlue_Dye./averageRed_Dye;
x1_Dye = averageRed_Dye(1,:); y1_Dye = blueByRed_Dye(1,:);
x2_Dye = averageRed_Dye(2,:); y2_Dye = blueByRed_Dye(2,:);
x3_Dye = averageRed_Dye(3,:); y3_Dye = blueByRed_Dye(3,:);
x4_Dye = averageRed_Dye(4,:); y4_Dye = blueByRed_Dye(4,:);
x5_Dye = averageRed_Dye(5,:); y5_Dye = blueByRed_Dye(5,:);

% 
% figure
% subplot(1,2,1);
% plot(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5);
% xlabel('Red');
% ylabel('Blue/Red');
% title('Iso-Bilirubin Curves-Dye');
% legend('0mg/dL','4mg/dL','6mg/dL','8mg/dL','10mg/dL','Location','northeast',...
% 'LineWidth',6);

% Bilirubin
blueByRed_Bilirubin = averageBlue_Bilirubin./averageRed_Bilirubin;
x1_Bil = averageRed_Bilirubin(1,:); y1_Bil = blueByRed_Bilirubin(1,:);
x2_Bil = averageRed_Bilirubin(2,:); y2_Bil = blueByRed_Bilirubin(2,:);
x3_Bil = averageRed_Bilirubin(3,:); y3_Bil = blueByRed_Bilirubin(3,:);
x4_Bil = averageRed_Bilirubin(4,:); y4_Bil = blueByRed_Bilirubin(4,:);
x5_Bil = averageRed_Bilirubin(5,:); y5_Bil = blueByRed_Bilirubin(5,:);

% subplot(1,2,2);
% plot(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5);
% xlabel('Red');
% ylabel('Blue/Red');
% title('Iso-Bilirubin Curves-Bilirubin');
% legend('0mg/dL','4mg/dL','6mg/dL','8mg/dL','10mg/dL','Location','northeast',...
% 'LineWidth',6);



% %plot(x1_Bil,x1_Dye,x2_Bil,x2_Dye,x3_Bil,x3_Dye,x4_Bil,x4_Dye,x5_Bil,x5_Dye);
% scatter(x2_Bil,x2_Dye);
% xlabel('bilirubin')
% ylabel('dye')




