% SVM Algorithm
im = imread('Face.jpg');
im = imresize(im, 0.25); % making the process faster
[M,N,dim] = size(im)
im1 = rgb2hsv(im);


%converting an image into a 2d table with each row having RGB values
hs = [reshape(im1(:,:,1),1,[]);
        reshape(im1(:,:,2),1,[]);
        reshape(im1(:,:,3),1,[])];

[dim, no] = size(hs)
x = hs;

y = zeros(no,1);
for i = 1:no
    if x(1,i)<0.2
        y(i) = 1;
    else
        y(i) = -1;
    end
end

% training the svm model
svm = fitcsvm(x',y,'Standardize',true,'KernelFunction','rbf', 'KernelScale','auto');
cv = crossval(svm);
loss = kfoldLoss(cv);
[~,score] = kfoldPredict(cv);
sz_score = size(score);

predX = hs;
for i=1:no
    if score(i,2)<0
        predX(:,i)=0;
    end
end

%reshape back to image
im_pred = zeros(M,N,3);
im_pred(:,:,1) = reshape(predX(1,:),M,N);
im_pred(:,:,2) = reshape(predX(2,:),M,N);
im_pred(:,:,3) = reshape(predX(3,:),M,N);
im_pred_rgb = hsv2rgb(im_pred);


figure('Name', 'SVM on HSV Image');
subplot(1,4,1), imshow(im), title('RGB')
subplot(1,4,2), imshow(im1), title('HSV')
subplot(1,4,3), imshow(mat2gray(im_pred)), title('Predicted HSV');
subplot(1,4,4), imshow(mat2gray(im_pred_rgb)), title('Predicted RGB');
