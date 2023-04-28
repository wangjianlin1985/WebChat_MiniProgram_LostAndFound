<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="${pageContext.request.contextPath}/vanilla-cream-css/js/libs/jquery-1.10.0.js"></script>
    <title></title>
    <script type="text/javascript">
        var baseurl = "";
        $(function(){
            baseurl = $('#baseUrl').val();
            top.window.location = baseurl+'/jtcp';
        });
    </script>
</head>
<body>
<input id="baseUrl" type="hidden" value="<%=request.getContextPath() %>"/>
</body>
</html>
