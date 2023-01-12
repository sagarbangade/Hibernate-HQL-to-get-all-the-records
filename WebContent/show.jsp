<%@page import="javax.persistence.Query"%>
<%@page import="model.User"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.List"%>
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
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
	
SessionFactory factory = cfg.buildSessionFactory();
Session ses = factory.openSession();	

Transaction tx = ses.beginTransaction();
Query query= ses.createQuery("from User");
List<User> list=query.getResultList();

tx.commit();
ses.close();
%>


<table>
<thead>
<tr>
   					<th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                  </tr>
                </thead>
<tr>
<tbody>
<%
for(User u:list)
{%><tr>
                    <td>
                    <%=u.getId() %>
                    </td>
                    <td>
                    <%=u.getUname() %>
                    </td>
                    <td>
                    <%=u.getEmail() %>
                    </td>
                    <td>
                    <%=u.getUpass() %>
                    </td>
                  </tr>
</tbody>

</table>
<%}
%>
</body>
</html>