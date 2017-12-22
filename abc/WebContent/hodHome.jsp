<%@page import="java.sql.ResultSet"%>
<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOD Panel</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;



%>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">HOD Panel</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><form method="link" action="logout.jsp">
 					<input type="submit" value="Logout" class="btn btn-danger square-btn-adjust"></div>	
				 </form>
        </nav>   
       <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                       <a  href="hodHome.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     
                     
                      <li>
                        <a  href="hodprofile.jsp"><i class="glyphicon glyphicon-file"></i>Edit Profile</a>
                    </li> 
                     <li>
                        <a  href="CreateGroup.jsp"><i class="glyphicon glyphicon-user"></i>Create Project Group</a>
                    </li> 
                    
                    <li>
                        <a  href="viewHodProfile.jsp"><i class="glyphicon glyphicon-user"></i>Profile</a>
                    </li> 
                    <li>
                        <a  href="guideDetils.jsp"><i class="glyphicon glyphicon-eye-open"></i> View Guide Details</a>
                   </li>
                  <!--  <li>
                        <a  href="Messages.jsp"><i class="glyphicon glyphicon-comment"></i>Messages</a>
                   </li>	 -->
                    
                </ul>
               
            </div>
     
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        
              				           				   <!---------------------------------------------Start of Mentee  Tables-------------------------------------------------------------------- -->
            
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-success">
                        <div class="panel-heading">
                             <b>Messaage Inbox..<b>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                       <tr> <th>Number</th>
                                            <th>From</th>
                                            <th>Content</th>
                                            <th>Time</th> 
                                            <th>Delete</th>
                                            <th>Reply</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%
                                     int count1=1;
                                     int mid= Integer.parseInt((String)session.getAttribute("hid").toString());
                                     con=DBClass.DBConnectMethod();
                                    ps=con.prepareStatement("select * from message where reciverid=?");
                                    System.out.println("Reciver id for message is "+(String)session.getAttribute("hid").toString());
                                ps.setInt(1,mid);
                                    ResultSet rs=ps.executeQuery();
                                    while(rs.next()){ 	%>
                                            <td><%=count1++ %></td>
                                            <td><%=rs.getString("sendername") %></td>
	                                        <td> <%=rs.getString("content") %></td>
	                                        <td> <%=rs.getString("time") %></td>
	                                        
	                                        <td><a href="deleteServlet1?id=<%=rs.getInt(1)%>&type=mentee&colname=menteeid"><button class="btn btn-danger"><i class="fa fa-pencil"></i>Delete</button></a></td>
	                                      <td><a href="Messages.jsp?senderid=<%=rs.getInt("reciverid")%>&reciverid=<%=rs.getString("senderid") %>" class="btn btn-success"><i class="glyphicon glyphicon-comment"></i></a></td>
	                                    </tr>
                                    <% } 
                                    
                                    %>
                                    </tbody>
                                    <tr>
                                       
                                   </tr>
                                </table>
                            </div>
                            <%System.out.println("Sender / From"+request.getParameter("senderid"));
                        	System.out.println("reciver / To"+request.getParameter("reciverid"));
							 %>
                        </div>
                    </div>  
                    <!---------------------------------------------End Mentee Tables-------------------------------------------------------------------- -->
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
