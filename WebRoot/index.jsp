<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" language="javascript" src="js/jquery-1.5.2.min.js"></script>
  </head>
  
  <body>
    <form action="" method="post" name="searchform" id="searchform">
    	<table border="0">
    		<tr>
    			<td>用户名: </td>
    			<td><input type="text" id="loginname" name="loginname" maxlength="50"/></td>
    		</tr>
    		<tr>
    			<td>密码: </td>
    			<td><input type="password" id="password" name="password" maxlength="64" /></td>
    		</tr>
    	</table>
	    <input type="submit" id="login" value="登录" />
	    
    </form>

    <h4>${result }</h4>
    
    <a href="register.jsp" >注册</a>
    
  </body>
  
  <script type="text/javascript">
  	$("#login").click(function(){
  		if(!checkForm())
  			return false;
  		$("#searchform").attr("action", "<%=path%>/user/login.do");
  		$("#searchform").submit();
  	});
  	
  	function checkForm(){
  		if($.trim($("#loginname").val()) == "" || $.trim($("#password").val()) == ""){
  			alert("用户名和密码不能为空.");
  			return false;
  		}
  		return true;
  	}
  </script>
</html>
