% Image with sig and Edge with Robert function

% Reading input image for segmentation
I = imread('Face.jpg');


% Adding signature
sig = imread("signature.jpg"); %read the signature
sig = imresize(sig,0.15);      %resizing the signature
[row, col, dim] = size(sig);

I_sig = I  % copy

for i = 1:1:row
    for j = 1:1:col
        I_sig (i,j,1:3) = min(sig(i,j,1:3),I_sig(i,j,1:3));
    end
end   


% converting RGB to HSV
imHSV = rgb2hsv(I);


% Finding edge of HSV image
[row, col, dim] = size(imHSV);
I2 = zeros(row, col);    %create an edge image

for i=1:row-1
    for j=1:col-1
      I2(i,j) = abs(imHSV(i,j)-imHSV(i+1,j+1))+ abs(imHSV(i,j+1)-imHSV(i+1,j));
    end 
end


% Display of input and output images 

figure('Name', 'Image with SIgn and Edge with Robert Function');
subplot(2,2,1), imshow(I);
title('Original')
subplot(2,2,2), imshow(I_sig);
title ('Image with Sig');
subplot(2,2,3), imshow(imHSV);
title ('HSV image');
subplot(2,2,4), imshow(I2);
title ('Edge using Robert Function');

