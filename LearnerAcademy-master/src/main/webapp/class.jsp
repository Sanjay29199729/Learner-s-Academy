<!doctype html>
<%@page import="com.entities.Classes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css.jsp"%>
<style>
body {
	background-image: url('img/School-Education-Backgrounds.jpg');
}
</style>

<title>Learner's Academy : Class</title>

</head>

<body>
	<div class="container mt-2">
		<%@include file="navbar.jsp"%>

		<div class="container mt-2">
			<h2 style="text-align: center">Manage Class</h2>
		</div>

		<div class="container mt-3">
			<div class="row mt-3">
				<div class="col-md-2 mt-3">

					<div class="list-group">
						<button type="button"
							class="list-group-item list-group-item-action active">Menu</button>
						<a href="add_class.jsp"
							class="list-group-item list-group-item-action">Add Class</a> <a
							href="class.jsp" class="list-group-item list-group-item-action">View
							Class</a>

					</div>
				</div>
				<div class="col-md-10">
					<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Classes");
					List<Classes> list = q.list();
					for (Classes classes : list) {
					%>

					<div class="card mt-3 ">
						<img src="img/class.png" style="max-width: 30px;"
							class="card-img-top pt-2 pl-2 m-2 " alt="...">
						<div class="card-body px-5">
							<h4>
								ID :-<%=classes.getClassid()%></h4>
							<h5 class="card-title">
								Class Title:
								<%=classes.getClasstitle()%></h5>
							<p class="card-text">
								Class Name:<%=classes.getClassname()%></p>

							<a href="DeleteClasses?classes_id=<%=classes.getClassid()%>"
								class="btn btn-danger">Delete</a> <a
								href="update_class.jsp?classes_id=<%=classes.getClassid()%>"
								class="btn btn-primary">Update</a> <a
								href="class_report.jsp?classes_id=<%=classes.getClassid()%>"
								class="btn btn-success">Generate Report</a>
						</div>
					</div>

					<%
					}

					s.close();
					%>
				</div>

			</div>

		</div>


	</div>


</body>

</html>