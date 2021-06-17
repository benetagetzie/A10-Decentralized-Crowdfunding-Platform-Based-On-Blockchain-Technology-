<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.commondb.Common_DB"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Manufacturer information</title>
		<meta name="description" content="Sticky Table Headers Revisited: Creating functional and flexible sticky table headers" />
		<meta name="keywords" content="Sticky Table Headers Revisited" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize_1.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
        <style>
            input[type="checkbox"]{
  width: 30px; /*Desired width*/
  height: 30px; /*Desired height*/
}
        </style>
	<body align="center">
            
		<div class="container">
			<!-- Top Navigation -->
			
			<header>
				<h1>Manufacturer Information</h1>	
				
			</header>
			<div class="component">
				
				<table class="">
					<thead>
						<tr>
						
                        
                        <th>Name</th>
                        <th>Email</th>
                        <th>Location</th>
                        <th>Phone Number</th>
                        
						</tr>
					</thead>
					<tbody>
                                             <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fakeproduct","root","password");
                    Statement st=con.createStatement();
                    String query="SELECT * FROM manufacturer";
                    ResultSet rs1=st.executeQuery(query);
                        //ResultSet rs1=Common_DB.ViewTable("counselling", "college");
                        while(rs1.next())
                        {
                     %>
						<tr>
			 <td><%=rs1.getString("username")%></td>
                        <td><%=rs1.getString("email")%></td>
                        <td><%=rs1.getString("location")%></td>
                        <td><%=rs1.getString("mobile")%></td>
                       
                                                       
						</tr>
                                                <%
            }
            %>
					</tbody>
				</table>
                                        <a href="adminhome.jsp">Goback</a>
			
				
			
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
               	
	</body>
</html>