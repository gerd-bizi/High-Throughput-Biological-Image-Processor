function [I2,xx,yy]=linescan(im)
% retrieves the intensity of the image along a selected line. 
% im = image
% running the script will open the image in a figure window. Then, you must select (click) 
% two points on the image with the mouse. A line will be plotted connecting these 2 points.
% to plot the intensities along that line write: plot(im(I2))
 
% OUTPUTS
% xx : x coordinates of 2 endpoints
% yy : y coordinates of 2 endpoints
% xy1 : x,y coordinates of first point on line
% xy2 : x,y coordinates of last point on line
% I_intensity : vector containing intensity values for each of 100 points along line
% I2 : vector containing linear indices of each of 100 points along line
 
figure
imshow(im,[])
[xx, yy] = getline;
counter=0;
xy1=[xx(1) yy(1)];
xy2=[xx(2) yy(2)];
for p=0:0.01:1
    counter=counter+1;
    xy=round(xy2*p+xy1*(1-p));
    I_intensity(counter)=im(xy(2),xy(1));
    I2(counter) = sub2ind(size(im),xy(2),xy(1));
end
h=line(xx,yy);
figure
plot(im(I2(2:end)),'-r')