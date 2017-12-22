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
	
	Connection con=DBClass.DBConnectMethod();
	ResultSet rs=null;

	System.out.println("Sender / From"+request.getParameter("senderid"));
	System.out.println("reciver / To"+request.getParameter("reciverid"));


	int senderid=Integer.parseInt(request.getParameter("senderid"));
	int reciverid=Integer.parseInt(request.getParameter("reciverid"));
	
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
        <!-- ---------------------------------End. NAV SIDE  ---------------------------------------------------------------------->
         <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        	
                        		
                        		
                        <div class="form-group">
                      	 <label>Message</label>
	                      	 <form action="messageServlet" method="get">
	                         <textarea class="form-control" name="msgcontent" rows="3" style="width:50%; margin-left:50px; float:left;"></textarea><br>
	                         <input type="hidden" value="<%= request.getParameter("senderid") %>" name="senderid">    
	                         <input type="hidden" value="<%= request.getParameter("reciverid") %>"name="reciverid">
	                         <input type="submit" value="send" class="btn btn-success"style="float:right;margin-right:300px;width:10%;"><br><br>
	                          <input type="reset" value="clear" class="btn btn-success"style="float:right;margin-right:300px;background-color:red; width:10%;">
	                         </form>
                       </div>
                      <br/><hr><br/>
                      <div class="col-md-10" style="float:left; margin-left:35px;">
                     <!--    Context Classes  -->
                    <div class="panel panel-default">
                       
                        <div class="panel-heading">
                            Context Classes
                        </div>
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                           
                                            <th>sender</th>
                                            <th>Message</th>
                                            <th>Time</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%
                     PreparedStatement ps=con.prepareStatement("select * from message where senderid=? and reciverid=? or senderid=? and reciverid=?");
                       ps.setInt(1,senderid);
                       ps.setInt(2,reciverid);
                       ps.setInt(3,reciverid);
                       ps.setInt(4,senderid);
                       rs=ps.executeQuery();
                       while(rs.next()){ 
                       if(rs.getInt(2)==Integer.parseInt(session.getAttribute("senderid").toString())){%>
                    	    <tr class="success">
                    	    <%if(rs.getString("sendername").equals(session.getAttribute("sessionfname"))){%>
                    	    	<td><%=rs.getString("sendername")%></td>
                    	 <%   }else{%>
                    		 
                    		 <td><%-- <%=request.getParameter("recivername") %> --%></td>
                    		 <td><%=rs.getString("sendername") %></td>
                    	<%} %>
                                           
                                            <td><%=rs.getString("content") %></td>
                                            <td><%=rs.getString("time") %></td>
                           </tr>
                      <%}else{%>
                    	  
                           <tr class="danger">
                                              <%if(rs.getString("sendername").equals(session.getAttribute("sessionfname"))){%>
                    	    	<td><%=rs.getString("sendername")%></td>
                    	 <%   }else{%>
                    		 
                    	<%-- 	 <td><%=request.getParameter("recivername") %></td> --%>
                    		  <td><%=rs.getString("sendername") %></td>
                    	<%} %>
                                            <td><%=rs.getString("content") %></td>
                                            <td><%=rs.getString("time") %></td>
                           </tr>
                      <%} }%>
                                        
                                       </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
                </div>
                        		
                        		
                        		
                        		
                        		
                        		
                        		
              
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
    </div>
             <!-- /. PAGE INNER  -->
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
