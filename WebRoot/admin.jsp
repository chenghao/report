<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin.jsp' starting page</title>
    
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
    
    <div align="center">
    	<table border="1" width="900" id="userManageTr">
    		
    	</table>
    </div>
    <br /><br />
    <input style="border: 0px; font-size: 16px;" type="text" id="result" />
    
    <div >
    
	   	<div style="display: none;" id="chooseUniqueFlagDiv">选择日期: <select id="chooseUniqueFlag" onchange="chooseUniqueFlag();" ></select></div>
    	
    	<table border="0" width="900" align="center" id="showReportTr" style="display: none;">
	  		<tr>
	  			<td>填写日期: <input type="text" id="showUniqueFlag" readonly="readonly" title="用来标识当前考核表"/></td>
	  		</tr>
	  		<tr>
	  			<td>
		  			<table width="100%" border="1">
		  				<tr>
		  					<th>部      门</th>
		  					<th>岗      位</th>
		  					<th>用  户  名</th>
		  					<th>考核周/月度</th>
		  				</tr>
		  				<tr>
		  					<td><input type="text" id="showDepartment" readonly="readonly" /></td>
		  					<td><input type="text" id="showPost" readonly="readonly" /></td>
		  					<td><input type="text" id="showUsername" readonly="readonly" /></td>
		  					<td><input type="text" id="showAssess" readonly="readonly" value=""/></td>
		  				</tr>
		  			</table>
		  			<table width="100%" border="1">
		  				<tr>
				  			<td width="50"></td>
				  			<td width="300">下周工作计划</td>
				  			<td width="300">本周工作内容</td>
				  			<td width="100">完成情况</td>
				  			<td width="100">完成比例（100%）</td>
				  		</tr>
		  			</table>
	  			</td>
	  		</tr>
	  	</table>	
    	
    </div>
    
  </body>
  
  <script type="text/javascript">
  	var count = 0;
  
  	$(function(){
  		$("#result").val("");
  		
  		$.ajax({
			type: "post",
		 	url: "<%=path %>/admin/queryUser.do",
		 	dataType: "json",
		 	success: function(data){ 
		 		var str = "";
		 		$("#userManageTr").empty();
	 			str += "<tr><th width='80'>用户ID</th><th width='180'>登录名</th><th width='180'>用户名</th><th width='180'>部门</th><th width='180'>岗位</th><th width='100'>操作</th></tr>";
		 		$.each(data.rows, function(i, item){
		 			str += "<tr id='user"+item.userId+"' ><td align='center'>"+item.userId+"</td>";
		 			str += "<td align='center'>"+item.loginname+"</td>";
		 			str += "<td align='center'><a href='javascript:void(0)' onclick=\"queryReportByUserId("+item.userId+",'"+item.username+"','"+item.department+"','"+item.post+"' )\" >"+item.username+"</a></td>";
		 			str += "<td align='center'>"+item.department+"</td>";
		 			str += "<td align='center'>"+item.post+"</td>";
		 			str += "<td><a href='javascript:void(0)' onclick='deleteUserByUserid("+item.userId+")' >删除</a></td></tr>";
		 		});
		 		$("#userManageTr").append(str);
		 	}
		});	
  	});
  	
  	function deleteUserByUserid(userId){
  		if(!confirm("是否删除?")){
    		return ;
    	}else{
	  		$.ajax({
				type: "post",
			 	url: "<%=path %>/admin/deleteUserByUserid.do",
			 	dataType: "json",
			 	data: {
			 		userId: userId
			 	},
			 	success: function(data){ 
			 		if(data.result == "0"){
			 			$("#result").val("删除成功.");
			 			$("#user"+userId).remove();
			 		}else if(data.result == "1"){
			 			$("#result").val("删除失败.");
			 		}
			 	}
			}); 	
		}
  	}
  	
  	function queryReportByUserId(userId,username,department,post){
  		$("#result").val("");
  	
  		$("#showDepartment").val(department);
  		$("#showPost").val(post);
  		$("#showUsername").val(username);
  		
  		$("#chooseUniqueFlagDiv").css("display", "block");
  		$("#showReportTr").css("display", "none");
  	
  		$.ajax({
			type: "post",
		 	url: "<%=path %>/report/chooseUniqueFlag.do",
		 	dataType: "json",
		 	data: {
		 		userId: userId
		 	},
		 	success: function(data){ 
		 		var str = "";
		 		$("#chooseUniqueFlag").empty();
		 		str += "<option value=''></option>"
		 		$.each(data.rows, function(i, item){
		 			str += "<option ui="+userId+" value="+item.uniqueFlag+">"+item.uniqueFlag+"</option>";
		 		});
		 		$("#chooseUniqueFlag").append(str);
		 	}
		});
  	}
  	
  	function removeShowReportTr(){
  		while(count > 0){
  			$("#removeShowReportTr"+count).remove();
  			count --;
  		}
  	}
  	
  	function chooseUniqueFlag(){
  		$("#showReportTr").css("display", "block");
  	
  		var uniqueFlag = $("#chooseUniqueFlag").val();
  		var userId = $("#chooseUniqueFlag option[value='"+uniqueFlag+"']").attr("ui");
  		
  		if(uniqueFlag == ""){
  			removeShowReportTr();
  			$("#showReportTr").css("display", "none");
  			return false;
  		}else{
  			removeShowReportTr();
  		}
  		
  		$.ajax({
			type: "post",
		 	url: "<%=path %>/report/queryReportByUseridAndUniqueFlag.do",
		 	dataType: "json",
		 	data: {
		 		userId: userId,
		 		uniqueFlag: uniqueFlag
		 	},
		 	success: function(data){ 
		 		$("#showUniqueFlag").val(data.rows[0].uniqueFlag);
		 		$("#showAssess").val(data.rows[0].assess);
				 		
		 		var str = "";
		 		$.each(data.rows, function(i, item){
		 			count ++;
		 			str += "<tr id='removeShowReportTr"+count+"'><td><table width='100%' border='1'>";
					str += "<tr><td></td>";
					str += "<td style='width: 300px;'><table border='0'><tr><td>工作计划简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' >"+item.nextWeekWorkPlan+"</textarea></td></tr>";
					str += "<tr><td>预计完成时间:</td></tr><tr><td><input type='text' value="+item.nextWeekFinishTime+" /></td></tr>";
					str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' >"+item.nextWeekContent+"</textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' >"+item.nextWeekTarget+"</textarea></td></tr></table></td>";
					str += "<td style='width: 300px;'><table border='0'><tr><td>工作总计简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' >"+item.thisWeekWorkPlan+"</textarea></td></tr>";
					str += "<tr><td>完成时间:</td></tr><tr><td><input type='text' value="+item.thisWeekFinishTime+" /></td></tr>";
					str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' >"+item.thisWeekContent+"</textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' >"+item.thisWeekTarget+"</textarea></td></tr></table></td>";
					str += "<td width='100px'><textarea rows='3' cols='10' style='width: 100px;' >"+item.finishStatus+"</textarea></td><td width='100'><select style='width: 100px' ><option>"+item.finishRatio+"</option></select></td></tr></table></td></tr>"
		 		});
		 		$("#showReportTr").append(str);
		 	}
		});	
  	}
  </script>
</html>
