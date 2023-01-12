<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String upass=request.getParameter("upass");

User u=new User(uname,email,upass);
	
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");
		
	SessionFactory factory = cfg.buildSessionFactory();
	Session ses = factory.openSession();	
	
	Transaction tx = ses.beginTransaction();
	
	ses.save(u);

	tx.commit();
	ses.close();
	
	out.println("Data inserted");

%>
</body>
</html>