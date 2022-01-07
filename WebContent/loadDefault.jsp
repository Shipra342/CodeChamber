<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connections.*,java.sql.*,java.io.*,java.util.*,java.util.Calendar,java.util.GregorianCalendar" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
		<%! 
			Statement st;
			ResultSet rs;
			String clg,dcode,lang,questag;
		%>
		<%
			questag=request.getParameter("questag");
			lang=request.getParameter("lang");
			System.out.println("questag "+questag);
			clg= (String) session.getAttribute("college");
			try
			{
				File f = new File("C:\\Users\\Shibbu\\eclipse-workspace\\CodeChamber\\codes\\"+clg+"\\"+questag+"\\"+questag+"."+lang);
				Scanner sc = new Scanner(f);
				sc.useDelimiter("\\Z");
				response.getWriter().print(sc.next());
				sc.close();
			}
			catch(Exception e)
			{
				System.out.println("loadDef :"+e);
			}
		%>
</body>
</html>
