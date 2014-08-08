%% to assign state value to the points of the regions within the water 
%  vidFile: means the video file, and take care that it is the video file
%  not one frame from the video
%  index_group: means the index_group that are wanted to build states, through which we
%  can direct several specified point in the region
function build_point_state_by_index_group(vidFile, index_group)  
    
    global mask_points_global; 
    % Read video
    vid = VideoReader(vidFile); 
    
    % Extract video info 
    vidHeight = vid.Height; 
    vidWidth = vid.Width; 
    nChannels = 3; 
    
    % fr = vid.FrameRate;
    len = vid.NumberOfFrames;
    
    temp = struct('cdata', ...
		  zeros(vidHeight, vidWidth, nChannels, 'uint8'), ...
		  'colormap', []); 
      
    startIndex = 1; 
    endIndex = len; 
    
    % get the length of index_group
    len_index_group = length(index_group);              
    
    % assign indexical point's bright value with gray_frame gray value
    for i = startIndex : endIndex   
        
        temp.cdata = read(vid, i);          
        [rgbframe,~] = frame2im(temp);    
        gray_frame = rgb2gray(rgbframe); 
        for j = 1 : len_index_group
            
            index = index_group(j); 
            % get the indexical mask point   
            x = mask_points_global(index).x; 
            y = mask_points_global(index).y;          
            mask_points_global(index).brightValue(i) = gray_frame(x, y);        
        end  
    end
    
%     % extract gray frames from the video 
%     gray_frames_video = frame_collection_get_from_video(vidFile); 
%     
%     len = length(gray_frames_video); 
%     point = mask_points_global(index); 
%     x = point.x; 
%     y = point.y; 
%     for i = 1 : len
%         point.brightValue(i) = gray_frames_video(x, y, i); 
%     end
end                     