<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   
   <% Connection con=DBClass.DBConnectMethod(); 
   		
   		
   
   
   %>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Admin Panel</a> 
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
                        <a  href="admin.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    
                      <li>
                        <a href="#" data-toggle="modal" data-target="#MentorPopup"><i class="fa fa-briefcase fa-3x"></i> ADD HOD</a>
                    </li>
                    
                     <li>
                        <a href="#" data-toggle="modal" data-target="#MentorPopup"><i class="fa fa-file-text fa-3x"></i> ADD Mentor</a>
                    </li>
                    
                      <li>
                        <a href="#" data-toggle="modal" data-target="#MenteePopup"><i class="fa fa-book fa-3x"></i> ADD Mentee</a>
                    </li>
                    
                      <li>
                        <a  href="#"><i class="fa fa-desktop fa-3x"></i>Add User</a>
                    </li> 
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        
                 <!---------------------------------------------Start of Mentor Tables-------------------------------------------------------------------- -->
               
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
                                             <th>Number</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Dept</th> 
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%
                                    int count=1;
                                     
                                    PreparedStatement ps=con.prepareStatement("select * from mentor");
                                    ResultSet rs=ps.executeQuery();
                                    while(rs.next()){ 	%>
	                                 <tr >
	                                    	 <td> <%= count++ %> </td>
	                                        <td> <%=rs.getString(7) %></td>
	                                        <td><%=rs.getString(8) %></td>
	                                        <td> <%=rs.getString(4) %></td>
	                                        
	                                        <td><a href="deleteServlet1?id=<%=rs.getInt(1)%>&type=mentor&id1=mid&colname=mid"><button class="btn btn-danger"><i class="fa fa-pencil"></i>Delete</button></a></td>
	                                    </tr>
                                    <%  }
                                     
                                    %>
                                    </tbody>
                                    <tr>
                                        <td>
                                        	<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#MentorPopup">
                              					<i class="fa fa-pencil">ADD</i>
                            				</button>
                                       </td>
                                   </tr>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!-----------------------------------------------End MentorTables ------------------------------------------------>
                </div>
            </div>
              <!---------------------------------------------Start of Mentee  Tables-------------------------------------------------------------------- -->
            
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-success">
                        <div class="panel-heading">
                             Mentee Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                       <tr> <th>Number</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Dept</th> 
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%
                                     int count1=1;
                                    ps=con.prepareStatement("select * from mentee ");
                                    rs=ps.executeQuery();
                                    while(rs.next()){ 	%>
                                            <td><%=count1++ %></td>
	                                        <td> <%=rs.getString(7) %></td>
	                                        <td><%=rs.getString(8) %></td>
	                                        <td> <%=rs.getString(3) %></td>
	                                        
	                                        <td><a href="deleteServlet1?id=<%=rs.getInt(1)%>&type=mentee&colname=menteeid"><button class="btn btn-danger"><i class="fa fa-pencil"></i>Delete</button></a></td>
	                                    </tr>
                                    <% } 
                                    
                                    %>
                                    </tbody>
                                    <tr>
                                        <td>
                                        	<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#MenteePopup">
                              					<i class="fa fa-pencil">ADD</i>
                            				</button>
                                       </td>
                                   </tr>
                                </table>
                            </div>
                            
                        </div>
                    </div>  
                    <!---------------------------------------------End Mentee Tables-------------------------------------------------------------------- -->
                </div>
            </div>
            
                  <!---------------------------------------------Start of HOD Tables-------------------------------------------------------------------- -->
            
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            Head Of Department Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example3">
                                <thead>
                                        <tr>
                                             <th>Number</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Dept</th> 
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%
                                     int count2=1;
                                   
                                  
                                   ps=con.prepareStatement("select * from hod");
                                    rs=ps.executeQuery();
                                    while(rs.next()){ 	%>
	                                    <tr >
	                                    	 <td> <%= count2++ %> </td>
	                                        <td> <%=rs.getString(7) %></td>
	                                        <td><%=rs.getString(8) %></td>
	                                        <td> <%=rs.getString(4) %></td>
	                                        
	                                        <td><a href="deleteServlet1?id=<%=rs.getInt(1)%>&type=hod&colname=hid"><button class="btn btn-danger"><i class="fa fa-pencil"></i>Delete</button></a></td>
	                                    </tr>
                                    <%  }
                                     
                                    %>
                                   
                                      
                                    </tbody>
                                    <tr>
                                        <td>
                                        	<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#HODPopup">
                              					<i class="fa fa-pencil">ADD</i>
                            				</button>
                                       </td>
                                   </tr>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!---------------------------------------------End HOD Tables-------------------------------------------------------------------- -->
                </div>
            </div>
            
   <!-------------------------------------------------Start of Mentor PopUp----------------------------------------------------------------------->
               <!--  Modals-->
                   
                        
                        <div class="panel-body">
                           
                            <div class="modal fade" id="MentorPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title Here</h4>
                                        </div>
                                        
                                        
                                         <form role="form" method="post" action="InsertServlet">
	                       	 	 			<div class="form-group">
                                       <label>First Name</label>
                                      <input class="form-control" placeholder="First Name" name="uname"/>
                                      <input type="hidden" value="mentor" name="type">
                                       <label>Branch</label> 
                                     <select class="form-control" name="dname">
                                                        <option>Computer</option>
                                                        <option>IT</option>
                                                        <option>Elex</option>
                                                        <option>ETC</option>
                                     </select><br/>
                                     
                                     
                                     
                                      <button type="submit" class="btn btn-primary">Submit Button</button>
                                     
                                 </div>
	                       		 </form>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                     
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                
                    <!-------------------------------------------------End of Mentor PopUp----------------------------------------------------------------------->
            
                     
   <!-------------------------------------------------Start of Mentee PopUp----------------------------------------------------------------------->
               <!--  Modals-->
                   
                      
                        <div class="panel-body">
                            
                            <div class="modal fade" id="MenteePopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title Here</h4>
                                        </div>
                                        
                                        
                                         <form role="form" method="get" action="InsertServlet">
	                       	 	 			<div class="form-group">
                                       <label>First Name</label>
                                      <input class="form-control" placeholder="First Name" name="uname"/>
                                       <input type="hidden" value="mentee" name="type">
                                       <label>Branch</label> 
                                     <select class="form-control" name="dname">
                                                        <option>Computer</option>
                                                        <option>IT</option>
                                                        <option>Elex</option>
                                                        <option>ETC</option>
                                     </select><br/>
                                     
                                     
                                     
                                      <button type="submit" class="btn btn-primary">Submit Button</button>
                                     
                                 </div>
	                       	 </form>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
           
                    <!-------------------------------------------------Start of Mentee PopUp----------------------------------------------------------------------->
                    
                    
                    
                    
                                 
   					<!-------------------------------------------------Start of HOD PopUp----------------------------------------------------------------------->
               <!--  Modals-->
                 <!--    <div class="panel panel-default"> -->
                        
                        <div class="panel-body">
                           
                            <div class="modal fade" id="HODPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title Here</h4>
                                        </div>
                                        
                                        
                                         <form role="form" method="post" action="InsertHod">
	                       	 	 			<div class="form-group">
                                       <label>First Name</label>
                                      <input class="form-control" placeholder="First Name" name="uname"/>
                                       <input type="hidden" value="hod" name="type">
                                       <label>Branch</label> 
                                     <select class="form-control" name="dname">
                                                        <option>Computer</option>
                                                        <option>IT</option>
                                                        <option>Elex</option>
                                                        <option>ETC</option>
                                     </select><br/>
                                     
                                     
                                     
                                      <button type="submit" class="btn btn-primary">Submit Button</button>
                                     
                                 </div>
	                       	 </form>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                 <!--    </div> -->
                    <!-------------------------------------------------END of HOD PopUp----------------------------------------------------------------------->
            
            
                       
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
