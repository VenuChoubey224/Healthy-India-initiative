<%@ page import="java.sql.*"%>
<html>
<head>
<title>Your Appointments</title>
<style>
table{
background-color:black;
color:white;
font-size:20px;
text-align:center;
}
</style>
</head>
<body>
<h1>HEALTHY INDIA INITIATIVE</h1>
<%

try{
String doctId=request.getParameter("doct_id");
Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","Engineer4");
    Statement st=conn.createStatement();
    
    ResultSet resultSet=st.executeQuery("select name,numb,descr from booking where doct_id='"+doctId+"'");
    
            while(resultSet.next()){
%> 
<table width="100%">
<tr>
<th>Name</th>
<th>Mobile Number</th>
<th>Reason for meeting</th>
</tr>
<tr>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
</tr>
</table>
<% 
    }

     
}

catch(Exception e){
    out.print(e);
}
%>
</body>
</html>