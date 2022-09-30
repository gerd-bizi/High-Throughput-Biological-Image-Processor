function [imn]=NormalizeImage(im,varargin)

IM=im2double(im);
imn=(IM-min(IM(:)))/(max(IM(:))-min(IM(:)));

if ~isempty(varargin)
imn=(IM-varargin{1}(1))/(varargin{1}(2)-varargin{1}(1));
end