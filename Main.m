Input_image = 'img1.gif';
affine_rect_output = affine_rectification(Input_image);
affine_res = imshow(affine_rect_output);
saveas(affine_res,'affine_rect_result.jpg');

metric_rect_output = Metric_rectification(Input_image);
metric_res = imshow(metric_rect_output);
saveas(metric_res,'metric_rect_result.jpg');
