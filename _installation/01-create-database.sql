CREATE DATABASE IF NOT EXISTS `login`;
require_once('../class.phpmailer.php');
02.
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded
03.
 
04.
$mail             = new PHPMailer();
05.
 
06.
$body             = file_get_contents('contents.html');
07.
$body             = eregi_replace("[\]",'',$body);
08.
 
09.
$mail->IsSMTP(); // telling the class to use SMTP
10.
$mail->Host       = "mail.yourdomain.com"; // SMTP server
11.
$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
12.
// 1 = errors and messages
13.
// 2 = messages only
14.
$mail->SMTPAuth   = true;                  // enable SMTP authentication
15.
$mail->SMTPSecure = "tls";                 // sets the prefix to the servier
16.
$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
17.
$mail->Port       = 587;                   // set the SMTP port for the GMAIL server
18.
$mail->Username   = "latif1093@gmail.com";  // GMAIL username
19.
$mail->Password   = "helpme0987";            // GMAIL password
20.
 
21.
$mail->SetFrom('name@yourdomain.com', 'First Last');
22.
 
23.
$mail->AddReplyTo("name@yourdomain.com","First Last");
24.
 
25.
$mail->Subject    = "PHPMailer Test Subject via smtp (Gmail), basic";
26.
 
27.
$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
28.
 
29.
$mail->MsgHTML($body);
30.
 
31.
$address = "whoto@otherdomain.com";
32.
$mail->AddAddress($address, "John Doe");
33.
 
34.
$mail->AddAttachment("images/phpmailer.gif");      // attachment
35.
$mail->AddAttachment("images/phpmailer_mini.gif"); // attachment
36.
 
37.
if(!$mail->Send()) {
38.
echo "Mailer Error: " . $mail->ErrorInfo;
39.
} else {
40.
echo "Message sent!";
41.
}
