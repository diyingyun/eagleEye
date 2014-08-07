%% to assign state value to the points of the regions within the water 
%  vidFile: means the video file, and take care that it is the video file
%  not one frame from the video
%  index: means the index that is wanted to build states, through which we
%  can direct one point in the region
function build_point_state_by_index(vidFile, index)  
    
    % extract gray frames from the video 
    gray_frames_video = frame_collection_get_from_video(vidFile); 
    
    len = length(gray_frames_video); 
    point = mask_points_global(index); 
    x = point.x; 
    y = point.y; 
    for i = 1 : len
        point.brightValue(i) = gray_frames_video(x, y, i); 
    end
end                     