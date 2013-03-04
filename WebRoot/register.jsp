<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
  	<form action="" method="post" id="searchform">
	    <table border="0">
	    	<tr>
	    		<td>登录名: </td>
	    		<td><input type="text" name="loginname" id="loginname" maxlength="50"/></td>
	    	</tr>
	    	<tr>
	    		<td>密码: </td>
	    		<td><input type="password" name="password" id="password" maxlength="64"/></td>
	    	</tr>
	    	<tr>
	    		<td>确认密码: </td>
	    		<td><input type="password" name="repassword" id="repassword" maxlength="64"/></td>
	    	</tr>
	    	<tr>
	    		<td>用户名: </td>
	    		<td><input type="text" name="username" id="username" maxlength="50"/></td>
	    	</tr>
	    	<tr>
	    		<td>部门: </td>
	    		<td><input type="text" name="department" id="department" maxlength="50"/></td>
	    	</tr>
	    	<tr>
	    		<td>岗位: </td>
	    		<td><input type="text" name="post" id="post" maxlength="50"/></td>
	    	</tr>
	    </table>
	    <input type="button" id="register" value="注册" />
  	</form>
  	
  	<h4>${result }</h4>
  	
  	<script type="text/javascript" language="javascript">
  		$("#password").blur(function(){
  			eqPassword();
  		});
  		
  		$("#repassword").blur(function(){
  			eqPassword();
  		});
  		
  		function eqPassword(){
  			var repassword = $.trim($("#repassword").val());
  			var password = $.trim($("#password").val());
  			
			if(password != "" && repassword != "" && repassword != password){
				alert("确认密码和密码不相同.");
			}
  		}
  		
  		$("#register").click(function(){
  			if(!checkForm())
  				return false;
  				
  			$("#searchform").attr("action", "<%=path %>/user/register.do");
  			$("#searchform").submit();
  		});
  		
  		function checkForm(){
  			if($.trim($("#loginname").val()) == ""){
  				alert("登录名不能为空.");
  				return false;
  			}
  			if($.trim($("#password").val()) == ""){
  				alert("密码不能为空.");
  				return false;
  			}
  			if($.trim($("#password").val()) != $.trim($("#repassword").val())){
  				alert("再次密码不相同.");
  				return false;
  			}
  			if($.trim($("#username").val()) == ""){
  				alert("用户名不能为空.");
  				return false;
  			}
  			if($.trim($("#department").val()) == ""){
  				alert("部门不能为空.");
  				return false;
  			}
  			if($.trim($("#post").val()) == ""){
  				alert("岗位不能为空.");
  				return false;
  			}
  			return true;
  		}
  	</script>
  </body>
</html>
