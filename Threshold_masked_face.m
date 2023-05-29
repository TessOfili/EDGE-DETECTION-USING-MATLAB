% Finding the edge using threshold segmentation

imRGB = imread('Face.jpg')  %reading the image
[row,col,dim] = size(imRGB)   % getting the dimension of the image

% using threshood to get the edges
for i =1: row
    for j =1: col
        if (imRGB(i,j,2)<182 & imRGB(i,j,1)<162) & (abs(imRGB(i,j,1)-imRGB(i,j,2))>18)
            im_edge(i,j,:) = imRGB(i,j,:);
        end
    end
end

im_eg = edge(rgb2gray(im_edge));  %converting image to grey

% masking the face 

imHSV = rgb2hsv(imRGB);  % converting to 

% getting the threshold using the image
hT = 0.6; 
sT = 0.3;
vT = 0.9;

Lface = imHSV(:,:,3) <hT & imHSV(:,:,1) >vT & imHSV(:,:,2)< sT;
Lface255 =Lface*255

imFace(:,:,1) = imRGB(:,:,1).*uint8(Lface);
imFace(:,:,2) = imRGB(:,:,2).*uint8(Lface);
imFace(:,:,3) = imRGB(:,:,3).*uint8(Lface);

imFace(970:end,:,:) = 0

% Display of input and output images

figure('Name', 'Threshold Masked Face');
subplot(2,3,1), imshow(imHSV);
title ('HSV');
subplot(2,3,2), imshow(im_edge);
title('Threshold face')
subplot(2,3,3), imshow(im_eg);
title ('Segmented face in grey');
subplot(2,3,4), imshow(Lface255);
title('Mask')
subplot(2,3,5), imshow(imFace);
title ('Seg-Face only');
subplot(2,3,6), imshow(edge(rgb2gray(imFace)));
title ('Edge-Face');
