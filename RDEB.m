faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %Create a detector object
getimage = imread('H:\Ramithaa VJHOG2 AlterationsR\VJHOG\Database\Ramithaa\1.jpg');
imshow(getimage, 'Border', 'loose')
title('Image Read', 'FontSize', 12, 'FontWeight', 'Bold');


%resize image
getimage = imresize(getimage, [300 300]);


%% Part 4: Train Image captured in the database folder
%%Load Image Information from ATT Face Database Directory
faceDatabase = imageSet('H:\Ramithaa VJHOG2 AlterationsR\VJHOG\Database\Ramithaa','recursive');

%%Split Database into Training & Test Sets
[training,test] = partition(faceDatabase,[0.8 0.2]);

%%Extract and display Histogram of Oriented Gradient Features for single face 
person = 1;
[hogFeature, visualization]= ...
    extractHOGFeatures(read(training(person),1));
figure;
subplot(2,1,1);imshow(read(training(person),1));title('Input Face');
subplot(2,1,2);plot(visualization);title('HoG Feature');


% Extract HOG Features for training set 
trainingFeatures = zeros(size(training,2)*training(1).Count,46656);
featureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        points = detectSURFFeatures(read(training(i),j));
       % trainingFeatures(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabel{featureCount} = training(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = training(i).Description;
end



