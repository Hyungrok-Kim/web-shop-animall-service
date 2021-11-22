  // 이미지 상단 박스
  const carouselSlide = document.querySelector('.carousel-slide');
  
  
  // 모든 이미지
  const carouselImages = document.querySelectorAll('.carousel-slide img');


  //버튼
  const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');


  //count
  let counter = 1;


  //첫번째 이미지의 가로 크기를 가져옴
  const size = carouselImages[0].clientWidth;


 // transform css 제어하여 왼쪽이동
  carouselSlide.style.transform = 'translateX(' + (-size*counter)+'px)';


  //버튼 동작방식 
    nextBtn.addEventListener('click',function(){
    //counter의 크기가 4를 넘어가면 첫 함수로 초기화 되라 빨리 버튼을 누르면 캐러셀이 속도를 못따라가는 문제 때문에
	if(counter >= carouselImages.length -1) return; 
  	carouselSlide.style.transition = "transform 0.4s ease-in-out";
  	//counter++를 통해 px의 값을 늘려주는 이유는 첫 지점을 기준으로 얼마만큼 이동하는지 결정하기 때문에.(즉 이동 후의 지점이 아닌 첫 지점을 기준으로 결정함)
  	counter++;
  	carouselSlide.style.transform = 'translateX(' + (-size*counter)+'px)';
  	
  });

// function() 대신 ()=> 사용가능
  prevBtn.addEventListener('click',()=>{
   //원래라면 counter는 0이어야 하지만 아래 함수식으로 인해 3으로 초기화
   //3, 2, 1의 카운터를 갖고 있기 때문에 0으로 떨어질일이 없지만 빨리 버튼을 같은 문제 발생으로 인해서
	  if(counter <= 0) return;
	  	carouselSlide.style.transition = "transform 0.4s ease-in-out";
	  	counter--;
	  	carouselSlide.style.transform = 'translateX(' + (-size*counter)+'px)';
	  });

// 캐러셀이 끝없이 이어지도록 
carouselSlide.addEventListener('transitionend', function(){
	console.log(carouselImages[counter]);
	if(carouselImages[counter].id === 'lastClone'){
		carouselSlide.style.transition = 'none';
		//왼쪽 끝 슬라이드 lastclone이면 counter는 3이 됨
		counter = carouselImages.length - 2; 
		//따라서 다시 1, 2, 3 슬라이드 중 3슬라이드로 보내는데 위의 transition의 none 효과로 변화는 보이지 않음. 
		carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)'; 
		}
	if(carouselImages[counter].id === 'firstClone'){
		carouselSlide.style.transition = 'none';
		// 오른쪽 끝 슬라이드 firstclone이면 counter는 1이 됨
		counter = carouselImages.length - counter;
		console.log(counter)
		carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
		}
});

carouselSlide.addEventListener('load', function(){
	
	carouselImages.style.width = window.innerwidth +'px';
	
});


//자동 슬라이드
function slide(){

if(counter >= carouselImages.length -1) return; 
carouselSlide.style.transition = "transform 0.4s ease-in-out";
counter++;
carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

};


var interval = setInterval(slide, 3000);
//마우스 오버시 자동 슬라이드 멈춤
carouselSlide.addEventListener('mouseover', function(){

 clearInterval(interval)
 
 //마우스 오버시 화살표 보이기
 
 prevBtn.style.transition = 'opacity 0.7s' 
 nextBtn.style.transition = 'opacity 0.7s'
 
 prevBtn.style.opacity ='.8'
 nextBtn.style.opacity ='.8'

});

prevBtn.addEventListener('mouseover', function(){

 clearInterval(interval)
 prevBtn.style.opacity ='.8'
 nextBtn.style.opacity ='.8'

});

nextBtn.addEventListener('mouseover', function(){

 clearInterval(interval)
 prevBtn.style.opacity ='.8'
 nextBtn.style.opacity ='.8'

});

// 마우스 떼면 슬라이드 재동작
carouselSlide.addEventListener('mouseout', function(){

//clearInterval을 통해서 interval을 중지시켰기에 재구동이 필요 따라서 setInterval을 정의 해놨음에도 불구하고 재정의가 필요
 interval = setInterval(slide, 3000);
 
 //화살표 사라지게 하기
  prevBtn.style.transition = 'opacity 0.7s' 
  nextBtn.style.transition = 'opacity 0.7s'
 
  prevBtn.style.opacity ='0'
  nextBtn.style.opacity ='0'

});