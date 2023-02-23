$.ajax({
    url: 'https://api.nasa.gov/planetary/apod?api_key=QKHzmbr4OB67EpTJPsb4nCfrK0gYhhDY7OIZIg8f',
    success: function (whatYouGot) {
        document.getElementById('img').innerHTML = "<img src='" + whatYouGot.url + "'style='width:100%;'/>";
        document.getElementById('copyright').innerHTML = 'By ' + whatYouGot.copyright;
        document.getElementById('title').innerHTML = whatYouGot.title;
        document.getElementById('explanation').innerHTML = whatYouGot.explanation;
    },
});

// img에 들어가는 것 : NASA에서 보내주는 데이터
// copyright에 들어가는 것 : NASA 저작권
// title에 들어가는 것 : 제목
// // explanation에 들어가는 것 : 얻어온 데이터에 대한 설명

// https://api.nasa.gov/planetary/apod?api_key=QKHzmbr4OB67EpTJPsb4nCfrK0gYhhDY7OIZIg8f
// 내 NASA DEV API 키
