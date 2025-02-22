<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<%
Stop;
Set objMail = Server.CreateObject("CDO.Message")

objMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "internal.mail.easynet.net" 
objMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
objMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
objMail.Configuration.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
objMail.Configuration.Fields.Update

objMail.From = "website@reefassociates.com"
objMail.To = "enquiries@reefassociates.com"
objMail.Subject = "Enquiry from REEF website"

objMail.HTMLBody = "<font size=2 face=verdana>"
objMail.HTMLBody = objMail.HTMLBody & "An enquiry has been made via the REEF website with the following details:" & "<br><br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Name: </strong>" & Request.form("name") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Organisation: </strong>" & Request.form("organisation") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Address: </strong>" & Request.form("address") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Phone: </strong>" & Request.form("phone") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Email: </strong>" & Request.Form("email") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Enquiry: </strong>" & Request.form("enquiry") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Call Back? </strong>" & Request.form("callback") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Brochure? </strong>" & Request.form("brochure") & "<br>"
objMail.HTMLBody = objMail.HTMLBody & "<strong>Meeting? </strong>" & Request.form("meeting") & "<br><br>"
objMail.HTMLBody = objMail.HTMLBody & "Sent at " & Now() & "</font>"

objMail.Send()

Set objMail = Nothing

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Thank you</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
Thank you for your enquiry.
You will be contacted shortly if requested. <br />
<br />
Please feel free to browse the rest of our website using the links above.
</body>
</html>
