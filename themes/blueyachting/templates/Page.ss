<!DOCTYPE html>
<!--
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Silverstripe Theme By Brandfisher - www.brandfisher.de
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->

<html lang="$ContentLocale">
<head>
	<% base_tag %>
	<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=0, viewport-fit=cover">
	$MetaTags(false)

	<link rel="preload" href="$resourceURL('themes/blueyachting/webfonts/fa-brands-400.woff2')" as="font" type="font/woff2" crossorigin="anonymous">
	<link rel="preload" href="$resourceURL('themes/blueyachting/webfonts/fa-solid-900.woff2')" as="font" type="font/woff2" crossorigin="anonymous">

	<link rel="preload" href="$resourceURL('themes/blueyachting/webfonts/CeraPro-Medium.woff')" as="font" type="font/woff" crossorigin="anonymous">
	<link rel="preload" href="$resourceURL('themes/blueyachting/webfonts/CeraPro-Bold.woff')" as="font" type="font/woff" crossorigin="anonymous">
	<link rel="preload" href="$resourceURL('themes/blueyachting/webfonts/CeraPro-Regular.woff')" as="font" type="font/woff" crossorigin="anonymous">

	<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" href="/site.webmanifest">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#ffffff">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="theme-color" content="#ffffff">

	<meta property="og:type" content="website">
	<meta property="og:image" content="$BaseHref/og-image.jpg">
	<meta property="og:image:width" content="189">
	<meta property="og:image:height" content="99">
	<meta property="og:title" content="Janssen-Maritimes">
	<meta property="og:description" content="seit mehr als 35 Jahren ein Begriff f&uuml;r Qualit&auml;t im Wassersport &ndash; bietet eine breite Palette an Wassersport- und Bootszubeh&ouml;r, Schlauchbooten, Motoren, Bootstechnik, Elektronik, Funktionsbekleidung, Service und vielem mehr.">
	<meta property="og:url" content="$BaseHref">

	<!-- Google Tag Manager -->
	<script type="dont/load">(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-PW5XW8P');</script>
	<!-- End Google Tag Manager -->
	
</head>
<body class="$ClassName.ShortName" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
<nav class="skipnav" aria-label="Skipnavigation">
	<ul>
		<li><a href="{$Link}#header-nav" class="sr-only-focusable">Zur Hauptnavigation</a></li>
		<li><a href="{$Link}#main-content" class="sr-only-focusable">Zur Inhalt</a></li>
		<li><a href="{$Link}#footer" class="sr-only-focusable">Zur Fußnavigation</a></li>
	</ul>
</nav>
<% include Header %>
<% include Slider %>
<% include BreadCrumbs %>
<div id="main-content" role="main">
$Layout
</div>
<% include Footer %>

<script src="https://app.jurafox.de/bot/ccLoader/8d27e1ba2c853c8d2357ea89aa7facee/6d50958bfbc68445801477bc1e4ff6d8"></script>
</body>
</html>