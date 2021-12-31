<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.practical.entity.Brand" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.practical.entity.Phone" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
    request.setCharacterEncoding("utf-8");
    ArrayList<Brand> listBrand = (ArrayList<Brand>)request.getAttribute("listBrand");
    ArrayList<Phone> listPhone = (ArrayList<Phone>)request.getAttribute("listPhone");
    Phone phone = (Phone) request.getAttribute("phone");
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (phone == null) {
        phone = new Phone();
    }
    if (errors == null) {
        errors = new HashMap<>();
    }
%>
<jsp:include page="../../adminPage/layout/head.jsp">
    <jsp:param name="title" value="Phone"/>
</jsp:include>

<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4; background-color: #17a2b8 !important;">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();">
        <i class="fa fa-bars"></i>  Menu</button>
    <span class="w3-bar-item w3-right">Logo</span>
</div>
<div id="sideBar">
    <!-- Sidebar/menu -->
    <jsp:include page="../../adminPage/layout/menu-sidebar.jsp"/>
</div>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <jsp:include page="../../adminPage/layout/header.jsp"/>
    <section class="content-header" style="padding:0.5%  !important">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-6">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i> &nbsp;AdminPage</a>
                        </li>
                        <li class="breadcrumb-item active">PHONE</li>
                    </ol>
                </div>
                <div class="col-md-6">
                    <button data-toggle="modal" data-target="#exampleModal" class="btn btn-outline-success btn-sm" style="float: right;" data-type="insert">
                        <i class="fas fa-plus-circle"></i> Add new
                    </button>
                    <button class="btn btn-outline-info btn-sm"  type="submit" style="float: right;margin-right: 5px;">
                        <i class="fas fa-search"></i> Search
                    </button>
                </div>
            </div>
        </div>
    </section>
    <!----------------------------------------------- TABLE ------------------------------------------------->
    <section class="content cus-body">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tab-content">
                            <div class="active tab-pane">
                                <div class="table-responsive" style="max-height: 60vh; margin-bottom: 15px;">
                                    <div class="col-md-12" style="margin: 10px auto">
                                        <div class="container">
                                            <input type="text" class="form-control" placeholder="search with any words...">
                                        </div>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead style="text-align: center;">
                                        <tr>
                                            <th scope="col">Number</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Brand</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <% for(int i = 0; i < listPhone.size(); i++) { %>
                                        <tr>
                                            <td style="text-align: center"><%=listPhone.get(i).getPhoneID()%></td>
                                            <td><%=listPhone.get(i).getName()%></td>
                                            <td style="text-align: center"><%=listPhone.get(i).getPrice()%> $</td>
                                            <td><%=listPhone.get(i).getDescription()%></td>

                                            <td style="text-align: center">
                                                <% for(int j = 0; j < listBrand.size(); j++) { %>
                                                    <%if (listBrand.get(i).getBrandID() == listBrand.get(j).getBrandID()) { %>
                                                        <%=listBrand.get(i).getName()%>
                                                    <% } %>
                                                <% } %>
                                            </td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <hr>

    <jsp:include page="../../adminPage/layout/footer.jsp"/>
    <!-- End page content -->
</div>

<%------------------------------------------ADD MODAL------------------------------------------%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add new</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/Practical_war_exploded/adminPage/phone" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="name" class="col-form-label">NAME:</label>
                                <input type="text" class="form-control" id="name" name="name">
                                <% if(errors.containsKey("name")){ %>
                                <p style="color: red; font-weight: bold"><%= errors.get("name") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" for="name" class="col-form-label">PRICE:</label>
                                <input type="number" class="form-control" id="price" name="price" value="0">
                                <% if(errors.containsKey("price")){ %>
                                <p style="color: red; font-weight: bold"><%= errors.get("price") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" for="brandID" class="col-form-label">BRAND:</label>
                                <select name="brandID" id="brandID" class="form-control" name="brandID">
                                    <option value="0">Select Brand</option>
                                    <% for(int i = 0; i < listBrand.size(); i++) { %>
                                    <option value="<%=listBrand.get(i).getBrandID()%>"><%=listBrand.get(i).getName()%></option>
                                    <% } %>
                                </select>
                                <% if(errors.containsKey("brand")){ %>
                                <p style="color: red; font-weight: bold"><%= errors.get("brand") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="description" class="col-form-label">DESCRIPTION:</label>
                                <input type="text" class="form-control" id="description" name="description">
                                <% if(errors.containsKey("description")){ %>
                                <p style="color: red; font-weight: bold"><%= errors.get("description") %></p>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-md btn-outline-success" id="insertBtn" onclick="save()">
                            <i class="fa-plus-circle fas"></i> Save
                        </button>
                        <button type="button" class="btn btn-md btn-outline-danger" data-dismiss="modal"
                                style="margin-left: 1em;">
                            <i class="far fa-times-circle"></i> Close
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../../static/js/admin/index.js"></script>
<script type="text/javascript">
    $('#exampleModal').on('show.bs.modal', function (event) {
    })

    function save() {

    }
</script>
</html>
