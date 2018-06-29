<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Plugin jNotify v2.0</title>
	<link rel="stylesheet" href="jquery/jNotify.jquery.css" type="text/css" />
</head>
<body>

<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.com/jquery-1.5.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/plugIns/jnotify_v2.1/jquery/jNotify.jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		test("success");
	});
	
	function test(jkw){
		switch (jkw)
		{
			case 'success' : jSuccess('Congratulations, a success box !!'); break;
			case 'notice' : jNotify('Notification : <strong>Bold</strong>, <u>Underline</u> and <i>Italic</i> !'); break;
			case 'error' : jError('ERROR : please retry !'); break;
			case 'three' : 
				jSuccess('Success : a notify box comes after',
				{
					TimeShown : 2500,
					onClosed:function(){
						jNotify('Notify : an error to finish. Please click to show the Error box',
							{
								VerticalPosition : 'top',
								autoHide : false,
								onClosed:function(){
									jError('ERROR : now it\'s finished !<br />Please click on the overlay background to close jNotify ! :)',{
										clickOverlay : true,
										autoHide : false,
										HorizontalPosition : 'left'
									});
								}
							});
						}
				}); 
				break;
		}
	}
</script>
</body>
</html>
