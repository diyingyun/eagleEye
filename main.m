%% call the frameGet function to save one image
clear;

addpath('./matlabTools');
dataDir = './data';
resultsDir = 'ResultsS&P2014'; 

% global variable 
global mask_points_global; 
global region_points_global; 

%% water
inFile = fullfile(dataDir, 'water.avi'); 
fprintf('Processing %s\n', inFile); 

% use the color to detect marginal points
rgb_frame = imread([resultsDir '/water_process.bmp']);                 

[rows, cols, ~] = size(rgb_frame); 
polyX = [];
polyY = []; 

mask_points_global = points_region_get_from_water(rgb_frame); 
polyX = arrayfun(@(citation) citation.x, mask_points_global); 
polyY = arrayfun(@(citation) citation.y, mask_points_global);

plot(polyX, polyY, '.-r');  

% len = length(mask_points_global); 
% build_point_state(inFile); 
% var_bright = []; 
% for i = 1 : len
%    var_bright(i) = mask_points_global(i).brightValue; 
% end 
index = 50;
build_point_state_by_index(inFile, index); 
subplot(4, 1, 1); plot(mask_points_global(index).brightValue); 
title('50th');

index = 500; 
build_point_state_by_index(inFile, index); 
subplot(4, 1, 2); plot(mask_points_global(index).brightValue); 

index = 1000; 
build_point_state_by_index(inFile, index); 
subplot(4, 1, 3); plot(mask_points_global(index).brightValue); 

index = 4000; 
build_point_state_by_index(inFile, index); 
subplot(4, 1, 4); plot(mask_points_global(index).brightValue); 

% % extract one frame from the video 
% gray_frame = graying_frame_from_video(inFile, resultsDir); 

% gray_frame = graying_frame([resultsDir '/water.bmp'], resultsDir); 

% % detect the edge from the pictures
% se=strel('square',3);
% grad=imdilate(gray_frame,se)-imerode(gray_frame,se);
% % figure,imshow(grad);
% figure,imshow(frame_binaryzation(grad, 0.035));               
% 
% BW = edge(frame_binaryzation(grad), 'canny'); 
% % figure, imshow(BW); 

% points_marginal_get_from_water(gray_frame);   
%%