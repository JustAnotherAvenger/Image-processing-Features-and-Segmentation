%read the image
img = imread('peppers.png');
img = img(:,:,1);

Gx = double([-1 0 1;-2 0 2;-1 0 1]);
Gy = double([-1 -2 -1; 0 0 0; 1 2 1]);

padimg = double(padarray(img, [1 1]));
Fx = double(zeros(size(img,1), size(img,2)));
Fy = double(zeros(size(img,1), size(img,2)));
FMag = double(zeros(size(img,1), size(img,2)));

for ii = 2:size(padimg,1)-1
    for jj = 2:size(padimg,2)-1
        Fx(ii-1,jj-1) = sum(sum(Gx.*padimg(ii+1:-1:ii-1,jj+1:-1:jj-1)));
        Fy(ii-1,jj-1) = sum(sum(Gy.*padimg(ii+1:-1:ii-1,jj+1:-1:jj-1)));
%% The lines below can also be used in this case since the sobel operator is symmetric about a central axis.
%         Fx(ii-1,jj-1) = sum(sum(rot90(Gx,2).*padimg(ii-1:ii+1,jj-1:jj+1)));
%         Fy(ii-1,jj-1) = sum(sum(rot90(Gy,2).*padimg(ii-1:ii+1,jj-1:jj+1)));
        FMag(ii-1,jj-1)  = sqrt(Fx(ii-1,jj-1).^2+Fy(ii-1,jj-1).^2);
        
    end
end



% uncomment the code as needed
figure
imshow(img);
title('Original Image');
figure
imshow((abs(Fx))./max(max(Fx)))
title('Gradient in X direction');
figure
imshow(abs(Fy)./max(max(Fy)))
title('Gradient in Y direction');
figure
imshow(FMag./max(max(FMag)))
title('Gradient Magnitude');