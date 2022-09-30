function[summed_image] = imageAdder(varargin);
%return image with the sum of all the supplied images

%assume that all images have the same dimensions


x_dim = size(varargin{1}, 1);
y_dim = size(varargin{1}, 2);

sum = zeros(x_dim, y_dim);

for i=1:nargin
    for x=1: x_dim
        for y=1: y_dim
            sum(x, y) = sum(x, y) + varargin{i}(x, y);
        end
    end
end

summed_image = sum;

return