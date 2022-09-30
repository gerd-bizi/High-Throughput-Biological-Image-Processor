function[vol] = avgZProject(zStack)
%MAXZPROJECT returns a maximum z=projection of the given stack for an image

num_x = size(zStack, 1);
num_y = size(zStack, 2);
num_z = size(zStack, 3);

max_proj = zeros(num_x, num_y);

for row=1:num_x
    for col=1:num_y
        for depth=1:num_z
            max_proj(row, col) = max_proj(row, col) + zStack(row, col, depth);
        end
        max_proj(row, col) = max_proj(row, col) / num_z;
    end
end

vol = max_proj;

return