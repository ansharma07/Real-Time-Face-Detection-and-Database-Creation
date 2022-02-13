close all;
clear all;
clc;


%% installation of camera
cam=webcam;

%% taking the one snapshot
videoFrame=snapshot(cam);

%% finding the size of video FRAME
framesize=size(videoFrame);

%% creating a videoplayer object with the same frame size to display proper frame
videoPlayer =vision.VideoPlayer('Position',[100 100 [framesize(2),framesize(1)]]);

%% creating a loop
runloop= true;
while runloop
    
    Img =snapshot(cam);
    [CroppedImage, bboxPoints]=myfacedetect(Img);
    bboxPolygon=reshape(bboxPoints',1,[])
    videoFrame =insertShape(Img,'Polygon',bboxPolygon,'LineWidth',4);
    step(videoPlayer,videoFrame);
    
    
end


clear cam;
release(videoPlayer);





