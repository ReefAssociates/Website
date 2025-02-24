browser_version = parseInt(navigator.appVersion);
browser_type = navigator.appName;
if (browser_type == "Microsoft Internet Explorer" && (browser_version >= 4)) {
    document.write('<style type="text/css">');
    document.write('html ');
    document.write('{scrollbar-3dlight-color:#999999;scrollbar-arrow-color:#000000;scrollbar-base-color:#000000;');
    document.write('scrollbar-darkshadow-color:#999999;scrollbar-face-color:#000000;');
    document.write('scrollbar-highlight-color:#000000;scrollbar-shadow-color:#000000;}');
    document.write('</style>');
}
