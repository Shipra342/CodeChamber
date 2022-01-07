<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connections.*,java.sql.*,java.io.IOException,java.util.Calendar,java.util.GregorianCalendar" %>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<%! 
	Statement st;
	ResultSet rs;
	int i;
%>
<div style="text-align:center;font-size:30px;font-weight:900">Total participants</div>
<br>
<br>

<table style="width:60%;position:absolute;left:20%">
<tr>
	<th>Sr. No.</th><th>College Name</th><th>ID</th><th>Password</th><th>Pool</th><th>Ques</th><th>Score</th>
</tr>
  <%
	try{
		st=Connections.makeConnection();
		rs=st.executeQuery("select * from participants order by pool,ques");
		i=1;
		while(rs.next())
		{
			%>	
				<tr>
					<td><%= i%></td>
					<td><%= rs.getString(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3)%></td>
					<td><%= rs.getString(4)%></td>
					<td><%= rs.getInt(5)%></td>
					<td><%= rs.getInt(6)%></td>
					
				</tr>
			<%
			i++;
		}
	}catch(Exception e)
  {
		System.out.println("1participants : "+e);
  }
  finally
  {
	  Connections.closeConnection();
  }
	%>
</table>
<br>
<br>
<br>
<br>
</body>
</html>
