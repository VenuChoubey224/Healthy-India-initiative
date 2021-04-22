<%@ page import="java.sql.*"%>
<html>
<head>
</head>
<body>
<h1>HEALTHY INDIA INITIATIVE</h1>

</body>
</html>

<%
String id=request.getParameter("userid");
String pass=request.getParameter("passid");
String name=request.getParameter("username");
String add=request.getParameter("address");
String count=request.getParameter("country");
String zipc=request.getParameter("zip");
String mail=request.getParameter("email");



try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","Engineer4");
    PreparedStatement ps=conn.prepareStatement("Insert into reg values(?,?,?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,pass);
    ps.setString(3,name);
    ps.setString(4,add);
    ps.setString(5,count);
    ps.setString(6,zipc);
    ps.setString(7,mail);
    int x=ps.executeUpdate();
    if(x!=0)
{
   out.print("Signup done succesfully...");
}
else{
   out.print("Invalid...");
}
    
}
catch(Exception e){
    out.print(e);
}
%>

