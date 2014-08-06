clear;

dataDir = './data';
resultsDir = 'ResultsSIGGRAPH2012';

mkdir(resultsDir);

%% baby
inFile = fullfile(dataDir,'02.avi');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 10, 16, 0.4, 0.05, 0.1);
%%


