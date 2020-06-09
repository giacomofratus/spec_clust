function img = clust_pixels(pixels,idx,k)
%Returns a square image with pixels clustered according to idx. Each group
%is given an intensity that is the average of all the pixels in its group

pix_int = zeros(k,1);

%Get pixel intensities for each group
for i = 1:k
    pix_int(i) = sum(pixels.*(idx == i))./sum((idx == i));
end

%assign intesities to each group
for i = 1:size(pixels,1)
    pixels(i) = pix_int(idx(i))./255;
end

%upscale image back to original 512x512
pixels = reshape(pixels,sqrt(size(pixels,1)),sqrt(size(pixels,1)));
img = imresize(pixels, [512 512]);
end

