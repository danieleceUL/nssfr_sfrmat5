% test_sfrmat5
% Peter Burns, 27 Feb 2023

% 1. GUI execution
% File, ROI, sampling and saving selection
%sfrmat5;


clear all;
close all;
clc;
% 2. Non-GUI execution
[~, total] = imageread;

io = 1;
del = 1;
npol = 5;
wflag = 0;
weight = [];
a = getroi(total);
% Default window, luminance weighting
mask = zeros (size(a(:,:,1)))+1;

%[status, dat1, e, freqval] = sfrmat5(io, del,a, mask, npol, wflag, weight);
[status, dat1, e, freqval] =...
                    sfrmat5(1, 1, a, mask, npol, 0, [.299, .587, .114]); %using tukey window and default weight

figure, plot(dat1(:,1),dat1(:,end))
xlabel('Frequency, cy/pixel')
ylabel('SFR')
axis([0 .7 0 1.05])

disp(['Sampling efficiency: ',num2str(e(1),3),'%'])
disp(['SFR50:      ',num2str(freqval(2),3),' cy/pixel'])
