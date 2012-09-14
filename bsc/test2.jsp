<%@ page import="java.util.Vector" language="java" %>
<%
Vector vc=new Vector();
vc.add("bob");
vc.add("riche");
vc.add("jacky");
vc.add("rosy");
%>

<html>
<body>
    <%
     int i=0;
     for(i=0;i<vc.size();i++)
     {
      out.print("Vector Elements       :"+vc.get(i)+"<br/>");
     }
    %>
</body>
</html>