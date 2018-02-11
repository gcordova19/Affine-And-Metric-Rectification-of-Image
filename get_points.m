function [output] = get_points(Input,i)

if i==1
    if strcmp(Input,'img1.gif')==1
        output = 'E:\Affine_metric_rectification\img1_aff.jpg';
    elseif strcmp(Input,'img2.jpg')==1
        output = 'E:\Affine_metric_rectification\img2_aff.jpg';
    else
        output = 'E:\Affine_metric_rectification\img3_aff.jpg';
    end
else
    if strcmp(Input,'img1.gif')==1
        output = 'E:\Affine_metric_rectification\img1_met.jpg';
    elseif strcmp(Input,'img2.jpg')==1
        output = 'E:\Affine_metric_rectification\img2_met.jpg';
    else
        output = 'E:\Affine_metric_rectification\img3_met.jpg';
    end
end

end

