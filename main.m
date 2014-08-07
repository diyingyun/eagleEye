%% call the frameGet function to save one image
clear;

addpath('./matlabTools');
dataDir = './data';
resultsDir = 'ResultsS&P2014'; 

%% water
inFile = fullfile(dataDir, 'water.avi'); 
fprintf('Processing %s\n', inFile); 

% use the color to detect marginal points
rgb_frame = imread([resultsDir '/water_process.bmp']); 
hsv_frame = rgb2hsv(rgb_frame);                     

[rows, cols, ~] = size(hsv_frame); 
x = [];
y = []; 

row_index = 1; 
col_index = 1; 
for i = 1 : rows
    for j = 1 : cols
        red = rgb_frame(i, j, 1); 
        if red >= 237
            x(row_index) = i; 
            y(col_index) = j; 
            row_index = row_index + 1; 
            col_index = col_index + 1; 
        	disp([num2str(i) ', ' num2str(j)]); 
        end
    end
end
scatter(x, y, '.')
disp(max(max(rgb_frame(:, :, 1))));              

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