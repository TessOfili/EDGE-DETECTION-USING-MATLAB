%Kmean on HSV and using Scharroperator for the Edge Detection

im = imread('Face.jpg');

imHSV = rgb2hsv(im) % converting image to HSV

%segment the image into k= 2, 3, 6, 10 regions
I = uint8(255 * imHSV); % converting uint8 for the conversion of imsegkmean

[L,Centers] = imsegkmeans(I,2); % 2 regions
B2 = labeloverlay(I,L);

[L,Centers] = imsegkmeans(I,3); % 3 regions
B3 = labeloverlay(I,L);

[L,Centers] = imsegkmeans(I,4); % 6 regions
B4 = labeloverlay(I,L);

[L,Centers] = imsegkmeans(I,10); % 10 regions
B10 = labeloverlay(I,L);


% Processing Kmean for k=3 and using Scharr operator to get the edges

% Choose the cluster number
k = 3;
segment = (L == k);
    
% Apply the Scharr operator
Gx = imfilter(double(segment), [-3 0 3; -10 0 10; -3 0 3], 'replicate');
Gy = imfilter(double(segment), [-3 -10 -3; 0 0 0; 3 10 3], 'replicate');
edge_image = sqrt(Gx.^2 + Gy.^2);


figure('Name', 'Kmeans on HSV Image');
subplot(2,3,1), imshow(imHSV); title('imHSV');
subplot(2,3,2), imshow(B2); title('K=2 on HSV');
subplot(2,3,3), imshow(B3); title('K=3 on HSV');
subplot(2,3,4), imshow(B6); title('K=6 on HSV');
subplot(2,3,5), imshow(B10); title('K=10 on HSV');
subplot(2,3,6), imshow(edge_image), title(['Edge-Detected Segment on HSV, ' num2str(k)]);
