<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/ext/msg/bubbleChat.css'/>"/>

<title>WebSocket messenger</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var websocket = null;
	var first = "true";
	$('#sendBtn').attr("disabled", true);
	
	
	$(document).ready(function() {
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/'+'${roomId}';
		websocket = connection(url);
		
		websocket.onopen = function(){
			send('${username}');
			$('#sendBtn').attr("disabled", false);
		};

		websocket.onmessage = function(message) {
			processMessage(message);
		};
		
		websocket.onclose = function() {
			Console.log('Info: WebSocket closed.');
		};
		
		websocket.onerror = function(message) {
			processError(message);
		};
		
		$('#sendBtn').click(function() {
			send(textMessage.value);
			textMessage.value = "";
		});
		
		$('#textMessage').keypress(function(e) {
			if(e.which==13) {
				send(textMessage.value);
				textMessage.value = "";
			}
		});
		
		$('#leaveBtn').click(function() {
			websocket.close();
			window.close();
		});
	});

	function processMessage(message) {
		var jsonData = JSON.parse(message.data);
		//alert("jsonData: " + jsonData.messageType + "," + jsonData.name +  "," + jsonData.message + "," + jsonData.users  );
		if (jsonData.messageType == "ChatMessage") {
			message = jsonData.name + " : "+ jsonData.message + '\n';
			display(message);
			
			displaybubble(jsonData);
		} else if (jsonData.messageType == "UsersMessage") {
			var other = "";
			for(var i=0; i<jsonData.users.length; i++) {
				if ("${loginVO.name}"!=jsonData.users[i]) {
					$('#users').append(jsonData.users[i]+"님과 대화중입니다.");
					other = jsonData.users[i];
					first = "false";
				}
			}
			if(first=="false" && other=="") {
				$('#users').empty();
				$('#users').append("대화상대가 아무도 없습니다.");
			} 
		}
	}
	
	function connection(url) {
		var websocket = null;
		if ('WebSocket' in window) {
			websocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return websocket;
	}

	function send(message) {
		websocket.send(JSON.stringify({ 'message' : message , 'room' : "${roomId}"}));
	}
	
	function display(message) {
		
	}
	
	function displaybubble(data) {
		//message = jsonData.name + " : "+ jsonData.message + '\n';
		if (data.name == "${loginVO.name}") {
			$('#chat').append(data.name+"(me)<br/><div class='bubble right'><span class='tail'>&nbsp;</span>"+data.message +"</div>");
	      	    
		} else {
		    $('#chat').append(data.name+"<br/><div class='bubble left'><span class='tail'>&nbsp;</span>"+data.message+"</div>");
		}
	}

	function processError(message) {
	}

 	window.onbeforeunload = function() {
		websocket.close();
		
	};  
</script>
</head>
<body>
	
	<div class="chat" id="chat">
	    <p>
	       <div id="users"></div>
	    </p>
	    <hr/>
	</div>
	<br/>
	<input id="textMessage" type="text" style="width: 300px" />
	<input type="button" id="sendBtn" name="sendBtn" value="Send"/>
	<input type="button" id="leaveBtn" name="leaveBtn" value="Leave"/>
</body>
</html>
