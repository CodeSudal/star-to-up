<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>STU MAIN</title>
        <!-- 파비콘 삽입 -->
		<link rel="icon" href="img/StarToUp_Logo.png">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
        />
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

        <style>
            html,
            body {
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            body{
    animation: fadein 2000ms ease-out;
    -moz-animation: fadein 2000ms ease-out; /* Firefox */
    -webkit-animation: fadein 2000ms ease-out; /* Safari and  Chrome */
    -o-animation: fadein 2000ms ease-out; /* Opera */
}
@keyframes fadein {
    from {opacity:0;}
    to {opacity:1;}
}
@-moz-keyframes fadein { /* Firefox */
    from {opacity:0;}
    to {opacity:1;}
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {opacity:0;}
    to {opacity:1;}
}
@-o-keyframes fadein { /* Opera */
    from {opacity:0;}
    to {opacity: 1;}
}

    #menu-ul{
        position : absolute;
        list-style-type: none;
        z-index: 999;
        text-align: right;
        padding: 10%;
        padding-left: 80%;
        font-size: 34px;
        font-weight: bold;
    }

    #menu-ul li{
        margin: 25px 0px;
    }

    #menu-ul li a{
        text-decoration: none;
        color: white;
    }

    #menu-ul li a:hover{
        opacity: 0.7;
    }
        </style>

</head>
<body>
        <a href="./index.html"><img src="img/logo.png" alt="" style="position : absolute; z-index: 3; width: 20%;"/></a>
        <ul id="menu-ul">
            <li><a href="store.do">STORE</a></li>
            <li><a href="info.do">INFO</a></li>
            <li><a href="about.do">ABOUT</a></li>
        </ul>
       
        <div id="wrapDiv">
        <div id="dateChanger"></div>
                <!-- Section: Media -->
                <section id="wrapper-media" class="" style="position: relative; z-index: 1;"></section>
                <!-- Section: Media -->
            <div class="col-md-4 mb-4 mb-md-0" style="display: none;">
                <!-- Section: Description -->
                <section class="">
                    <h5 id="wrapper-title" style="display: none;"></h5>
                    <p class="text-muted mb-2"  style="display: none;"><span id="wrapper-copyright" style="display: none;"></span></p>
                    <p id="wrapper-explanation"  style="display: none;"></p>
                </section>
                <!-- Section: Description -->
            </div>
        </div>
        <div class="container my-5">
            <!-- Section: Intro -->
            <section class="text-center mb-4">
                    <div id="intro-date" style="display: none"></div>
            </section>
            <!-- Section: Intro -->

            <!-- Section: Demo -->
                <!-- Section: Date -->
                <section class="mb-4">
                    <!-- Datepicker -->
                    <!-- <div
                        class="form-outline datepicker"
                        data-mdb-toggle-button="true"
                        data-mdb-format="yyyy-mm-dd"
                        id="date-picker"
                    > -->
                    <!-- id="wrapper-date" -->
                        <input
                            type="text"
                            id="wrapper-date"
                            value=""
                            style="display: none"
                        />
                </section>
                    </div>
                <!-- Section: Date -->
       

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>
		
		<!-- NASA API JS -->
        <script src="js/apod-ver2.js"></script>
        
        <!-- Code injected by live-server -->
        <script>
            // <![CDATA[  <-- For SVG support
            if ('WebSocket' in window) {
                (function () {
                    function refreshCSS() {
                        var sheets = [].slice.call(document.getElementsByTagName('link'));
                        var head = document.getElementsByTagName('head')[0];
                        for (var i = 0; i < sheets.length; ++i) {
                            var elem = sheets[i];
                            var parent = elem.parentElement || head;
                            parent.removeChild(elem);
                            var rel = elem.rel;
                            if (
                                (elem.href && typeof rel != 'string') ||
                                rel.length == 0 ||
                                rel.toLowerCase() == 'stylesheet'
                            ) {
                                var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                                elem.href =
                                    url +
                                    (url.indexOf('?') >= 0 ? '&' : '?') +
                                    '_cacheOverride=' +
                                    new Date().valueOf();
                            }
                            parent.appendChild(elem);
                        }
                    }
                    var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
                    var address = protocol + window.location.host + window.location.pathname + '/ws';
                    var socket = new WebSocket(address);
                    socket.onmessage = function (msg) {
                        if (msg.data == 'reload') window.location.reload();
                        else if (msg.data == 'refreshcss') refreshCSS();
                    };
                    if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                        console.log('Live reload enabled.');
                        sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
                    }
                })();
            } else {
                console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
            }
            // ]]>
        </script>
    </body>
</html>