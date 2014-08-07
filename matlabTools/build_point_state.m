%% to assign state value to the points of the regions within the water 
%  vidFile: means the video file, and take care that it is the video file
%  not one frame from the video

function build_point_state(vidFile)  
    
    global mask_points_global; 
    
    % Read video
    vid = VideoReader(vidFile); 
    
    % Extract video info 
    vidHeight = vid.Height; 
    vidWidth = vid.Width; 
    nChannels = 3; 
    
    % fr = vid.FrameRate;
    len = vid.NumberOfFrames;       
    len_mask = length(mask_points_global);              
    
    temp = struct('cdata', ...
		  zeros(vidHeight, vidWidth, nChannels, 'uint8'), ...
		  'colormap', []);
    % get the indexical mask point 
      
    startIndex = 1; 
    endIndex = len; 
    
    % assign every point's bright value with gray_frame gray value 
    for i = startIndex : endIndex
        for index = 1 : len_mask
            temp.cdata = read(vid, i);          
            [rgbframe,~] = frame2im(temp);    
            gray_frame = rgb2gray(rgbframe); 
            point = mask_points_global(index); 
            x = point.x; 
            y = point.y;   
            point.brightValue(i) = gray_frame(x, y);                
        end
    end                         
end                     