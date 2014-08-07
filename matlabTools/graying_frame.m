%% extract one gray frame from the video 

function gray_frame = graying_frame(vidFile, outDir)  
    
    [~, vidName] = fileparts(vidFile);
    outName = fullfile(outDir, [vidName 'ed.bmp']); 
    % Make the picture gray
    gray_frame = rgb2gray(imread(vidFile));  
    
    imwrite(gray_frame, outName); 
end                 