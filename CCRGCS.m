faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %Create a detector object
getimage=imread('H:\Ramithaa VJHOG2 AlterationsR\VJHOG\Database\11.jpg'); %Read input image
getimage=rgb2gray(getimage); % convert to gray
BB=step(faceDetector,getimage); % Detect faces
%img = insertObjectAnnotation(getimage, 'rectangle', BB, 'Face'); %Annotate detected faces.
figure(1);
%imshow(img); 
imshow(getimage);
title('Greyscale Image');
%htextinsface = vision.TextInserter('Text', 'face   : %2d', 'Location',  [5 2],'Font', 'Courier New','FontSize', 14);
%imshow(img);
hold on
for i=1:size(BB,1)
    rectangle('position',BB(i,:),'Linewidth',2,'Linestyle','-','Edgecolor','y');
end
hold on
N=size(BB,1);
handles.N=N;
counter=1;
for i=1:N
    face=imcrop(getimage,BB(i,:));
    savenam = strcat('H:\Ramithaa VJHOG2 AlterationsR\VJHOG\Database\' ,num2str(counter), '.jpg'); %this is where and what your image will be saved
    baseDir  = 'H:\Ramithaa VJHOG2 AlterationsR\VJHOG\Database\';  % where the cropped picture will be saved
 %     baseName = 'image_';
    newName  = [baseDir num2str(counter) '.jpg'];
    handles.face=face;
    while exist(newName,'file')
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.jpg'];
    end
    fac=imresize(face,[300,300]);
    imwrite(fac,newName);
figure(2);
imshow(fac); 
title('Face Detected');
   
    pause(.5);
end