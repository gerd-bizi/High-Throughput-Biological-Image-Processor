function [stack] = getChannel(reader, channel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
slices = reader.getSizeZ();
x = reader.getSizeX();
y = reader.getSizeX();

imageStack = zeros(x, y, slices);

for slice=1:slices
    iPlane = reader.getIndex(slice - 1, channel - 1, 0) + 1;
    imageStack(:,:,slice) = bfGetPlane(reader, iPlane);
end

stack = imageStack;

end