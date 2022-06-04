<%@page language="java" import="java.sql.*"%>
<%
String name,email,subject,message;
name=request.getParameter("name");
email=request.getParameter("email");
subject=request.getParameter("subject");
message=request.getParameter("message");

Connection con;
PreparedStatement pst;
int x;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/radhikatandon","root","");
    pst=con.prepareStatement("insert into contactform(name,email,subject,message) values(?,?,?,?)");
    pst.setString(1,name);
    pst.setString(2,email);
    pst.setString(3,subject);
    pst.setString(4,message);
    x = pst.executeUpdate();
    if(x==1)
    {
        out.println("Data Submitted");
    }
    else{
        out.println("Unable to save ");
    }
    con.close();
}
catch(Exception e)
{
    out.println(e);
}


%>