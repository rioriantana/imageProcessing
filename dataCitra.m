I=imread('images.jpg');
gr=rgb2gray(I);
gr=flipud(gr);
%gr=transpose(gr);
yy=double(gr);
set(pcolor(yy), 'EdgeColor', 'none');