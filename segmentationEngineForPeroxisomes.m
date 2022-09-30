function [] = segmentationEngineForPeroxisomes(im)
%gaf

%Save image as variable
double_im=mat2gray(double(im));
[x, y] = size(im);

%Close image with a disk the size of the background fluctuations.
disk = strel('disk', 1, 4); %this is a temporary value, don't know what to use
double_im_close = double(imclose(double_im, disk));
imtool(double_im_close, []);

%Open closed image with disk larger than largest nucleus
disklarge = strel('disk', 200, 4);
double_im_open = imopen(double_im_close, disklarge);
imtool(double_im_open);


%% Subtract opened image from original
%CAKI1_DNA_clean2 = (CAKI1_DNA-CAKI1_DNA_openlarge2);
clean_im = (double(double_im) - double(double_im_open));

%Collect the region of the image that has negative values.
bw = clean_im < 0; %Negative values (in background) appear as ones in a binary image
diskbw = strel('disk', 30, 4); %10 is a rather aggressive value, but it seems to work for relatively
%circular objects, like nuclei
bw2 = single(imclose(bw, diskbw)); %Fill in holes in background
%bw2 = imfill(bw2, 'holes'); %especially good for nucleolus holes
imtool(bw2)



%Spot cells.
%Resize to smooth
small = imresize(clean_im, 1/10); %reduce image to a tenth of its size
filt = imgaussfilt(small, 4);

%Find seeds
%bring back to OG size to smooth
seeds = imregionalmax(filt);
seeds2 = single(imresize(seeds, [x y]));
imtool(seeds2)
seeds3 = roifilt2(0, seeds2, bw2);
imtool(seeds3)

%Extract x,y coordinates of seeds. [I]=rows (y-axis), [J]=columns (x-axis)
[I,J] = find(seeds3);

%{
%Display original image with seeds.
figure
imshow(im,[])
hold on
plot(J,I,'.g')
%}

% Separate touching cells

% Transform image so nuclei are darker than background. Impose local minima
% at seed positions and watershed.
clean_trans = -(double(clean_im));
clean_min = imimposemin(clean_trans,seeds3);
clean_wat = watershed(clean_min);
bgm = clean_wat == 0;
imtool(bgm);
imtool(clean_wat,[])
[clean_seg]=showseg(clean_im, clean_wat); %Display segmented image.

imtool(clean_seg,[])
end
