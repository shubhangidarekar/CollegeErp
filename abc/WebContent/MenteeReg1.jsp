<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Mentee Project</title>
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
            String username = "";
            username = session.getAttribute("sessionUname").toString();
            String time = "";
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy-HH:mm:ss");
            time = sdf.format(cal.getTime());
            
            
            
          
            String uname = (String) session.getAttribute("sessionUname");
            String password = (String) session.getAttribute("sessionPassword");



            Connection con = DBClass.DBConnectMethod();
            PreparedStatement ps = null;
            ResultSet rs=null;
            
            
            
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
                    <a class="navbar-brand" href="index.html">Mentee</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> <%=username%> : <%=time%>  &nbsp; <a href="logout.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>

            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li class="text-center">
                            <img src="StudentRetriveImage?uname=<%=username%>" class="user-image img-responsive"/>
                        </li>

                        <li>
                            <a href="MenteeReg1.jsp"><i class="fa fa-sitemap fa-3x"></i>Mentee Profile<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li class="active-in"><a href="#home1-pills" data-toggle="tab">Inbox</a>
                                </li>
                                <li class=""><a href="#home-pills" data-toggle="tab">Mentee Personal Details</a>
                                </li>
                                <li class=""><a href="#profile-pills" data-toggle="tab">Mentee Acadmics Details</a>
                                </li>
                                <li class=""><a href="#messages-pills" data-toggle="tab">Mentee Project Details</a>
                                </li>
                                <li class=""><a href="#settings-pills" data-toggle="tab">Intership Details</a>
                                </li>
                                <li ><a href="#curricular-pills" data-toggle="tab">Certificates</a>
                                </li>
                            </ul>
                        </li>  

                    </ul>

                </div>

            </nav>  
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Mentee Profile
                                </div>
                                <div class="panel-body">
                                    <ul class="nav nav-pills">
                                        <li class="active-in"><a href="#home1-pills" data-toggle="tab">Inbox</a>
                                        </li>
                                        <li class=""><a href="#home-pills" data-toggle="tab">Mentee Personal Details</a>
                                        </li>
                                        <li class=""><a href="#profile-pills" data-toggle="tab">Mentee Acadmics Details</a>
                                        </li>
                                        <li class=""><a href="#messages-pills" data-toggle="tab">Mentee Project Details</a>
                                        </li>
                                        <li class=""><a href="#settings-pills" data-toggle="tab">Intership Details</a>
                                        </li>
                                        <li class=""><a href="#curricular-pills" data-toggle="tab">Certificates</a>
                                        </li>
                                    </ul>

                                    <div class="tab-content">
                                        <div class="tab-pane fade" id="home1-pills">
                                            <h4>Inbox</h4>
                                     
                                     
                                     
                                     
                                     
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
                                     int mid= Integer.parseInt((String)session.getAttribute("sessionmenteeid").toString());
                                     con=DBClass.DBConnectMethod();
                                    ps=con.prepareStatement("select * from message where reciverid=?");
                                    System.out.println("Reciver id for message is "+(String)session.getAttribute("sessionmenteeid").toString());
                                ps.setInt(1,mid);
                                    rs=ps.executeQuery();
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
                                        <div class="tab-pane fade" id="home-pills">
                                            <h4>Personal Details</h4>
                                            <%

                                                
                                                String menteeid = "";
                                                String menteename = "";
                                                String deptname = "";
                                                String mobileno = "";
                                                String email = "";
                                                String address = "";
                                                String fathername = "";
                                                String mothername = "";
                                                String gender = "";
                                                String bloodgroup = "";
                                                String aadhar = "";
                                                String file = "";
                                                String imagename = "";

                                                 con = DBClass.DBConnectMethod();
                                                 ps = con.prepareStatement("select * from mentee where uname=? and password=?");
                                                ps.setString(1, uname);
                                                ps.setString(2, password);
                                                rs = ps.executeQuery();
                                                if (rs.next()) {
                                                    menteeid = rs.getString("menteeid");
                                                    menteename = rs.getString("menteename");
                                                    deptname = rs.getString("deptname");
                                                    mobileno = rs.getString("mobileno");
                                                    email = rs.getString("email");
                                                    address = rs.getString("address");
                                                    fathername = rs.getString("fathername");
                                                    mothername = rs.getString("mothername");
                                                    gender = rs.getString("gender");
                                                    bloodgroup = rs.getString("bloodgroup");
                                                    aadhar = rs.getString("aadhar");

                                                }

                                            %>     
                                            <form role="form" method="post" action="MenteeRegServlet2" enctype="multipart/form-data">
                                                <input type="hidden" value="<%=uname%>" name="uname">

                                                    <input type="hidden" value="<%=password%>" name="password">

                                                        <div class="form-group">                                                                    
                                                            <label>Mentee name</label>
                                                            <input class="form-control" value="<%= menteename%>" name="menteename"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Department Name</label>
                                                            <input class="form-control" readonly value="<%=deptname%>" name="deptname"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Mobile No</label>
                                                            <input class="form-control" value="<%=mobileno%>" name="mobileno"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <input class="form-control" value="<%=email%>" name="email"  type="email"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Address</label>
                                                        </div>
                                                        <div class="form-group">                                                                        
                                                            <textarea class="form-control" value="" name="address"  type="address"rows="3"><%=address%></textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Father Name</label>
                                                            <input class="form-control" value="<%=fathername%>" name="fathername"  type="fathername"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Mother Name</label>
                                                            <input class="form-control" value="<%=mothername%>" name="mothername"  type="mothername"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Gender</label>
                                                            <select class="form-control"value="<%=gender%>" name="gender"  type="gender">
                                                                <option value="male">Male</option>
                                                                <option value="female+">Female</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>BloodGroup</label>
                                                            <select class="form-control"value="<%=bloodgroup%>" name="bloodgroup"  type="bloodgroup">
                                                                <option value="O+">O+</option>
                                                                <option value="AB+">AB+</option>
                                                                <option value="AB-">AB-</option>
                                                                <option value="B+">B+</option>
                                                                <option value="other">Other</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Aadhar Card No.</label>
                                                            <input class="form-control" value="<%=aadhar%>" name="aadhar"  type="aadhar"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Image Upload</label>
                                                            <input type="file" name="file" size="40">
                                                        </div>
                                                        <center>
                                                            <button type="submit" class="btn btn-primary">Update Profile</button>
                                                        </center>
                                                        </form>
                                                        </div>
                                                        <div class="tab-pane fade" id="profile-pills">
                                                            <h4>Acadmics Details</h4>
                                                            <%

                                                                String sscmarks = "";
                                                                String sscschoolname = "";
                                                                String hscmarks = "";
                                                                String hscschoolname = "";
                                                                String dipaggmarks = "";
                                                                String dipschoolname = "";
                                                                String enggaggmarks = "";
                                                                String enggschoolname = "";

                                                                con = DBClass.DBConnectMethod();
                                                                ps = con.prepareStatement("select * from mentee  where uname=? and password=?");
                                                                ps.setString(1, uname);
                                                                ps.setString(2, password);
                                                                rs = ps.executeQuery();

                                                                if (rs.next()) {

                                                                    sscmarks = rs.getString("sscmarks");
                                                                    sscschoolname = rs.getString("sscschoolname");
                                                                    hscmarks = rs.getString("hscmarks");
                                                                    hscschoolname = rs.getString("hscschoolname");
                                                                    dipaggmarks = rs.getString("dipaggmarks");
                                                                    dipschoolname = rs.getString("dipschoolname");
                                                                    enggaggmarks = rs.getString("enggaggmarks");
                                                                    enggschoolname = rs.getString("enggschoolname");

                                                                }

                                                            %>     
                                                            <form role="form" method="post" action="Acadmic" style="margin-left:105px;">
                                                                <input type="hidden" value="<%=uname%>" name="uname">

                                                                    <input type="hidden" value="<%=password%>" name="password">
                                                                        <div class="form-group">
                                                                            <p class="help-block">SSC Details</p>
                                                                            <label>10th Marks(%):</label>
                                                                            <input class="form-control" value="<%= sscmarks%>" name="sscmarks"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>School Name:</label>
                                                                            <input class="form-control" value="<%=sscschoolname%>" name="sscschoolname"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <p class="help-block">HSC Details</p>
                                                                            <label>12th marks(%) :</label>
                                                                            <input class="form-control" value="<%=hscmarks%>" name="hscmarks"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>College Name :</label>
                                                                            <input class="form-control" value="<%=hscschoolname%>" name="hscschoolname"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <p class="help-block">Diploma Details</p>
                                                                            <label>TE Aggrigate(%):</label>
                                                                            <input class="form-control" value="<%=dipaggmarks%>" name="dipaggmarks"  type="dipaggmarks"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>College Name:</label>
                                                                            <input class="form-control" value="<%=dipschoolname%>" name="dipschoolname"  type="dipschoolname"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <p class="help-block">Engineering Details</p>
                                                                            <label>BE aggreegate(%) :.</label>
                                                                            <input class="form-control" value="<%= enggaggmarks%>" name="enggaggmarks"  type="enggaggmarks"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>College Name :</label>
                                                                            <input class="form-control" value="<%= enggschoolname%>" name="enggschoolname"  type="enggschoolname"/>
                                                                        </div>
                                                                        <center>
                                                                            <button type="submit" class="btn btn-primary">Update Profile</button>
                                                                        </center>
                                                                        </form>
                                                                        </div>
                                                                        <div class="tab-pane fade" id="messages-pills">
                                                                            <h4>Project Details</h4>
                                                                            <%

                                                                                String projecttitle = "";
                                                                                String domainname = "";
                                                                                String sponsered = "";
                                                                                String guidename = "";
                                                                                String prodescrip = "";

                                                                                con = DBClass.DBConnectMethod();
                                                                                ps = con.prepareStatement("select * from mentee  where uname=? and password=?");
                                                                                ps.setString(1, uname);
                                                                                ps.setString(2, password);
                                                                                rs = ps.executeQuery();

                                                                                if (rs.next()) {

                                                                                    projecttitle = rs.getString("projecttitle");
                                                                                    domainname = rs.getString("domainname");
                                                                                    sponsered = rs.getString("sponsered");
                                                                                    guidename = rs.getString("guidename");
                                                                                    prodescrip = rs.getString("prodescrip");

                                                                                }


                                                                            %>     
                                                                            <form role="form" method="post" action="Project" style="margin-left:105px;">
                                                                                <input type="hidden" value="<%=uname%>" name="uname">

                                                                                    <input type="hidden" value="<%=password%>" name="password">
                                                                                        <div class="form-group">
                                                                                            <label>Project Title:</label>
                                                                                            <input class="form-control" value="<%= projecttitle%>" name="projecttitle"/>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Domain Name:</label>
                                                                                            <input class="form-control" readonly value="<%=domainname%>" name="domainname"/>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Sponsered:</label>
                                                                                            <select class="form-control"value="<%=sponsered%>" name="sponsered"  type="sponsered">
                                                                                                <option value="yes">Yes</option>
                                                                                                <option value="no">No</option>
                                                                                            </select>
                                                                                        </div>

                                                                                        <div class="form-group">
                                                                                            <label>Guide Name:</label>
                                                                                            <input class="form-control" readonly value="<%=guidename%>" name="guidename"/>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Project Description</label>
                                                                                        </div>
                                                                                        <div class="form-group">                                                                        
                                                                                            <textarea class="form-control" value="" name="prodescrip"  type="prodescrip"rows="3"><%=prodescrip%></textarea>
                                                                                        </div>



                                                                                        <br/>
                                                                                        <br/>
                                                                                        <center>
                                                                                            <button type="submit" class="btn btn-primary">Update Profile</button>
                                                                                        </center>
                                                                                        </form>
                                                                                        </div>

                                                                                        <div class="tab-pane fade" id="settings-pills">
                                                                                            <h4>Intership Details</h4>
                                                                                            <%


                                                                                                String companyname = "";
                                                                                                String experience = "";
                                                                                                String salary = "";

                                                                                                con = DBClass.DBConnectMethod();
                                                                                                ps = con.prepareStatement("select * from mentee  where uname=? and password=?");
                                                                                                ps.setString(1, uname);
                                                                                                ps.setString(2, password);
                                                                                                rs = ps.executeQuery();

                                                                                                if (rs.next()) {

                                                                                                    companyname = rs.getString("companyname");
                                                                                                    experience = rs.getString("experience");
                                                                                                    salary = rs.getString("salary");

                                                                                                }

                                                                                            %>     
                                                                                            <form role="form" method="post" action="Intership" style="margin-left:105px;">
                                                                                                <input type="hidden" value="<%=uname%>" name="uname">

                                                                                                    <input type="hidden" value="<%=password%>" name="password">
                                                                                                        <div class="form-group">
                                                                                                            <label>Companey Name:</label>
                                                                                                            <input class="form-control" value="<%=companyname%>" name="companyname"/>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label>Experience:</label>
                                                                                                            <input class="form-control" value="<%=experience%>" name="experience"/>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label>Salary :</label>
                                                                                                            <input class="form-control" value="<%=salary%>" name="salary"/>
                                                                                                        </div>

                                                                                                        <center>
                                                                                                            <button type="submit" class="btn btn-primary">Update Profile</button>
                                                                                                        </center>
                                                                                                        </form>
                                                                                                        </div>

                                                                                                        <div class="tab-pane fade" id="curricular-pills">
                                                                                                            <h4 style="color:maroon; font-style: inherit;">Certificates</h4>
                                                                                                            <form  method="post"  action="ImgUpload" enctype="multipart/form-data" class="col-md-6" method="post">
                                                                                                                <input type="hidden" value="<%=uname%>" name="uname">
                                                                                                                    <input type="hidden" value="<%=password%>" name="password">
                                                                                                                        <hr>
                                                                                                                            <textarea rows="5" cols="30" name="textline" placeholder=" Description/Names of the Certificates:"></textarea> 
                                                                                                                            <br><br>
                                                                                                                                    <input type="file" name="file" size="40"> <br>

                                                                                                                                            <input type="submit" class="btn btn-primary" value="Submit Document">
                                                                                                                                                </form>
                                                                                                                                                <hr>
                                                                                                                                                    <%
                                                                                                                  con.prepareStatement("select * from mentee where uname=? and password=?");
                                                                                                                  ps.setString(1, uname);
                                                                                                                  ps.setString(2, password);
                                                                                                                  rs = ps.executeQuery();
                                                                                                                  if (rs.next()) {
                                                                                                                      if (rs.getString("imagename") != "") {%>
                                                                                                                                                    <p class= "col-md-6">
                                                                                                                                                        <textarea rows="5" cols="20" name="textline" input disabled style="color: red;">Document already uploaded   <%=rs.getString("imagename")%></textarea> 

                                                                                                                                                        <% } else {
                                                                                                                                                }
                                                                                                                                            }%>




                                                                                                                                                        <!-- /. ROW  -->

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
