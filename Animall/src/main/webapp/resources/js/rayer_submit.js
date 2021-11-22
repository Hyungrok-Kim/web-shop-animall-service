
//각 상품종류별 상품등록버튼
var submitProduct4 = document.getElementById('submit_forindexProduct4');

//상품 등록버튼 열고 닫기
var primeContainer = document.getElementById('submitPrimeContainer_forRayer');
var close = document.getElementById('write_close_button');

//닫았을때 값 초기화용
var filereset1 = document.getElementById('fileSubmit1');
var breset = document.getElementById('nameBox1');
var bprice = document.getElementById('bprice');
var btitle = document.getElementById('btitle');
var bsale = document.getElementById('bsale');
var bsaleprice = document.getElementById('bsaleprice');
var bexplain = document.getElementById('bexplain');



// 상품등록버튼 열고 닫는 이벤트


submitProduct4.addEventListener('click', function(){

	primeContainer.style.visibility = 'visible';

})

//닫는거 + 초기화
close.addEventListener('click', function(){

	primeContainer.style.visibility = 'hidden';
	
	
	filereset1.value = null;
	breset.value = '파일선택';
	bprice.value = null;
	btitle.value = null;
	bsale.value = null;
	bsaleprice.value = null;
	bexplain.value = null;
	$("#bproductlevel option:eq(0)").prop("selected", true);

})

//이미지 파일 등록시에 이미지명 표시 함수
function getImgFile1(obj){

	var fileName = document.getElementById('nameBox1');
	var s = getImgFileInfo(obj);
	fileName.value = s;
}


function getImgFileInfo(obj){
	
	var fileObj, pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;

	if(obj == "[object HTMLInputElement]") {
	        fileObj = obj.value
	    } else {
	        fileObj = document.getElementById(obj).value;
	    }
		 if (fileObj != "") {
		 	
		 	pathHeader = fileObj.lastIndexOf("\\");
		 	
            pathMiddle = fileObj.lastIndexOf(".");
            pathEnd = fileObj.length;
            fileName = fileObj.substring(pathHeader+1, pathMiddle);
            extName = fileObj.substring(pathMiddle+1, pathEnd);
            allFilename = fileName+"."+extName;
            
			return allFilename;
            
    	}else{
    		
    		alert("파일을 선택해주세요");
    		return "파일을 등록해주세요";
    		
    		}
}

// 가격 정규표현식 + 할인 적용 가격 
bprice.addEventListener('keyup',function(){
			var regex = /[^0-9]/
			
			if(this.value.match(regex)){
				alert("숫자만 입력해주세요");
			}
			
            this.value=this.value.replace(regex,'')
			
			var price = bprice.value;
			var sale = bsale.value;
			var saleprice = price * (sale/100);
			var saledprice = price - saleprice;
			
			bsaleprice.value = saledprice;
			
			
        })
        
//할인 정규표현식 + 할인 적용 가격 
bsale.addEventListener('keyup',function(){
			var regex = /[^0-9]/
			
			if(this.value.match(regex)){
				alert("숫자만 입력해주세요");
			}
			
            this.value=this.value.replace(regex,'')
			
			var price = bprice.value;
			var sale = bsale.value;
			var saleprice = price * (sale/100);
			var saledprice = price - saleprice;
			
			bsaleprice.value = saledprice;
        })
        
//할인가격 정규표현식 + 할인 적용 가격 
bsaleprice.addEventListener('keyup',function(){
			var regex = /[^0-9]/
			
			if(this.value.match(regex)){
				alert("숫자만 입력해주세요");
			}
			
            this.value=this.value.replace(regex,'')
			
			var price = bprice.value;
			var sale = bsale.value;
			var saleprice = price * (sale/100);
			var saledprice = price - saleprice;
			
			bsaleprice.value = saledprice;
        })

//필수 입력항목 유효성검사
$('#write_button').click(function(){
	
	 if($('#btitle').val() == ""){
	
		alert('제목을 입력해 주세요');
		return false;
	
	}else if($('#bprice').val() == ""){
	
	alert('가격을 입력해 주세요');
		return false;
	
	
	}else if($('#bsale').val() == ""){
	
	alert('할인율을 입력해 주세요');
		return false;
	
	
	}else if($('#bexplain').val() == ""){
	
	alert('상품설명을 입력해 주세요');
		return false;
	
	
	}else if($('#fileSubmit1').val() == ""){
	
	alert('사진을 등록해 주세요');
		return false;
	
	
	}


})

// ----------------------------------------------   YEAR ----------------------------------------------------
// ----------------------------------------------------------------------------------------------------------

