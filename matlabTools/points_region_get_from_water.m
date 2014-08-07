%% Get the region points within the vision of water in the cup
% vidImage: one frame from the video
% region_points: the region points

function region_points = points_region_get_from_water(vidImage)    

    [rows, cols, ~] = size(vidImage);       
    convexPoints = points_marginal_get_from_water(vidImage); 
    % get x vector, get y vector
    xv = convexPoints.xv; 
    yv = convexPoints.yv; 

    polyX = [];
    polyY = []; 
    row_index = 1; 
    col_index = 1; 
    index = 1; 
    % find the points in the polygon, namely, the convex hull;
    for i = 1 : rows
        for j = 1 : cols
            region_points_global(i, j) = 0; 
            in  = inpolygon(i, j, xv, yv); 
            if in == true
                polyX(row_index) = i; 
                polyY(col_index) = j; 
                % assign the region_points_global(i, j) to one which means this pixel is our interest    
                region_points_global(i, j) = 1; 
                % region_points is the interested regions we want
                region_points(index).x = i; 
                region_points(index).y = j; 
                
                row_index = row_index + 1; 
                col_index = col_index + 1;   
                index = index + 1; 
            end   
        end
    end 
%     region_points.polyX = polyX; 
%     region_points.polyY = polyY; 
end