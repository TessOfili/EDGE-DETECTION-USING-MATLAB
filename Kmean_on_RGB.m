%Kmean On RGB
imRGB = imread('Face.jpg');


% Segment the image into k =2,4,6,8,10 regions

imRGB = uint8(imRGB); % Coverting uint8 for the function of imsegkmeans

[L,Centers] = imsegkmeans(imRGB,2); % 2 regions
B2 = labeloverlay(imRGB,L);


[L,Centers] = imsegkmeans(imRGB,3); % 4 regions
B4 = labeloverlay(imRGB,L);

[L,Centers] = imsegkmeans(imRGB,4); % 6 regions
B6 = labeloverlay(imRGB,L);

[L,Centers] = imsegkmeans(imRGB,8); % 8 regions
B8 = labeloverlay(imRGB,L);


[L,Centers] = imsegkmeans(imRGB,10); % 10 regions
B10 = labeloverlay(imRGB,L);




figure('Name', 'Kmeans on RGB Image');
subplot(2,3,1), imshow(imRGB); title('RGB');
subplot(2,3,2), imshow(B2); title('K=2');
subplot(2,3,3), imshow(B4); title('K=4');
subplot(2,3,4), imshow(B6); title('K=6');
subplot(2,3,5), imshow(B8); title('K=8');
subplot(2,3,6), imshow(B10); title('K=10');
