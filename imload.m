function [mod_im] = imload(filename)
%IMLOAD processes a Bio Format Image into a usable double image
%It uses bfmatlab's imread to get the compatible bioformat image
%and then it converts the photos into a scaled double image using mat2gray
%finally, it uses maxZ for image segmentation reasons
im = bfopen(filename);
im = mat2gray(im);
im = maxZProject(im);
mod_im = im;
end

