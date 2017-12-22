<%@page import="java.sql.ResultSet"%>
<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html>



					<!-- this page is forCreating project group by hod  only -->




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
  <link rel="stylesheet" href="/vendor/bootstrap-multiselect/css/bootstrap-multiselect.css" />
<script src="/vendor/bootstrap-multiselect/js/bootstrap-multiselect.js"></script>

<!-- 
					below is the cdn for multiple select option..
 -->

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
 
<!-- Include the plugin's CSS and JS: -->
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="css/bootstrap-multiselect.css" type="text/css"/>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        $('#example-getting-started').multiselect();
    });
</script>



</head>



<body>



<%

	//--------------Getting Session data in String variables----------------//
	
			String uname=(String)session.getAttribute("sessionUname");
			String type=(String)session.getAttribute("sessionType");
			String password=(String)session.getAttribute("sessionPassword");
			String fnamRs=".....";
			
	//-----------------------------------------------------------------------//
	Connection con=DBClass.DBConnectMethod();
	
	String dname=(String)session.getAttribute("sessionDname").toString();
	


	
	

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
           
                 <!-- /. ROW  -->
        					
        					    <!-- Build your select: -->
        			<form role="form" action="Creategroup" method="post">
							     <div class="form-group col-md-4">	
							     	
                                                <div class="form-group has-success">
                                                    <label class="control-label" for="inputSuccess">Student 1</label>
                                                    <input type="text" class="form-control" id="inputSuccess" name="student1id" placeholder="Student ID">
                                                </div>
                                                <div class="form-group has-success">
                                                    <label class="control-label" for="inputSuccess">Student 2 </label>
                                                    <input type="text" class="form-control" id="inputSuccess" name="student2id" placeholder="Student ID">
                                                </div>
                                                <div class="form-group has-success">
                                                    <label class="control-label" for="inputSuccess">Student 3 </label>
                                                    <input type="text" class="form-control" id="inputSuccess" name="student3id" placeholder="Student ID">
                                                </div>
                                                 <div class="form-group has-success">
                                                    <label class="control-label" for="inputSuccess">Student 4 </label>
                                                    <input type="text" class="form-control" id="inputSuccess"name="student4id"placeholder="Student ID">
                                                </div>
                                                <div class="form-group has-error">
                                                <label class="control-label"for="inputError" >Project title</label>
                                        	    <input type="text" class="form-control" name="projecttitle"placeholder="projecttitle"> 
                                                </div>
                                                
                                                 <div class="form-group"  >
                                                 <label class="control-label" for="inputWarning">Domain of project</label>
                                                  
	                                                    <select class="form-control"  name="domain">
	                                                     <option>select Option</option>
	                                                    <%
	                                                	PreparedStatement ps=con.prepareStatement("select * from mentor where dname=?");
	                                                	ps.setString(1,dname);
	                                                	ResultSet rs=ps.executeQuery();
	                                                		System.out.println("inside Resultset rs ");
	                                                    while(rs.next()){%>
	                                                     <option><%=rs.getString("domain") %></option>
	                                                    
	                                                    <%} %>
	                                                    </select>
	                                                    
                                   				</div>
                                   				
                                   				<br/>
                                   				
                                   				 <div class="form-group"  >
                                                    <label>Assign Guide</label>
	                                                    <select class="form-control" name="fname">
		                                                      <option>select Option</option>
		                                                    <%
		                                                
		                                                	 rs=ps.executeQuery();  //we are iterating the same table mentor same as that of above 
		                                                	System.out.println("inside Resultset rs 1");// only we are changing the Resultset object
		                                                    while(rs.next()){%>
		                                                  	  <option><%=rs.getString("fname")%></option>
		                                                  	 
		                                                    <%
		                                                  			 
		                                                    } %>
	                                                    </select>
                                   				</div>	   
                                   
                                   
                                   <br/>
                                   			<%
                                   			
                                   			 		System.out.println("dname= "+(String)session.getAttribute("sessionDname").toString());
                                   			ps.setString(1,(String)session.getAttribute("sessionDname").toString());		
                                   			 rs=ps.executeQuery();
                                   					while(rs.next()){%>
                                   						  <input type="hidden"  name="mid" value="<%= rs.getString("mid")%>">
                                   						
                                   					<% }%>
                                   	<button type="submit" class="btn btn-info">Submit Button</button>
                                   
                                   
                                 </div>
                                    
                             			
							
        	</form>
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
