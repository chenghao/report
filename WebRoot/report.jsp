<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'report.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" language="javascript" src="js/jquery-1.5.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js" defer="defer"></script>  	
	  	
  </head>
  
  <body>
  	<table border="0" width="900" align="center">
  		<tr>
  			<th style="font-size: 20px">正源中溯员工周/月度考核表（技术）</th>
  		</tr>
  	</table>
  	<a href="javascript:void(0);" id="showAddReportDiv" onclick="showAddReportDiv();" >新建</a>
  	<a href="javascript:void(0);" id="closeAddReportDiv" onclick="closeAddReportDiv();" style="display: none">关闭</a>
  	&nbsp;&nbsp;&nbsp;&nbsp;<br />
  	选择考核表填写日期:
  	<select id="chooseUniqueFlag" onchange="chooseUniqueFlag();"></select>
  	
  	<div id="addReportDiv" style="display: none;">
	  	<form action="" method="post" id="searchform">
	  		<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId }" />
		  	<table border="0" width="900" align="center" id="addReportTd">
		  		<tr>
		  			<td>填写日期: <input type="text" maxlength="50" id="uniqueFlag" readonly="readonly" title="用来标识当前考核表" value="<%=date %>" /></td>
		  		</tr>
		  		<tr>
		  			<td>
			  			<table width="100%" border="1">
			  				<tr>
			  					<th>部      门</th>
			  					<th>岗      位</th>
			  					<th>姓      名</th>
			  					<th>考核周/月度</th>
			  				</tr>
			  				<tr>
			  					<td><input type="text" id="department" readonly="readonly" value="${sessionScope.user.department }"/></td>
			  					<td><input type="text" id="post" readonly="readonly" value="${sessionScope.user.post }"/></td>
			  					<td><input type="text" id="username" readonly="readonly" value="${sessionScope.user.username }"/></td>
			  					<td><select id="assess">
			  						<option value="周">周</option>
			  						<option value="月">月</option>
			  					</select></td>
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
		  		<tr id="removeReportTr1">
					<td>
						<table width="100%" border="1">
					  		<tr>
					  			<td></td>
					  			<td style="width: 300px;">
					  				<table border="0">
					  					<tr>
					  						<td>工作计划简述:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<textarea rows="3" cols="10" style="width: 300px; " onkeypress="if(this.value.length > 500){event.returnValue = false}" id="nextWeekWorkPlan1" class="nextWeekWorkPlan"></textarea>
					  						</td>
					  					</tr>
					  					<tr>
					  						<td>预计完成时间:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<input type="text" onfocus="WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});" id="nextWeekFinishTime1" class="nextWeekFinishTime"/>
											</td>
					  					</tr>
					  					<tr>
					  						<td>涉及内容:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<textarea rows="3" cols="10" style="width: 300px;" onkeypress="if(this.value.length > 500){event.returnValue = false}" id="nextWeekContent1" class="nextWeekContent"></textarea>
											</td>
					  					</tr>
					  					<tr>
					  						<td>目标:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<textarea rows="3" cols="10" style="width: 300px;" onkeypress="if(this.value.length > 500){event.returnValue = false}" id="nextWeekTarget1" class="nextWeekTarget"></textarea>
											</td>
					  					</tr>
					  				</table>
					  			</td>
					  			<td style="width: 300px;">
					  				<table border="0">
					  					<tr>
					  						<td>工作总计简述:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<textarea rows="3" cols="10" style="width: 300px;" onkeypress="if(this.value.length > 500){event.returnValue = false}" id="thisWeekWorkPlan1" class="thisWeekWorkPlan"></textarea>
					  						</td>
					  					</tr>
					  					<tr>
					  						<td>完成时间:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<input type="text" onfocus="WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});" id="thisWeekFinishTime1" class="thisWeekFinishTime" />
											</td>
					  					</tr>
					  					<tr>
					  						<td>涉及内容:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<textarea rows="3" cols="10" style="width: 300px;" onkeypress="if(this.value.length > 500){event.returnValue = false}" id="thisWeekContent1" class="thisWeekContent"></textarea>
											</td>
					  					</tr>
					  					<tr>
					  						<td>目标:</td>
					  					</tr>
					  					<tr>
					  						<td>
					  							<textarea rows="3" cols="10" style="width: 300px;" onkeypress="if(this.value.length > 500){event.returnValue = false}" id="thisWeekTarget1" class="thisWeekTarget"></textarea>
											</td>
					  					</tr>
					  				</table>
					  			</td>
					  			<td width="100px" onclick="">
					  				<textarea rows="3" cols="10" style="width: 100px;" onkeypress="if(this.value.length > 100){event.returnValue = false}" id="finishStatus1" class="finishStatus"></textarea>
					  			</td>
					  			<td width="100">
					  				<select style="width: 100px" id="finishRatio1" class="finishRatio">
					  					<option value="0">0%</option>
					  					<option value="10">10%</option>
					  					<option value="20">20%</option>
					  					<option value="50">50%</option>
					  					<option value="80">80%</option>
					  					<option value="100">100%</option>
					  				</select>
					  			</td>
					  		</tr>
						</table>
					</td>
				</tr>
				
		  	</table>
	  	</form>
	  	
	  	<h3><a href="javascript:void(0)" id="addReport" >添加</a></h3>
		<input type="button" value="保存" id="save" /><br />
	  	<input type="text" style="border: 0px; font-size: 16px; " id="result" />
	</div>

	<div id="showReportDiv" style="display: none;">
		<table border="0" width="900" align="center" id="showReportTd">
	  		<tr>
	  			<td>填写日期: <input type="text" id="showUniqueFlag" readonly="readonly" title="用来标识当前考核表"/></td>
	  		</tr>
	  		<tr>
	  			<td>
		  			<table width="100%" border="1">
		  				<tr>
		  					<th>部      门</th>
		  					<th>岗      位</th>
		  					<th>姓      名</th>
		  					<th>考核周/月度</th>
		  				</tr>
		  				<tr>
		  					<td><input type="text" id="showDepartment" readonly="readonly" value="${sessionScope.user.department }"/></td>
		  					<td><input type="text" id="showPost" readonly="readonly" value="${sessionScope.user.post }"/></td>
		  					<td><input type="text" id="showUsername" readonly="readonly" value="${sessionScope.user.username }"/></td>
		  					<td>
		  						<select id="showAssess"></select>
		  					</td>
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
	  	
	  	<h3><a href="javascript:void(0)" id="showAddReport" >添加</a></h3>
	  	<input type="button" id="saveShow" value="修改" /><br />
	  	<input type="text" style="border: 0px; font-size: 16px;" id="showResult" />
	</div>

	  	
	<script type="text/javascript" language="javascript">
	
		var count = 1;
		var reportIds = " ";
		
		$(function(){
			showUniqueFlag();
		});
	
		function showUniqueFlag(){
			var userId = $("#userId").val();
	
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
			 			str += "<option value="+item.uniqueFlag+">"+item.uniqueFlag+"</option>";
			 		});
			 		$("#chooseUniqueFlag").append(str);
			 	}
			});
		}
		
		$("#addReport").click(function(){
			if(count == 0){
				count += 2;
			}else{
				count++;
			}
			
			var str = "<tr id='removeReportTr"+count+"' ><td><table width='100%' border='1'>";
			str += "<tr><td><a href='javascript:void(0)' onclick='removeReportTr("+count+")' >移除</a></td>";
			str += "<td style='width: 300px;'><table border='0'><tr><td>工作计划简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='nextWeekWorkPlan"+count+"' class='nextWeekWorkPlan'></textarea></td></tr>";
			str += "<tr><td>预计完成时间:</td></tr><tr><td><input type='text' onfocus=\"WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});\" id='nextWeekFinishTime"+count+"' class='nextWeekFinishTime'/></td></tr>";
			str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='nextWeekContent"+count+"' class='nextWeekContent'></textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='nextWeekTarget"+count+"' class='nextWeekTarget'></textarea></td></tr></table></td>";
			str += "<td style='width: 300px;'><table border='0'><tr><td>工作总计简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='thisWeekWorkPlan"+count+"' class='thisWeekWorkPlan'></textarea></td></tr>";
			str += "<tr><td>完成时间:</td></tr><tr><td><input type='text' onfocus=\"WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});\" id='thisWeekFinishTime"+count+"' class='thisWeekFinishTime' /></td></tr>";
			str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='thisWeekContent"+count+"' class='thisWeekContent'></textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='thisWeekTarget"+count+"' class='thisWeekTarget'></textarea></td></tr></table></td>";
			str += "<td width='100px'><textarea rows='3' cols='10' style='width: 100px;' onkeypress='if(this.value.length > 100){event.returnValue = false}' id='finishStatus"+count+"' class='finishStatus'></textarea></td><td width='100'><select style='width: 100px' id='finishRatio"+count+"' class='finishRatio'><option value='0'>0%</option><option value='10'>10%</option><option value='20'>20%</option><option value='50'>50%</option><option value='80'>80%</option><option value='100'>100%</option></select></td></tr></table></td></tr>";
			
			$("#addReportTd").append(str);
		});
		$("#showAddReport").click(function(){
			count++;
		
			var str = "<tr id='showRemoveReportTr"+count+"'><input type='hidden' id='showReportId"+count+"' class='showReportId' value=' ' /><td><table width='100%' border='1'>";
			str += "<tr><td><a href='javascript:void(0)' onclick='removeReportTr("+count+")' >移除</a></td>";
			str += "<td style='width: 300px;'><table border='0'><tr><td>工作计划简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showNextWeekWorkPlan"+count+"' class='showNextWeekWorkPlan' ></textarea></td></tr>";
			str += "<tr><td>预计完成时间:</td></tr><tr><td><input type='text' onfocus=\"WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});\" id='showNextWeekFinishTime"+count+"' class='showNextWeekFinishTime' /></td></tr>";
			str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showNextWeekContent"+count+"' class='showNextWeekContent' ></textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showNextWeekTarget"+count+"' class='showNextWeekTarget' ></textarea></td></tr></table></td>";
			str += "<td style='width: 300px;'><table border='0'><tr><td>工作总计简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showThisWeekWorkPlan"+count+"' class='showThisWeekWorkPlan' ></textarea></td></tr>";
			str += "<tr><td>完成时间:</td></tr><tr><td><input type='text' onfocus=\"WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});\" id='showThisWeekFinishTime"+count+"' class='showThisWeekFinishTime' /></td></tr>";
			str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showThisWeekContent"+count+"' class='showThisWeekContent' ></textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showThisWeekTarget"+count+"' class='showThisWeekTarget' ></textarea></td></tr></table></td>";
			str += "<td width='100px'><textarea rows='3' cols='10' style='width: 100px;' onkeypress='if(this.value.length > 100){event.returnValue = false}' id='showFinishStatus"+count+"' class='showFinishStatus' ></textarea></td><td width='100'><select style='width: 100px' id='showFinishRatio"+count+"' class='showFinishRatio' ><option value='0'>0%</option><option value='10'>10%</option><option value='20'>20%</option><option value='50'>50%</option><option value='80'>80%</option><option value='100'>100%</option></select></td></tr></table></td></tr>";
			
			$("#showReportTd").append(str);
		});
		
		
		$("#save").click(function(){
			if(count == 0)
				count = 1;
				
			var reports="";
			var userId = $("#userId").val();
			var uniqueFlag = $.trim($("#uniqueFlag").val());
			var assess = $.trim($("#assess").val());
			
			if(uniqueFlag == ""){
				$("#result").val("填写日期不能为空.");
				return false;
			}
			if(assess == ""){
				$("#result").val("考核周/月度不能为空.");
				return false;
			}
			
			var len = $(".thisWeekWorkPlan").length;
			for(var v = 0; v < len; v++){
				var nextWeekWorkPlan = $.trim($(".nextWeekWorkPlan").eq(v).val());
				var nextWeekFinishTime = $.trim($(".nextWeekFinishTime").eq(v).val());
				var nextWeekContent = $.trim($(".nextWeekContent").eq(v).val());
				var nextWeekTarget = $.trim($(".nextWeekTarget").eq(v).val());
				var thisWeekWorkPlan = $.trim($(".thisWeekWorkPlan").eq(v).val());
				var thisWeekFinishTime = $.trim($(".thisWeekFinishTime").eq(v).val());
				var thisWeekContent = $.trim($(".thisWeekContent").eq(v).val());
				var thisWeekTarget = $.trim($(".thisWeekTarget").eq(v).val());
				var finishStatus = $.trim($(".finishStatus").eq(v).val());
				var finishRatio = $.trim($(".finishRatio").eq(v).val());
				
				if(thisWeekWorkPlan == "" || thisWeekFinishTime == ""){
					$("#result").val("本周工作总计简述和完成时间不能为空.");
					return false;
				}
				if(finishStatus == ""){
					$("#result").val("完成情况不能为空.");
					return false;
				}
				
				reports += userId+"|"+uniqueFlag+"|"+assess+"|"+nextWeekWorkPlan+"|"+nextWeekFinishTime+"|"+nextWeekContent+"|"+nextWeekTarget+"|"+thisWeekWorkPlan+"|"+thisWeekFinishTime+"|"+thisWeekContent+"|"+thisWeekTarget+"|"+finishStatus+"|"+finishRatio+"";
			}
			
			$.ajax({
				type: "post",
			 	url: "<%=path %>/report/saveReport.do",
			 	dataType: "json",
			 	data: {
			 		param: reports
			 	},
			 	success: function(data){ 
			 		if(data.result == "0"){
			 			$("#result").val("保存成功.");
			 			clearReports();
			 			showUniqueFlag();
			 		}else if(data.result == "1"){
			 			$("#result").val("唯一标识符已存在, 请重新添加.");
			 		}else if(data.result == "2"){
			 			$("#result").val("保存失败.");
			 		}
			 	}
			});
		});
		$("#saveShow").click(function(){
		
			if(count == 0){
				$("#showResult").val("必须有一条工作计划.");
			}else{
				$("#showResult").val("");
				
				var reports="";
				var userId = $("#userId").val();
				var uniqueFlag = $("#showUniqueFlag").val();
				var assess = $("#showAssess").val();
				
				var len = $(".showThisWeekWorkPlan").length;
				for(var v = 0; v < len; v++){
					var reportId = $(".showReportId").eq(v).val();
					var nextWeekWorkPlan = $.trim($(".showNextWeekWorkPlan").eq(v).val());
					var nextWeekFinishTime = $.trim($(".showNextWeekFinishTime").eq(v).val());
					var nextWeekContent = $.trim($(".showNextWeekContent").eq(v).val());
					var nextWeekTarget = $.trim($(".showNextWeekTarget").eq(v).val());
					var thisWeekWorkPlan = $.trim($(".showThisWeekWorkPlan").eq(v).val());
					var thisWeekFinishTime = $.trim($(".showThisWeekFinishTime").eq(v).val());
					var thisWeekContent = $.trim($(".showThisWeekContent").eq(v).val());
					var thisWeekTarget = $.trim($(".showThisWeekTarget").eq(v).val());
					var finishStatus = $.trim($(".showFinishStatus").eq(v).val());
					var finishRatio = $.trim($(".showFinishRatio").eq(v).val());
					
					if(thisWeekWorkPlan == "" || thisWeekFinishTime == ""){
						$("#showResult").val("本周工作总计简述和完成时间不能为空.");
						return false;
					}
					if(finishStatus == ""){
						$("#showResult").val("完成情况不能为空.");
						return false;
					}
					
					reports += userId+"|"+uniqueFlag+"|"+assess+"|"+nextWeekWorkPlan+"|"+nextWeekFinishTime+"|"+nextWeekContent+"|"+nextWeekTarget+"|"+thisWeekWorkPlan+"|"+thisWeekFinishTime+"|"+thisWeekContent+"|"+thisWeekTarget+"|"+finishStatus+"|"+finishRatio+"|"+reportId+"";
				}
				
				reports += "" + reportIds;
				
				$.ajax({
					type: "post",
				 	url: "<%=path %>/report/showSaveReport.do",
				 	dataType: "json",
				 	data: {
				 		param: reports
				 	},
				 	success: function(data){ 
				 		if(data.result == "0"){
				 			chooseUniqueFlag();
				 			$("#showResult").val("修改成功.");
				 		}else if(data.result == "1"){
				 			$("#showResult").val("修改失败.");
				 		}
				 	}
				});
			}
		});
		
		function removeReportTr(flag, reportId){
			if(reportId+"" != "undefined")	{
				if(!confirm("是否删除?")){
		    		return ;
		    	}
		    	
				reportIds += reportId+"|";
			}	

			$("#removeReportTr"+flag).remove();
			$("#showRemoveReportTr"+flag).remove();
			count --;
		}
		function removeAllReportTr(){
			$("tr[id^='showRemoveReportTr']").remove();
			
		}
		
		function clearReports(){
			var len = $(".thisWeekWorkPlan").length;
			for(var v = 0; v < len; v++){
				$(".nextWeekWorkPlan").eq(v).val("");
				$(".nextWeekFinishTime").eq(v).val("");
				$(".nextWeekContent").eq(v).val("");
				$(".nextWeekTarget").eq(v).val("");
				$(".thisWeekWorkPlan").eq(v).val("");
				$(".thisWeekFinishTime").eq(v).val("");
				$(".thisWeekContent").eq(v).val("");
				$(".thisWeekTarget").eq(v).val("");
				$(".finishStatus").eq(v).val("");
				$(".finishRatio").eq(v).val("");
			}
		}
		
		function showAddReportDiv(){
			removeAllReportTr();
		
			$("#addReportDiv").css("display", "block");
			
			$("#showAddReportDiv").css("display", "none");
			$("#closeAddReportDiv").css("display", "block");
			
			$("#showReportDiv").css("display", "none");
			$("#chooseUniqueFlag").val("")
		}
		function closeAddReportDiv(){
			clearReports();
			removeAllReportTr();
			
			$("#addReportDiv").css("display", "none");
			
			$("#closeAddReportDiv").css("display", "none");
			$("#showAddReportDiv").css("display", "block");
		}
		
		function chooseUniqueFlag(){
			$("#showResult").val("");
			reportIds = " ";
			
			if($("#chooseUniqueFlag").val() != ""){
				closeAddReportDiv();
				
				$("#showReportDiv").css("display", "block");
				
				var userId = $("#userId").val();
				var uniqueFlag = $("#chooseUniqueFlag").val();
				
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
				 		
				 		var v = "";
				 		var assess = data.rows[0].assess;
				 		if(assess == "周"){
				 			v += "<option selected='selected' value='周'>周</option><option value='月'>月</option>"
				 		}else if(assess == "月"){
				 			v += "<option value='周'>周</option><option selected='selected' value='月'>月</option>"
				 		}
				 		$("#showAssess").empty();
				 		$("#showAssess").append(v);
				 		
				 		count = 0;
				 		var str = "";
				 		$.each(data.rows, function(i, item){
							count ++;
							
							str += "<tr id='showRemoveReportTr"+count+"' ><input type='hidden' id='showReportId"+count+"' class='showReportId' value="+item.reportId+" /><td><table width='100%' border='1'>";
							str += "<tr><td><a href='javascript:void(0)' onclick='removeReportTr("+count+","+item.reportId+")' >移除</a></td>";
							str += "<td style='width: 300px;'><table border='0'><tr><td>工作计划简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showNextWeekWorkPlan"+count+"' class='showNextWeekWorkPlan' >"+item.nextWeekWorkPlan+"</textarea></td></tr>";
							str += "<tr><td>预计完成时间:</td></tr><tr><td><input type='text' onfocus=\"WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});\" id='showNextWeekFinishTime"+count+"' class='showNextWeekFinishTime' value="+item.nextWeekFinishTime+" /></td></tr>";
							str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showNextWeekContent"+count+"' class='showNextWeekContent' >"+item.nextWeekContent+"</textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showNextWeekTarget"+count+"' class='showNextWeekTarget' >"+item.nextWeekTarget+"</textarea></td></tr></table></td>";
							str += "<td style='width: 300px;'><table border='0'><tr><td>工作总计简述:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showThisWeekWorkPlan"+count+"' class='showThisWeekWorkPlan' >"+item.thisWeekWorkPlan+"</textarea></td></tr>";
							str += "<tr><td>完成时间:</td></tr><tr><td><input type='text' onfocus=\"WdatePicker({skin:'blueFresh',isShowWeek:true,isShowClear:true,dateFmt:'yyyy-MM-dd'});\" id='showThisWeekFinishTime"+count+"' class='showThisWeekFinishTime' value="+item.thisWeekFinishTime+" /></td></tr>";
							str += "<tr><td>涉及内容:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showThisWeekContent"+count+"' class='showThisWeekContent' >"+item.thisWeekContent+"</textarea></td></tr><tr><td>目标:</td></tr><tr><td><textarea rows='3' cols='10' style='width: 300px;' onkeypress='if(this.value.length > 500){event.returnValue = false}' id='showThisWeekTarget"+count+"' class='showThisWeekTarget' >"+item.thisWeekTarget+"</textarea></td></tr></table></td>";
							str += "<td width='100px'><textarea rows='3' cols='10' style='width: 100px;' onkeypress='if(this.value.length > 100){event.returnValue = false}' id='showFinishStatus"+count+"' class='showFinishStatus' >"+item.finishStatus+"</textarea></td><td width='100'><select style='width: 100px' id='showFinishRatio"+count+"' class='showFinishRatio' >"
							
							if(item.finishRatio == "0"){
								str += "<option selected='selected' value='0'>0%</option><option value='10'>10%</option><option value='20'>20%</option><option value='50'>50%</option><option value='80'>80%</option><option value='100'>100%</option>";
							}else if(item.finishRatio == "10"){
								str += "<option value='0'>0%</option><option selected='selected' value='10'>10%</option><option value='20'>20%</option><option value='50'>50%</option><option value='80'>80%</option><option value='100'>100%</option>";
							}else if(item.finishRatio == "20"){
								str += "<option value='0'>0%</option><option value='10'>10%</option><option selected='selected' value='20'>20%</option><option value='50'>50%</option><option value='80'>80%</option><option value='100'>100%</option>";
							}else if(item.finishRatio == "50"){
								str += "<option value='0'>0%</option><option value='10'>10%</option><option value='20'>20%</option><option selected='selected' value='50'>50%</option><option value='80'>80%</option><option value='100'>100%</option>";
							}else if(item.finishRatio == "80"){
								str += "<option value='0'>0%</option><option value='10'>10%</option><option value='20'>20%</option><option value='50'>50%</option><option selected='selected' value='80'>80%</option><option value='100'>100%</option>";
							}else if(item.finishRatio == "100"){
								str += "<option value='0'>0%</option><option value='10'>10%</option><option value='20'>20%</option><option value='50'>50%</option><option value='80'>80%</option><option selected='selected' value='100'>100%</option>";
							}
							
							str += "</select></td></tr></table></td></tr>";
				 			
				 		});
				 		$("#showReportTd").append(str);
				 	}
				});
			}else{
				$("#showReportDiv").css("display","none");
			}	
		}
	</script>  	
  </body>
</html>
