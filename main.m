%% call the frameGet function to save one image
clear;

dataDir = './data';
resultsDir = 'ResultsS&P2014'; 

%% water
inFile = fullfile(dataDir, 'water.avi'); 
fprintf('Processing %s\n', inFile); 

% extract one frame from the video
frame_get_from_video(inFile, resultsDir); 
%%