
//수정창 닫기
var primeContainer2 = document.getElementById('primeContainer_forRayer2');
var close2 = document.getElementById('write_close_button2');

//수정창 함수용 변수

var bprice2 = document.getElementById('bprice2');
var bsale2 = document.getElementById('bsale2');
var bsaleprice2 = document.getElementById('bsaleprice2');
var filereset2 = document.getElementById('fileSubmit2');


//수정창 닫기 함수
close2.addEventListener('click', function(){

	primeContainer2.style.visibility = 'hidden';
	filereset2.value = null;
})





function getImgFile2(obj){

	var fileName = document.getElementById('nameBox2');
	var s = getImgFileInfo2(obj);
	fileName.value = s;
}



function getImgFileInfo2(obj){
	
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
bprice2.addEventListener('keyup',function(){
			var regex = /[^0-9]/
			
			if(this.value.match(regex)){
				alert("숫자만 입력해주세요");
			}
			
            this.value=this.value.replace(regex,'')
			
			var price = bprice2.value;
			var sale = bsale2.value;
			var saleprice = price * (sale/100);
			var saledprice = price - saleprice;
			
			bsaleprice2.value = saledprice;
			
			
        })
        
//할인 정규표현식 + 할인 적용 가격 
bsale2.addEventListener('keyup',function(){
			var regex = /[^0-9]/
			
			if(this.value.match(regex)){
				alert("숫자만 입력해주세요");
			}
			
            this.value=this.value.replace(regex,'')
			
			var price = bprice2.value;
			var sale = bsale2.value;
			var saleprice = price * (sale/100);
			var saledprice = price - saleprice;
			
			bsaleprice2.value = saledprice;
        })
        
//할인가격 정규표현식 + 할인 적용 가격 
bsaleprice2.addEventListener('keyup',function(){
			var regex = /[^0-9]/
			
			if(this.value.match(regex)){
				alert("숫자만 입력해주세요");
			}
			
            this.value=this.value.replace(regex,'')
			
			var price = bprice2.value;
			var sale = bsale2.value;
			var saleprice = price * (sale/100);
			var saledprice = price - saleprice;
			
			bsaleprice2.value = saledprice;
        })



