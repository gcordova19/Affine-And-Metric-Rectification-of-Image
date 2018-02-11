function [Image_output] = affine_rectification(Input)

figure(1)
output=get_points(Input,1);
Input = imread(Input);
imshow(Input)
temp_out = output;
title('Select any four points in images')
xlabel('Press enter once done')
[x,y] = getpts;
close Figure 1

point1 = [x(1) y(1) 1];
point2 = [x(2) y(2) 1];
point3 = [x(3) y(3) 1];
point4 = [x(4) y(4) 1];

l1 = cross(point1,point2);
l2 = cross(point3,point4);
m1 = cross(point2,point3);
m2 = cross(point1,point4);

a = cross(l1,l2);
a = a/a(1,3);
b = cross(m1,m2);
b = b/ b(1,3);
vanish_line = cross(a,b);

H = [1 0 0; 0 1 0; vanish_line(1, 1)/vanish_line(1,3) vanish_line(1, 2)/vanish_line(1,3) 1];
temp = maketform('projective',H);

Image_output = imtransform(Input,temp);
Image_output = temp_out;

end

