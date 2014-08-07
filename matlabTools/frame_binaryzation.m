%% Get the binaryzation of the frame

function binaryzation_frame = frame_binaryzation(vidFrame, level) 

    binaryzation_frame = im2bw(vidFrame, level); 
end

