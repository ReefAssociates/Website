<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
  Dim pref, passon
  pref = Request.QueryString("ref")
  If pref = "info" then
  	passon = "project_blank.htm"
  Else
	passon = "project_2x3.asp?" & Request.ServerVariables("QUERY_STRING")
  End If
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>

</head>

<frameset cols="240,*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=passon%>" name="leftFrame" noresize="noresize" scrolling="no" id="leftFrame" title="leftFrame" />
  <frame src="project_list.htm" name="mainFrame" scrolling="yes" id="mainFrame" title="mainFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
