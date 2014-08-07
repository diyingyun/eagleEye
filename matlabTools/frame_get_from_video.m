%% extract one frame from the video 

function frame = frame_get_from_video(vidFile)
    
    % Read video
    vid = VideoReader(vidFile); 
    % Extract video info 
    vidHeight = vid.Height; 
    vidWidth = vid.Width; 
    nChannels = 3; 
    
    temp = struct('cdata', ...
		  zeros(vidHeight, vidWidth, nChannels, 'uint8'), ...
		  'colormap', []);
    % First frame
    index = 1;  
    temp.cdata = read(vid, index); 
     [rgbframe,~] = frame2im(temp);
     frame = im2double(rgbframe);
%     frame = ind2gray(rgbframe);
    
%     frame = temp.cdata;  
    % To illustrate the 
%     imwrite(frame, outName); 
end