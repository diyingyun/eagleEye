%% extract gray frames from the video 
%  vidFile: means the video file, and take care that it is the video file
%  not one frame from the video

function gray_frames_video = frame_collection_get_from_video(vidFile)
    
    % Read video
    vid = VideoReader(vidFile); 
    % Extract video info 
    vidHeight = vid.Height; 
    vidWidth = vid.Width; 
    nChannels = 3; 
%     fr = vid.FrameRate;
    len = vid.NumberOfFrames;
    
    temp = struct('cdata', ...
		  zeros(vidHeight, vidWidth, nChannels, 'uint8'), ...
		  'colormap', []);
    
    startIndex = 1; 
    endIndex = len; 
    % Initialize the gray_frames_video such as to improve the execution 
    % speed  
    gray_frames_video = zeros(vidWidth,vidHeight, len); 
    
    for i = startIndex : endIndex
        
        temp.cdata = read(vid, startIndex); 
        [rgbframe,~] = frame2im(temp);          
        
%         frame = im2double(rgbframe);
        % collect the gray frames of the video   
        gray_frames_video(:, :, i) = rgb2gray(rgbframe); 
    end
%     frame = ind2gray(rgbframe);
        
%     frame = temp.cdata;  
    % To illustrate the 
%     imwrite(frame, outName); 
end