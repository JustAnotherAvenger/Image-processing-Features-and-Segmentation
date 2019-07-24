img = imread('pout.tif');
% imshow(img)
[H,binLocations] = imhist(img);

Hc = cumsum(H);

for ii = 1:length(Hc)
    T(ii) = round(255*Hc(ii)/(size(img,1)*size(img,2)));
end

% plot(T)

for i = 1:size(img,1)         %go through rows
    for j = 1:size(img,2)     %columns
        img_heq(i, j) = T(img(i,j) + 1);
    end
end

img_heq = uint8(img_heq);
imshow(img_heq)

plot(Hc,'r')
max(Hc(:))
(size(img,1)*size(img,2))