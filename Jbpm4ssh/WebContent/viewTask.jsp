<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务查看</title>
<script type="text/javascript">
//返回主页面
function goBack(){
	var url="<%=request.getContextPath()%>/jbpmAction!showPersonDesk.action";
	window.location.href=url;
}
//查看流程图
function viewWorkFlow(taskId){
	var url="<%=request.getContextPath() %>/jbpmAction!viewWorkFlow.action?userHelperBean.taskId="+taskId;
	window.open(url,'new','width=500,height=500,menubar=no,scrollbars=no,status=yes,resizable=yes,');
}
</script>
</head>
<body>
<s:if test="#request.activityName == @com.commons.CONSTANT@ACTIVITYNAMESQ">
<h2>填写请假申请单</h2>
<hr>
<form action="<%=request.getContextPath() %>/jbpmAction!processPersonTask.action" method="post">
<table>
<tr>
<td>
<s:textfield name="userHelperBean.userName" value="%{#session.user}" readonly="readonly" label="请假人"></s:textfield>
</td>
</tr>
<tr>
<td>
<s:textfield name="userHelperBean.day" label="请假天数"></s:textfield>
</td>
</tr>
<tr>
<td>
<s:textarea name="userHelperBean.reason" label="请假原因"></s:textarea>
</td>
</tr>
</table>
<s:hidden value="%{#request.taskId}" name="userHelperBean.taskId"></s:hidden>
<s:hidden value="%{#request.activityName}" name="userHelperBean.activityName"/>
<input type="submit" value="提 交"/>&nbsp;&nbsp;<input type="button" value="返 回" onclick="goBack();"/>
</form>
</s:if>
<s:elseif test="#request.activityName == @com.commons.CONSTANT@ACTIVITYNAMEJL">
<h2>请假申请单</h2>
<hr>
<form action="<%=request.getContextPath() %>/jbpmAction!processPersonTask.action" method="post">
<table>
<tr>
<td>
请假人：
</td>
<td>
<s:property value="#request.userMap.ower"/>
</td>
</tr>
<tr>
<td>
请假天数：
</td>
<td>
<s:property value="#request.userMap.day"/>
</td>
</tr>
<tr>
<td>
请假原因:
</td>
<td>
<s:property value="#request.userMap.reason"/>
</td>
</tr>
</table>
<s:hidden value="%{#request.taskId}" name="userHelperBean.taskId"/>
<s:hidden value="%{#request.activityName}" name="userHelperBean.activityName"/>
<input type="submit" name="userHelperBean.approveName" value="批准"/>&nbsp;
<input type="submit" name="userHelperBean.approveName" value="驳回"/>&nbsp;
<input type="button"  value="查看流程图" onclick="viewWorkFlow('<s:property value="#request.taskId"/>');"/>&nbsp;
<input type="button" value="返 回" onclick="goBack();"/>
</form>
</s:elseif>
<s:elseif test="#request.activityName == @com.commons.CONSTANT@ACTIVITYNAMEBOSS">
<h2>请假申请单</h2>
<hr>
<form action="<%=request.getContextPath() %>/jbpmAction!processPersonTask.action" method="post">
<table>
<tr>
<td>
请假人：
</td>
<td>
<s:property value="#request.userMap.ower"/>
</td>
</tr>
<tr>
<td>
请假天数：
</td>
<td>
<s:property value="#request.userMap.day"/>
</td>
</tr>
<tr>
<td>
请假原因:
</td>
<td>
<s:property value="#request.userMap.reason"/>
</td>
</tr>
</table>
<s:hidden value="%{#request.taskId}" name="userHelperBean.taskId"/>
<s:hidden value="%{#request.activityName}" name="userHelperBean.activityName"/>
<input type="submit" value="批准"/>&nbsp;
<input type="button"  value="查看流程图" onclick="viewWorkFlow('<s:property value="#request.taskId"/>');"/>&nbsp;
<input type="button" value="返 回" onclick="goBack();"/>
</form>
</s:elseif>
</body>
</html>