<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        %{--Подключаем ресурс application.css собранный плагином assert на основе директив, указанных в application.css--}%
        <asset:stylesheet src="application.css"/>

        %{--Подключаем ресурс application.js собранный плагином assert на основе директив, указанных в application.js--}%
		<asset:javascript src="application.js"/>

        %{--
        Включаем в раздел head шаблона раздел head декарируемой страницы.
        В декарируемой странице должен присутствовать тег <meta name='layout' content='main'/>, где атрибут content
        прнимает значение равное имени декарирующего шаблона, в нашем случае main от grails-app/views/layouts/main.gsp

        Детали работы шаблонизатора Grails описаны здесь
        http://grails.org/doc/latest/guide/theWebLayer.html#layouts
        здесь
        http://mrhaki.blogspot.ru/2011/03/grails-goodness-applying-layouts-in.html
        и здесь
        http://grails.asia/grails-tutorial-for-beginners-layout-templates/
        --}%
		<g:layoutHead/>
	</head>
	<body>
        %{--
        Включаем в раздел body шаблона раздел body декарируемой страницы.
        В декарируемой странице должен присутствовать тег <meta name='layout' content='main'/>, где атрибут content
        прнимает значение равное имени декарирующего шаблона, в нашем случае main от grails-app/views/layouts/main.gsp

        Детали работы шаблонизатора Grails описаны здесь
        http://grails.org/doc/latest/guide/theWebLayer.html#layouts
        здесь
        http://mrhaki.blogspot.ru/2011/03/grails-goodness-applying-layouts-in.html
        и здесь
        http://grails.asia/grails-tutorial-for-beginners-layout-templates/
        --}%
		<g:layoutBody/>
	</body>
</html>