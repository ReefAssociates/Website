<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<%
Function Pic(num)
  Dim FSO, pname, filethm, passon
  Set FSO = Server.CreateObject("Scripting.FileSystemObject")
  passon = Request.ServerVariables("QUERY_STRING")
  pname = Request.QueryString("ref")
  filethm = "images/prj/thumbs/" & pname & "_" & num & ".jpg"
  If FSO.FileExists(server.mappath(filethm)) Then
	Pic = "<a href=""fsize.asp?" & passon & "&num=" & num & """ target=""main"" onclick=""StorePos()"">"
	Pic = Pic & "<img src=""" & filethm & """ id=Img""" & num & """ alt=""" & Request.QueryString("full") & """ /></a>"
  Else
	Pic = "&nbsp;"
  End If
  Set FSO = Nothing
End Function
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function StorePos() {
  parent.parent.ypos = parent.frames[1].document.body.scrollTop
}
//-->
</script>
</head>

<body>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><strong class="h1"><%= Request.QueryString("full") %></strong></td>
  </tr>
  <tr>
    <td><%= Request.QueryString("client") %></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="205">
  <tr align="center" valign="middle">
    <td width="100" height="100"><%=Pic(1)%></td>
    <td width="5" height="100">&nbsp;</td>
    <td width="100" height="100"><%=Pic(2)%></td>
  </tr>
  <tr>
    <td height="5"></td>
    <td></td>
    <td></td>
  </tr>
  <tr align="center" valign="middle">
    <td width="100" height="100"><%=Pic(3)%></td>
    <td width="5" height="100">&nbsp;</td>
    <td width="100" height="100"><%=Pic(4)%></td>
  </tr>
  <tr>
    <td height="5"></td>
    <td></td>
    <td></td>
  </tr>
  <tr align="center" valign="middle">
    <td width="100" height="100"><%=Pic(5)%></td>
    <td width="5" height="100">&nbsp;</td>
    <td width="100" height="100"><%=Pic(6)%></td>
  </tr>
</table>
</body>
</html>
