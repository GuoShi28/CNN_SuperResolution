close all;clc;
if ~exist('imdb')
    imdb = load('./TrainingData/load_upsampling_image_data_8.mat') ;

%     imdb.images.data = single(imdb.images.data(:,:,:,1:192000));
%     imdb.images.labels = single(imdb.images.labels(:,:,:,1:192000));
    imdb.images.data = single(imdb.images.data(:,:,:,1:90000));
    imdb.images.labels = single(imdb.images.labels(:,:,:,1:90000));
    imdb.images.set = imdb.images.set(1,1:90000);
end
[net, info] = GoTraining(imdb);
