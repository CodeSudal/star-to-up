// Main call
function nasaRequest() {
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let data = JSON.parse(this.responseText);

            // Data from NASA API json
            let copyright = data['copyright'];
            let date = data['date'];
            let explanation = data['explanation'];
            let hdurl = data['hdurl'];
            let media_type = data['media_type'];
            let title = data['title'];
            let url = data['url'];

            // HTML markup for images and videos
            let imageType = `
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img id="wrapper-image" src="" class="w-100" />
            <a id="wrapper-hdurl" href="" target="_blank">
              <div class="mask" style="background-color: rgba(251, 251, 251, 0.2);"></div>
            </a>
          </div>
          `;

            // Static elements
            document.getElementById('wrapper-title').innerHTML = title;
            document.getElementById('wrapper-explanation').innerHTML = explanation;
            document.getElementById('wrapper-copyright').innerHTML = copyright;
            document.getElementById('intro-date').innerHTML = date;

            // If statement for images/videos
            if (media_type === 'video') {
                document.getElementById('wrapper-media').innerHTML = videoType;
                document.getElementById('wrapper-video').src = url;
            } else {
                document.getElementById('wrapper-media').innerHTML = imageType;
                document.getElementById('wrapper-image').src = url;
                document.getElementById('wrapper-hdurl').href = hdurl;
            }
        }
    };
    // Acessing a value from the date picker
    var datepicker_date = document.getElementById('wrapper-date').value;
    // NASA API link
    let queryUrl = 'https://api.nasa.gov/planetary/apod?';
    // API KEY
    let queryKey = 'api_key=DaFi4M1aSffvFg0EGzfCxWruc6FyhR7wStWMPtxf&';
    // Selected date
    let queryDate = 'date=' + datepicker_date + '&';
    // Full query
    let queryFull = queryUrl + queryKey + queryDate;

    xmlhttp.open('GET', queryFull, true);
    xmlhttp.send();
}

let date = new Date();
const y = date.getFullYear();
var m = date.getMonth() + 1;
var d = date.getDate();
var a = date.getDate();
// date.getMonth()는 0부터 시작하기 때문에 + 1 을 해줌

datepicker_date = y + '-' + m + '-' + d;

console.log(datepicker_date);

const datePicker = document.getElementById('wrapper-date');
// Call nasaRequest on date change

const dateChanger = document.querySelector('body');

dateChanger.addEventListener('click', click);

function changeDate() {
    $('wrapper-date').load(window.location.href + '#wrapper-date');

    // $('body').on('click', function () {
    //     $('body').fadeOut(1500);
    // });
    // $('body').on('click', function () {
    //     $('body').fadeIn();
    // });

    // $('body').animate({
    //     opacity: 1,
    // }),
    //     2000;
}
// 월별 날짜 계산
function click(e) {
    if (a >= d && d > 1) {
        d = d - 1;
    } else if (d <= 1) {
        if (m == 2) {
            d = 28;
        } else if (m == 8 || m % 2 == 0) {
            d = 31;
        } else {
            d = 30;
        }
        a = d;
        if (m > 1) {
            m = m - 1;
        } else {
            m = date.getMonth() + 1;
            d = date.getDate();
            a = d;
        }
    }
    // 날짜 값 변경 후 비동기 새로고침
    document.getElementById('wrapper-date').value = y + '-' + m + '-' + d;
    changeDate();
    console.log(y + '-' + m + '-' + d);
    nasaRequest();
}
datepicker_date = y + '-' + m + '-' + d;
// Initial call on page load
nasaRequest().onload;
