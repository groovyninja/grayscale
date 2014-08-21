<%@ page import="grayscale.EMail" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale = 1.0, user-scalable = no">

    %{--
    Указываем, какой шаблон будем применять для данной страницы. В данном лучае это
    grails-app/views/layouts/main.gsp
    --}%
    <meta name='layout' content='main'/>
    <title>Fruit Inc.</title>

    <link href='http://fonts.googleapis.com/css?family=Raleway:400,900,800,300' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.src.js"></script>
	<![endif]-->

    %{--
    Добавляем скрипт, сгенерированный конструктором карт yandex для добавления карты на сайт.
    Детали, как создавать свои карты и добвлять на свой сайт, описаны здесь

    http://api.yandex.ru/maps/solutions/?p=about&ncrnd=7759
    --}%
    <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=4raQ7QEWc5HudzPil88AsaKVScwMObfm&id=yandex_map_container"></script>

    %{--
    Скрипт, настранивающий стили для облака тегов, отображаемого на сранице сайта
    --}%
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            var gradient = {
                0: '#000', // red
                0.33: '#525252', // yellow
                0.66: '#787878', // green
                1: '#918484'  // blue
            };

            var wsize = 1;

            var width = $(window).width();
            if (width > 1023) {
                $("#myCanvasContainer").append("<canvas width='1000px' height='450px' id='myCanvas'></canvas>");
                wsize = 2;
            }
            else if (width > 767 && width <= 1023) {
                $("#myCanvasContainer").append("<canvas width='724px' height='400px' id='myCanvas'></canvas>");
                wsizw = 2;
            }
            else if (width > 480 && width <= 766) {
                $("#myCanvasContainer").append("<canvas width='420px' height='350px' id='myCanvas'></canvas>");
                wsize = 1.5;
            }
            else if (width < 479) {
                $("#myCanvasContainer").append("<canvas width='300px' height='300px' id='myCanvas'></canvas>");
                wsize = 1;
            }

            if (!$('#myCanvas').tagcanvas({
                textFont: 'Trebuchet MS, Helvetica, sans-serif',
                outlineColour: '#ff9999',
                maxSpeed: 0.03,
                minBrightness: 0.2,
                depth: 0.92,
                pulsateTo: 0.6,
                initial: [0.1, -0.1],
                decel: 0.98,
                reverse: true,
                hideTags: false,
                shadow: '#ccf',
                shadowBlur: 3,
                imageScale: null,
                fadeIn: 1000,
                wheelZoom: false,
                weight: true,
                weightGradient: gradient,
                weightMode: 'both',
                weightFrom: 'data-weight',
                weightSize: wsize

            }, 'tags')) {
                // TagCanvas failed to load
                $('#myCanvasContainer').hide();
            }
        });
    </script>

</head>

<body>

%{--
Далее описывем слайды нашего одностраничного сайта, занимающие примерно один экран и расположенные
каждый в отдельном элементе div. Тут нет чего-либо специфического, достаточно базовых представлений о
html и css, чтобы понимать описываемое ниже.

Единственную трудность, пожалуй, могут составить только выражения языка gsp для подключения ресурсов
типа ${assetPath(..)}
Но и это станет понятным и прстым после прочтения
http://bertramdev.github.io/asset-pipeline/guide/usage.html#linking
--}%

<div class="slide" id="slide1" data-slide="1" data-stellar-background-ratio="0.5">
    <div class="effect_2">
        <div class="container clearfix">

            <div id="content1" class="grid_12">
                <div class="filtr_bg">
                    <div class="slogan">
                        <div class="left_bord"></div>

                        <div class="slogan_text">slogan text</div>

                        <div class="right_bord"></div>
                    </div>

                    <h1>Fruit Inc.</h1>
                    <span>fruits we provide</span>
                    <a class="button" title="" data-slide="2"></a>
                </div>

                <div class="clear"></div>
            </div>
        </div>

        <div class="inset_shadow"></div>
    </div>
</div>


<div class="menu">
    <div class="container clearfix">

        <div id="nav">
            <a class="btn_dropdown" data-toggle="collapse" data-target=".nav-collapse_">Навигация</a>
            <ul class="navigation">
                <li data-slide="2">Интересы</li>
                <li data-slide="4">Делаем</li>
                <li data-slide="8">Работы</li>
                <li data-slide="10">Обратная связь</li>
                <li data-slide="12">Контакты</li>

                <div class="clear"></div>
            </ul>
        </div>

    </div>
</div>


<div class="slide unselectable" id="slide2" data-slide="2" data-stellar-background-ratio="0.5">
    <div class="container clearfix">

        <div id="content2" class="grid_12">
            <h2>Мы знанимаемся</h2>
        </div>

        <div class="clear"></div>

        <div id="content3">

            <div class="grid_12">
                <div id="myCanvasContainer">

                </div>

                <div id="tags">
                    <ul>
                        <li><a data-weight="20" href="#">tag1</a></li>
                        <li><a data-weight="20" href="#">tag2</a></li>
                        <li><a data-weight="40" href="#">tag3</a></li>
                        <li><a data-weight="50" href="#">tag4</a></li>
                        <li><a data-weight="10" href="#">tag5</a></li>
                        <li><a data-weight="10" href="#">tag6</a></li>
                        <li><a data-weight="10" href="#">tag7</a></li>
                        <li><a data-weight="20" href="#">tag8</a></li>
                        <li><a data-weight="15" href="#">tag9</a></li>
                        <li><a data-weight="25" href="#">tag10</a></li>
                        <li><a data-weight="30" href="#">tag11</a></li>
                        <li><a data-weight="30" href="#">tag12</a></li>
                        <li><a data-weight="30" href="#">tag13</a></li>
                        <li><a data-weight="35" href="#">tag14</a></li>
                        <li><a data-weight="35" href="#">tag15</a></li>
                    </ul>
                </div>

                <a class="button" title="" data-slide="4"></a>

            </div>

        </div>

    </div>
</div>

<div class="slide unselectable" id="slide4" data-slide="4" data-stellar-background-ratio="0.5">
    <div class="container clearfix">

        <div id="content4" class="grid_12">
            <h2>Делаем</h2>
        </div>

        <div class="clear"></div>

        <div class="grid_12">
            <div id="jcarousel">
                <ul id="mycarousel" class="jcarousel-skin-tango">
                    <li>

                        <img src="${assetPath(src: 'icon1.png')}" />

                        <p>Графика</p>
                        <div class="clear"></div>
                        Краткое описание
                    </li>
                    <li>
                        <img src="${assetPath(src: 'icon2.png')}" />

                        <p>Верстка</p>
                        <div class="clear"></div>
                        Краткое описание
                    </li>
                    <li>
                        <img src="${assetPath(src: 'icon3.png')}" />
                        <p>Графический дизайн</p>
                        <div class="clear"></div>
                        Какой-то текст
                    </li>
                    <li>
                        <img src="${assetPath(src: 'icon4.png')}" />
                        <p>Веб разработка</p>
                        <div class="clear"></div>
                        Какой-то текст
                    </li>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>

        <div class="grid_12">
            <div class="slide4span">
                <a class="button" title="" data-slide="8"></a>
            </div>

        </div>

        <div class="clear"></div>

    </div>
</div>


<div class="slide" id="slide8" data-slide="8" data-stellar-background-ratio="0.5">
    <a name="projects"></a>

    <div class="container clearfix">

        <div id="content6" class="grid_12">
            <h2>Проекты</h2>
        </div>

        <div class="clear"></div>

        <div id="content7">
            <div id="options">
                <ul id="filters" class="option-set" data-option-key="filter">
                    <li><a href="#filter" data-option-value="*" class="btn dark_btn selected"><span></span>Все</a></li>
                    <li><a href="#filter" data-option-value=".category01"><span></span>Тип1</a></li>
                    <li><a href="#filter" data-option-value=".category02"><span></span>Тип2</a></li>
                    %{--<li><a href="#filter" data-option-value=".category03"><span></span>Продвижение</a></li>--}%
                </ul>

                <div class="clear"></div>
            </div>

            <div class="gallery-list">
                <!-- portfolio_block -->
                <div class="projects">
                    <div class="img_block element category02" data-category="category02">
                        <div class="hover_img">
                            <img class="portf_img" src="${assetPath(src: 'portfolio/5.jpg')}" alt="" />
                            <div class="item_description">
                                <p>имя проекта 1</p>
                            </div>
                            <span class="portfolio_zoom"><a href="${assetPath(src: 'portfolio/full/5.jpg')}" rel="prettyPhoto[portfolio1]"></a></span>
                            <span class="portfolio_link"><a href="#" target="_blank">Подробнее</a></span>
                        </div>
                    </div>

                    <div class="img_block element category01" data-category="category01">
                        <div class="hover_img">
                            <img class="portf_img" src="${assetPath(src: 'portfolio/2.jpg')}" alt="" />
                            <div class="item_description">
                                <p>имя проекта 2</p>
                            </div>
                            <span class="portfolio_zoom"><a href="${assetPath(src: 'portfolio/full/2.jpg')}" rel="prettyPhoto[portfolio1]"></a></span>
                            <span class="portfolio_link"><a
                                    href="#"
                                    target="_blank">Подробнее</a></span>
                        </div>
                    </div>

                    <div class="img_block element category01" data-category="category01">
                        <div class="hover_img">
                            <img class="portf_img" src="${assetPath(src: 'portfolio/3.jpg')}" alt="" />
                            <div class="item_description">
                                <p>имя проекта 3</p>
                            </div>
                            <span class="portfolio_zoom"><a
                                    href="${assetPath(src: 'portfolio/full/3.jpg')}"
                                    rel="prettyPhoto[portfolio1]"></a></span>
                            <span class="portfolio_link"><a
                                    href="#"
                                    target="_blank">Подробнее</a></span>
                        </div>
                    </div>

                    <div class="img_block element category01" data-category="category01">
                        <div class="hover_img">
                            <img class="portf_img" src="${assetPath(src: 'portfolio/4.jpg')}" alt="" />
                            <div class="item_description">
                                <p>имя проекта</p>
                            </div>
                            <span class="portfolio_zoom"><a href="${assetPath(src: 'portfolio/full/4.jpg')}" rel="prettyPhoto[portfolio1]"></a></span>
                            <span class="portfolio_link"><a
                                    href="#"
                                    target="_blank">Подробнее</a></span>
                        </div>
                    </div>

                    <div class="img_block element category01" data-category="category01">
                        <div class="hover_img">
                            <img class="portf_img" src="${assetPath(src: 'portfolio/1.jpg')}" alt="" />
                            <div class="item_description">
                                <p>Имя проекта</p>
                            </div>
                            <span class="portfolio_zoom"><a href="${assetPath(src: 'portfolio/full/1.jpg')}" rel="prettyPhoto[portfolio1]"></a></span>
                            <span class="portfolio_link"><a
                                    href="#"
                                    target="_blank">Подробнее</a></span>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
                <!-- //portfolio_block -->
            </div>
        </div>
        <a class="button" title="" data-slide="10"></a>
    </div>
</div>

<div class="slide" id="slide10" data-slide="10" data-stellar-background-ratio="0.5">
    <div class="container clearfix">

        <div id="content8" class="grid_12">
            <h2>Обратная связь</h2>
        </div>

        <div class="clear"></div>

        <div class="grid_12">
            <p>Вы можете отправить нам сообщение, воспользовавшись формой, расположенной ниже.</p>

            <div id="ajaxSendMail" class="ajax_send_mail">
                <div class="contact_form" id="sendMailDiv">
                    <div id="note"></div>

%{--
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 Пожалуй, единственный не самый тривиальный момент на этой странице.
 Тут происходит внедрение фрагмета html кода, описанного в специальном файле (шаблоне), начинающегося с подчеркивания
 grails-app/views/EMail/_sendMail.gsp
 и расположенного в директории контекста контроллера, указанного в атрибуте contextPath. В нашем случае мы могли бы его опустить.

 Детали, как работает render можно узнать здесь
 http://grails.org/doc/latest/ref/Tags/render.html
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--}%
                    <div id="fields">
                        <g:render template="sendMail" contextPath="/EMail" model="['email': email]"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid_12">
            <a class="button" title="" data-slide="12"></a>
        </div>

        <div class="clear"></div>

    </div>
</div>

<div class="slide" id="slide12" data-slide="12" data-stellar-background-ratio="0.5">
    <div class="container clearfix">

        <div id="content9" class="grid_12">
            <h2>Контакты</h2>
        </div>

        <div class="clear"></div>

        <div class="grid_12">
            <p>
                Наш адрес: г. Москва, Кремль
            </p>
        </div>

        <div class="clear"></div>
    </div>

    <div id="map_block">
        <div id="yandex_map_container" class="map_container"></div>
    </div>

</div>

<div id="footer">
    <div class="container clearfix">
        <div class="copyright">Роман Гордеев &copy; 2013 | <a href="#">Copyright</a></div>

        <div id="back_top"><a class="button" title="" data-slide="1"></a></div>
    </div>
</div>

</body>
</html>






