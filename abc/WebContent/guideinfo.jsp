<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.proj.Utils.DBClass"%>
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

	//--------------Getting Session data in String variables----------------//
	
			String uname=(String)session.getAttribute("sessionUname");
			String type=(String)session.getAttribute("sessionType");
			String password=(String)session.getAttribute("sessionPassword");
			
			
	//-----------------------------------------------------------------------//
	Connection con=DBClass.DBConnectMethod();
	PreparedStatement ps,ps1=null;
	ResultSet rs,rs1=null;
	 int guideid=0;
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
                        <a  href="hodprofile.jsp"><i class="glyphicon glyphicon-user"></i>Edit Profile</a>
                    </li> 
                     
                    
                    <li>
                        <a  href="hodprofile.jsp"><i class="glyphicon glyphicon-user"></i>Profile</a>
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
                                            
                                            <th>GroupId</th>
                                            <th>Title</th> 
                                             <th>GuideName</th>
                                             <th>StudentName</th>
                                             <th>Domain</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                 <%
                                    int hid=Integer.parseInt(session.getAttribute("hid").toString());
                                	 System.out.println("inside hod page guide details"+hid);
                                     String unameFromMentor="";
                                     String fnameFromMentor="";
                                     String lnameFromMentor="";
                                     String phnFromMentor="";
                                     String emailFromMentor="";
                                     String domainFromMentor="";
                                     String dname=(String)session.getAttribute("sessionDname").toString();
                                	
                                      
                                      
                  /* the below query is fired for retriving info  from mentee(student) table */              
                                   int count=1;
                                     ps=con.prepareStatement("select * from mentee where mid=?" );
                                     ps.setString(1,request.getParameter("guideid"));
                                     System.out.println("Guid id set in ps is "+request.getParameter("guideid")); 
                                     rs=ps.executeQuery();
          
                                     
                                     while(rs.next()){	%>
 	                                  <tr>
 	                                    <td><%=rs.getInt("groupid") %></td>
 	                                    <td><%=rs.getString("projecttitle") %></td>
 	                                     <td><%=rs.getString("guidename") %></td>
 	                                    <td><%=rs.getString("menteename") %></td>
 	                                    <td><%=rs.getString("domainname") %></td>
 	                                  
 	                                    <td><a href="Messageshod.jsp?hodidid=<%=session.getAttribute("hid")%>&guideid=<%=request.getParameter("guideid")%>" class="btn btn-warning"><i class="glyphicon glyphicon-comment"></i></a></td>
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
