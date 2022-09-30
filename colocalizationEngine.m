function [colocalizationValues] = colocalizationEngine(c1Stack, c2Stack, L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

values = zeros(size(L, 1), 1);

for regionNum = 1 : size(L, 1)
    stackValues = zeros(1, size(c1Stack, 3));
    regionBlob = L(regionNum).PixelIdxList;
    for stack = 1 : size(c1Stack, 3)
        c1Im = c1Stack(:,:,stack);
        c2Im = c2Stack(:,:,stack);
        c1Blob = size(regionBlob, 1);
        c2Blob = size(regionBlob, 1);
        for pix = 1 : size(regionBlob, 1)
            c1Blob(pix) = c1Im(regionBlob(pix));
            c2Blob(pix) = c2Im(regionBlob(pix));
        end
        stackValues(stack) = corr2(c1Blob, c2Blob);
    end
    values(regionNum) = mean(stackValues);
end

colocalizationValues = values;

end