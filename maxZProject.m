function[vol] = maxZProject(zStack)
%MAXZPROJECT returns a maximum z-projection of the given stack for an image

num_x = size(zStack, 1);
num_y = size(zStack, 2);
num_z = size(zStack, 3);

max_proj = zeros(num_x, num_y);

for row=1:num_x
    for col=1:num_y
        max = 0;
        for depth=1:num_z
            if (zStack(row, col, depth) > max)
                max = zStack(row, col, depth);
            end
        end
        max_proj(row, col) = max;
    end
end

vol = max_proj;

return