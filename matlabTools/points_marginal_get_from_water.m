%% Get the marginal points within the vision of water in the cup

function convexPoints = points_marginal_get_from_water(vidImage) 

    [rows, cols, ~] = size(vidImage); 
    x = [];
    y = []; 

    row_index = 1; 
    col_index = 1; 
    for i = 1 : rows                                        
        for j = 1 : cols
            red = vidImage(i, j, 1); 
            if red >= 240
                x(row_index) = i; 
                y(col_index) = j; 
                row_index = row_index + 1; 
                col_index = col_index + 1;  
            end
        end
    end
    % get the convex hull points
    k = convhull(x, y);   
    convexPoints.xv = x(k); 
    convexPoints.yv = y(k);    
end