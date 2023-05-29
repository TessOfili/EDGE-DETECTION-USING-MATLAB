% Findin the edge using color- segmentation

imRGB =imread('Face.jpg');   %read the image

imHSV = rgb2hsv(imRGB);      %converting RGB image to HSV image

hT = 0.7             %setting the threshold

face_seg = imHSV(:,:,1)>hT;  % red segmentation
face_seg = face_seg*255;


% Display of input and output images
figure('Name', 'Color Segmentation');
subplot(1,3,1), imshow(imRGB);
title('RGB')
subplot(1,3,2), imshow(imHSV);
title ('HSV');
subplot(1,3,3), imshow(face_seg);
title ('segment red');

