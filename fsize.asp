<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
  Dim FSO,pref,pnum,passon,fspic,checkfile, qstring
  pref = Request.QueryString("ref")
  pnum = Request.QueryString("num")
  qstring = Request.ServerVariables("QUERY_STRING")
  passon = Left(qstring, Instr(qstring, "&num")-1)
  fspic = "images/prj/" & pref & "_" & pnum & ".jpg"
  Set FSO = Server.CreateObject("Scripting.FileSystemObject")
  checkfile = FSO.FileExists(server.mappath("images/prj/" & pref & "_" & pnum+1 & ".jpg"))
  Set FSO = Nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-top: 0px;
}
-->
</style>
<script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body onload="MM_preloadImages('images/pnav/pnav_1o.gif','images/pnav/pnav_2o.gif','images/pnav/pnav_3o.gif')">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="106" height="354">&nbsp;</td>
    <td width="540" height="354" align="center" valign="middle"><a href="project_frame.asp?<%=passon%>" target="main"><img src="<%=fspic%>" alt="Click to return" border="0" /></a></td>
    <td width="106" height="354" align="right" valign="bottom"><table border="0" cellpadding="0" cellspacing="0" width="66">
      <!-- fwtable fwsrc="pnav.png" fwbase="pnav.gif" fwstyle="Dreamweaver" fwdocid = "2052769158" fwnested="0" -->
      <tr>
        <td>
			<%
			If pnum <> "1" Then
				Response.Write("<a href=""fsize.asp?" & passon & "&num=" & pnum-1 & """ target=""main"" onmouseout=""MM_swapImgRestore()"" onmouseover=""MM_swapImage('pnav_1','','images/pnav/pnav_1o.gif',1);""><img src=""images/pnav/pnav_1.gif"" alt=""Previous"" name=""pnav_1"" width=""22"" height=""28"" border=""0"" id=""pnav_1"" /></a>")
			Else
				Response.Write("<img src=""images/pnav/pnav_1d.gif"" alt=""Previous"" name=""pnav_1"" width=""22"" height=""28"" border=""0"" id=""pnav_1"" />")
			End If
			%>
		</td>
        <td><a href="project_frame.asp?<%=passon%>" target="main" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('pnav_2','','images/pnav/pnav_2o.gif',1);"><img src="images/pnav/pnav_2.gif" alt="Return" name="pnav_2" width="21" height="28" border="0" id="pnav_2" /></a></td>
        <td>
			<%
			If checkfile Then
				Response.Write("<a href=""fsize.asp?" & passon & "&num=" & pnum+1 & """ target=""main"" onmouseout=""MM_swapImgRestore()"" onmouseover=""MM_swapImage('pnav_3','','images/pnav/pnav_3o.gif',1);""><img src=""images/pnav/pnav_3.gif"" alt=""Next"" name=""pnav_3"" width=""22"" height=""28"" border=""0"" id=""pnav_3"" /></a>")
			Else
				Response.Write("<img src=""images/pnav/pnav_3d.gif"" alt=""Next"" name=""pnav_3"" width=""22"" height=""28"" border=""0"" id=""pnav_3"" />")
			End If
			%>
		</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>

</html>
