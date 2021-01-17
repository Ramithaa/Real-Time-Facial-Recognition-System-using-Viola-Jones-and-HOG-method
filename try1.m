faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %Create a detector object
getimage=imread('H:\Ramithaa VJHOG2 AlterationsR\VJHOG\Database\13.jpg'); %Read input image
%getimage=imread('H:\Ramithaa VJHOG2\VJHOG\Database\11.jpg'); %Read input image
%H:\Ramithaa VJHOG2\VJHOG\Database\Ramithaa\.jpg


getimage=rgb2gray(getimage); % convert to gray
%BB=step(faceDetector,getimage); % Detect faces
%getimage = insertObjectAnnotation(getimage, 'rectangle', BB, 'Face'); %Annotate detected faces.
figure(1);
imshow(getimage); 
title('Detected face');
imshow(getimage);
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
    savenam = strcat('H:\Ramithaa VJHOG2\VJHOG\Database\' ,num2str(counter), '.jpg'); %this is where and what your image will be saved
    baseDir  = 'H:\Ramithaa VJHOG2\VJHOG\Database\Ramithaa\';
    baseName = 'image_';
    newName  = [baseDir num2str(counter) '.jpg'];
    handles.face=face;
    while exist(newName,'file')
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.jpg'];
    end
    face=imresize(face,[112,92]);
    imwrite(face,newName);
figure(2);
imshow(face); 
title('crop pic');
   
    pause(.5);
end