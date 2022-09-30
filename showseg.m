function [im]=showseg(im,bw)
% im - image

% bw - a bw (binary) mask of segmentation results

imshow(imoverlay(NormalizeImage(im),imdilate(bwperim(bw),strel('disk',1)),[1 0 0]))
im=imoverlay(NormalizeImage(im),imdilate(bwperim(bw),strel('disk',1)),[1 0 0]);