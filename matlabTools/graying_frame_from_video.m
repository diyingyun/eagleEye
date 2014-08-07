%% extract one gray frame from the video 

function gray_frame = graying_frame_from_video(vidFile, outDir) 
    
    [~, vidName] = fileparts(vidFile);
    outName = fullfile(outDir, [vidName '.bmp']); 
    
    frame = frame_get_from_video(vidFile); 
    gray_frame = rgb2gray(frame); 
    
    imwrite(gray_frame, outName); 
end