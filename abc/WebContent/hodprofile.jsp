<%@page import="java.sql.ResultSet"%>
<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



					<!-- this page is for editing hod profile only -->




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
                        
              				
              				
              				
              				
              				
              				
              				
              				
              				   <div class="row">
                    <div class="col-md-8">
                     
                     <font> ${Failmessage}</font>
	                       	
	                       	 
	                       	 
	                       	  <%
	                       	  
                               String unameFromMentor="";
                               String fnameFromhod="";
                               String lnameFromhod="";
                               String phnFromhod="";
                               String emailFromhod="";
                              // String domainFromhod="";
                               
                               
                               	String dname=(String)session.getAttribute("dept");
                               		
                               		PreparedStatement ps=con.prepareStatement("select * from hod where uname=? and password=?");
                               		ps.setString(1,uname);
                               		ps.setString(2,password);
                               		ResultSet rs=ps.executeQuery();
                               	
                               		if(rs.next()){
                               			
                               			fnameFromhod=rs.getString("fname");
                               			lnameFromhod=rs.getString("lname");
                               		 phnFromhod=rs.getString("phn");
                               		 emailFromhod=rs.getString("email");
                               		// domainFromhod=rs.getString("domain");
                               		}  %>
                               		 <form role="form" method="post" action="HodRegisterServlet"  enctype="multipart/form-data"  style="margin-left:105px;">
                               		  <input type="hidden" value= "<%=uname%>" name="uname">
	                       	  		  <input type="hidden" value=<%-- "<%=password %>" --%> name="password">
	                       	 	      
	                       	 	      <div class="form-group">
                                       <label>First Name</label>
                                      <input class="form-control" value="<%=fnameFromhod %>"name="fname"/>
                                      <input type="hidden" value="<%=session.getAttribute("uid") %>">
                                      <label>Last Name</label>
                                      <input class="form-control" value="<%= lnameFromhod%>" name="lname"/>
                                      
                                      <label>Phone</label>
                                      <input class="form-control" value="<%=phnFromhod %> " name="phn"/>
                                      
                                      <label>Email</label>
                                      <input class="form-control" value="<%=emailFromhod %>" name="email"  type="email"/>
                                       <label>Domain</label> 
                                       
                                       
                                       
                                     
                                     <br/>
                                     
                                       <label>Department</label> 
                                        <input class="form-control" value="<%= session.getAttribute("sessionDname")%>"  readonly="" name="dname" />
                                      
                                     	<br/>
                                     	
                                     	<label>Upload Profile Picture</label> 
                                     	<input type="file" name="photo" size="50"/><br><br><br>
              						
              						
              					
                                     	
                                      <button type="submit" class="btn btn-primary">Update Profile</button>
                                      </center>
                                     
                                 </div>
              				</form>
              				
              			
                    </div>
               
               <img src="HodRetriveImageServlet?uname=<%=uname%>" class="col-md-4">   
                
                </div>
                 <!-- /. ROW  -->
        
        
        
        
        
        
        
        
        
        
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
