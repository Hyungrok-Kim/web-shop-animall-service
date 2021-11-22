//각 상품종류별 상품등록버튼
var notice_Write = document.getElementById('notice_Write');

//상품 등록버튼 열고 닫기
var noticeWriter = document.getElementById('noticeWriter');
var noticeWriter_close = document.getElementById('noticeWriter_close_button');

// 상품등록버튼 열고 닫는 이벤트


notice_Write.addEventListener('click', function(){

	noticeWriter.style.visibility = 'visible';

})

//닫는거 + 초기화
noticeWriter_close.addEventListener('click', function(){

	noticeWriter.style.visibility = 'hidden';

})


// 3. CKEditor5를 생성할 textarea 지정
     ClassicEditor
         .create( document.querySelector( '#noticeEditor' ) )
         .catch( error => {
             console.error( error );
        } );