<%@ page import="java.sql.*"%>
<html>
<head>
</head>
<body>
<h1>HEALTHY INDIA INITIATIVE</h1>
</body>
</html>

<%
String name=request.getParameter("name");
String numb=request.getParameter("Cont");
String descr=request.getParameter("Desc");
String doctID=request.getParameter("doct_id");
String identi=request.getParameter("id");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","Engineer4");
PreparedStatement ps=conn.prepareStatement("Insert into booking values(?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,numb);
ps.setString(3,descr);
ps.setString(4,identi);
ps.setString(5,doctID);

int x=ps.executeUpdate();
if(x!=0){
if(name.length()!=0){
if(numb.length()==10){ 
if(identi.length()!=0){

out.print("Appointment booked....");


}
else{
out.print("Select Identification...");
}
}
else{
out.print("Mobile number invalid....");
}
}
else{
out.print("Enter name correctly...");
}
}
else{
out.print("Something went wrong....");
}


}
catch(Exception e){
out.print(e);
}
%>