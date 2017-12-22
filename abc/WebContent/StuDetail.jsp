<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Panel</title>
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
	
	Connection con=DBClass.DBConnectMethod();
	ResultSet rs=null;
	int studentid=Integer.parseInt(request.getParameter("studentid"));
	System.out.println("inside studentDeatils jsp"+studentid);
	
	
	
	
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
                <a class="navbar-brand" href="#">Mentor Panel</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><form method="link" action="logout.jsp">
 					<input type="submit" value="Logout" class="btn btn-danger square-btn-adjust"></div>	
				 </form>
 	</nav>   
           <!--Start NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                       <a  href="mentorHome.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    <li>
                        <a  href="profile.jsp"><i class="glyphicon glyphicon-user"></i>Profile</a>
                    </li> 
                    <li>
                        <a  href="menteeDetails.jsp"><i class="glyphicon glyphicon-eye-open"></i> View Mentee Deatils</a>
                   </li>
                   <li>
                        <a  href="Messages.jsp"><i class="glyphicon glyphicon-comment"></i>Messages</a>
                   </li>	
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- ---------------------------------End. NAV SIDE  ---------------------------------------------------------------------->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        		
            
                        		
                        		   <!-- Advanced Tables -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                             Mentor Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                <thead>
                                        <tr>
                                         	 <th>Group Number</th>
                                         	 <th>Project Title</th>
                                             <th>Name of student</th>
                                             <th>mobile No</th>
                                             <th>Email ID</th>
                                             <th>Description of Project</th>
                                            <th>SponserShip Info</th> 
                                            <th>Message</th>
                                            
                                        
                                        </tr>
                                    </thead>
                                    <tbody>
                                 <%
                               
                                     
                               
                                 PreparedStatement ps=con.prepareStatement("select * from mentee where menteeid=?");
                     			ps.setInt(1,studentid);
                     			rs=ps.executeQuery();
                     		
                                    while(rs.next()){	%>
	                                    <tr >
	                                    	
	                                    	   <td><%=rs.getInt("groupid") %></td>
	                                    	    <td><%=rs.getString("projecttitle") %></td>
	                                    	   <td><%=rs.getString("menteename") %></td>
	                                    	   <td><%=rs.getString("mobileno") %></td>
	                                    	   <td><%=rs.getString("email") %></td>
	                                   		   <td><%=rs.getString("prodescrip") %></td>
	                                   		    <td><%=rs.getString("sponsered") %></td>
        	                                    <td><a href="Messages.jsp?senderid=<%=rs.getInt(1)%>&recivername=<%=rs.getString("menteename") %>&reciverid=<%=rs.getString("menteeid")%>" class="btn btn-warning"><i class="glyphicon glyphicon-comment"></i></a></td>
	                                   </tr>
	                                     
	                                      
	                                    
	                                    
                                    <%  }
                                    
                                    %> 
                                    </tbody>
                                    <tr>
                                       
                                   </tr>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!-----------------------------------------------End MentorTables ------------------------------------------------>
                    
                        		
                        		
                        		
                        		
                        		
                        		
                        		
                        		
                        		
              
                       
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
