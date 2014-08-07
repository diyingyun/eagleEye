%% to assign state value to the points of the regions within the water 
%  vidFile: means the video file, and take care that it is the video file
%  not one frame from the video

function build_point_state(vidFile)  
    
    % extract gray frames from the video 
    gray_frames_video = frame_collection_get_from_video(vidFile); 
    
    len = length(gray_frames_video); 
    len_mask = length(mask_points_global); 
    % get the mask points' bright value
    for i = 1 : len
        for j = 1 : len_mask
            point = mask_points_global(j); 
            point.brightValue(i) = gray_frames_video(point.x, point.y, i); 
        end 
    end
end                     