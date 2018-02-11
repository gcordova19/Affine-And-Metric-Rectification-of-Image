function [Output_Image1] = Metric_rectification(Input)

figure(2)
output=get_points(Input,2);
temp_out = output;
output=get_points(Input,1);
Input = imread(output);
imshow(Input)
title('Select a pairs of orthogonal lines')
xlabel('Press enter once done')
[x,y] = getpts;

l11 = x(1);
l12 = y(1);
l21 = x(3);
l22 = y(3);
m11 = x(2);
m12 = y(2);
m21 = x(4);
m22 = y(4);

Matrix = [l11*m11 (l11*m12 + l12*m11) ; l21*m21 (l21*m22 + l22*m21)];
b = [-l12*m12;-l22*m22];


x = linsolve(Matrix,b);

S = zeros(2);
S(1,1) = x(1);
S(1,2) = x(2);
S(2,1) = x(2);
S(2,2) = 1;

[U,D,V] = svd(S);

square_root_D = sqrt(D);
A = U*square_root_D;
A = A*V;

H2 = eye(3);
H2(1,1) = A(1,1);
H2(1,2) = A(1,2);
H2(2,1) = A(2,1);
H2(2,2) = A(2,2);
if H2(1,1) < 0
    H2(1,1) = -H2(1,1);
elseif H2(2,2) < 0
    H2(2,2) = -H2(2,2);
end
H = H2';

temp = maketform('projective',H);
Output_Image1 = imtransform(Input,temp);
Output_Image1 = temp_out;

end

