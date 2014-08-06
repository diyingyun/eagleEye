%% extract one frame from the video

function frame_get_from_video(vidFile, outDir)
    
    [~, vidName] = fileparts(vidFile);
    outName = fullfile(outDir, [vidName '.bmp']); 
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
%     [rgbframe,~] = frame2im(temp);
%     rgbframe = im2double(rgbframe);
%     frame = rgb2ntsc(rgbframe);
    
    frame = temp.cdata; 
    
    imwrite(frame, outName); 
end