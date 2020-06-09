%Giacomo Fratus

clear;
clc;

%Spectral Clustering project - image segmentation

%Constant Parameters
k = 3; %number of clusters
max_dist = 64; %k-nearest neighbor distance
sig1 = 10; %Similarity function sigma 1 
sig2 = 15; %Similarity function sigma 2 

%Import large imgage
image = imread('WILLIAMSBURG.tif');
figure(1);
imshow(image);

%get small region to analyze
image = image(1800:2400,1000:1600);

%Original image
figure(2);
imshow(imresize(image, [512 512]));

%Downscale and reshape image for processing
image = imresize(image, [128 128]);
image = cast(reshape(image,size(image,1)^2,1),'double');



%generate weight matrix and normalized graph laplacian
W = weight_Matrix(image,sig1,sig2,max_dist);
L = norm_graph_lap(W);

%generate eigendecompostion, getting k smallest eigenvectors
[V,D] = eigs(L,k,'smallestabs');

%normalize rows of V
V = normalize(V,2,'norm',2);

%Cluster rows of V to get pixel groups
idx = kmeans(V,k);

%Cluster pixels according to groups in idx
image = clust_pixels(image,idx,k);

%Segmented image
figure(3);
imshow(image);

