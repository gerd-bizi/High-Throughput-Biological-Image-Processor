function [maxIm] = totalIm(reader)

channels = reader.getSizeC();

im = [];

for i = 1 : channels
    tempIm = reader.getChannel(i);
    maxZ = maxZProject(tempIm);
    im(:, :, i) = maxZ;
end

maxIm = maxZProject(im);

end