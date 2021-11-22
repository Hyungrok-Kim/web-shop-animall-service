// --------------------------------- 사진 등록 --------------------------
// -------------------------------------------------------------------


// 위 메뉴 사진등록

var div2 = document.querySelector('.topMenu_profileImgBox');
var img2 = document.querySelector('.topMenu_profile');

var divAspect2 = 50 / 50; 					
var imgAspect2 = img2.height / img2.width;   

if (imgAspect2 <= divAspect2) { 
    
    var imgWidthActual2 = div2.offsetHeight / imgAspect2;				  
    var imgWidthToBe2 = div2.offsetHeight / divAspect2;                 
    var marginLeft2 = -Math.round((imgWidthActual2 - imgWidthToBe2) / 2);  
    img2.style.cssText = 'width: auto; height: 100%; margin-left: '      
                      + marginLeft2 + 'px;'
} else {
    
    img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
}


// --------------------------------- 기본정보 변경 페이지 --------------------------
// --------------------------------------------------------------------------


//기본 정보 버튼으로 열기
var adminInfo = document.getElementById('basicAdminInfo');

//정보버튼 열고 닫기
var adminContainer = document.getElementById('adminPrimeContainer_forRayer');
var close = document.getElementById('write_close_button');

// 상품등록버튼 열고 닫는 이벤트

adminInfo.addEventListener('click', function(){

	adminContainer.style.visibility = 'visible';

})

//닫는거 + 초기화
close.addEventListener('click', function(){

adminContainer.style.visibility = 'hidden';

})

// 썸네일 이미지 출력 입니다
var imgTarget = $('.preview-image .upload-hidden');
imgTarget.on('change', function() {
    var parent = $(this).parent();
    parent.children('.upload-display').remove();
    if (window.FileReader) { //image 파일만 
        if (!$(this)[0].files[0].type.match(/image\//)) return;
        var reader = new FileReader();
        reader.onload = function(e) {
            var src = e.target.result;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
        
        }
        reader.readAsDataURL($(this)[0].files[0]);
        
    } else {
        $(this)[0].select();
        $(this)[0].blur();
        var imgSrc = document.selection.createRange().text;
        parent.prepend(
            '<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'
        );
        
    var img = $(this).siblings('.upload-display').find('img');
    
    
        img[0].style.filter =
            "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
        
    }
    
});








