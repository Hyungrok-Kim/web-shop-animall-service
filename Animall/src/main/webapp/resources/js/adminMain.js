// 메인 사진등록 

var div = document.getElementById('profile_ImageBox');
var img = document.getElementById('profile_Image');
var divAspect = 125 / 125; 					
var imgAspect = img.height / img.width;   

if (imgAspect <= divAspect) { 
    
    
    
    var imgWidthActual = div.offsetHeight / imgAspect;				  
    var imgWidthToBe = div.offsetHeight / divAspect;                  
    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);  
    img.style.cssText = 'width: auto; height: 100%; margin-left: '      
                      + marginLeft + 'px;'
} else {
    
    img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
}

