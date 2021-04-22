<%@ page import="java.sql.*"%>
<%
  
try{
    String user_id=request.getParameter("uname");
    String pwd=request.getParameter("pass");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","Engineer4");
    Statement st=conn.createStatement();
    
    ResultSet resultSet=st.executeQuery("select * from reg where user_id='"+user_id+"' and password='"+pwd+"'");
    if(resultSet.next()){
        session.setAttribute("user_id",user_id);
        response.sendRedirect("menu1.html");
    }
else{
   out.println("Invalid password...");
}
     
}

catch(Exception e){
    out.print(e);
}
%>
