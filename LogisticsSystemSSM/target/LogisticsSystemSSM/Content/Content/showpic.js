<!--

//ͼƬ����������

var flag=false;

function DrawImage(ImgD,ImgW,ImgH){

var image=new Image();

var iwidth =ImgW; //��������ͼƬ��ȣ�����ȴ������ֵʱ�ȱ�����С

var iheight =ImgH; //��������ͼƬ�߶ȣ����߶ȴ������ֵʱ�ȱ�����С

image.src=ImgD.src;

if(image.width>0 && image.height>0){

flag=true;

if(image.width/image.height>= iwidth/iheight){

if(image.width>iwidth){ 

ImgD.width=iwidth;

ImgD.height=(image.height*iwidth)/image.width;

}else{

ImgD.width=image.width; 

ImgD.height=image.height;

}

ImgD.alt=image.width+"��"+image.height;

}

else{

if(image.height>iheight){ 

ImgD.height=iheight;

ImgD.width=(image.width*iheight)/image.height; 

}else{

ImgD.width=image.width; 

ImgD.height=image.height;

}

ImgD.alt=image.width+"��"+image.height;

}

}

} 

//-->