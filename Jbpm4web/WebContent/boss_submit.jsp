<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,org.jbpm.api.*" %>
<%
//直接从默认的配置文件'jbpm.cfg.xml'里得到流程引擎
ProcessEngine processEngine=Configuration.getProcessEngine();
TaskService taskService=processEngine.getTaskService();
String taskId=request.getParameter("taskId");
taskService.completeTask(taskId,"结束");
response.sendRedirect(request.getContextPath()+"/index.jsp");

%>