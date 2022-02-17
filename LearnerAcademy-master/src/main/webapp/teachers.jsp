<!doctype html>
<%@page import="com.entities.Teachers"%>
<%@page import="com.entities.Subjects"%>
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


<title>Learner's Academy : Teachers</title>
<style>
body {
	background-image: url('img/School-Education-Backgrounds.jpg');
}
</style>
</head>

<body>
	<div class="container mt-2">
		<%@include file="navbar.jsp"%>
		<div class="container mt-2">
			<h2 style="text-align: center">Manage Teacher</h2>
		</div>

		<div class="container mt-3">


			<div class="row mt-3">
				<div class="col-md-2 mt-3">

					<div class="list-group">
						<button type="button"
							class="list-group-item list-group-item-action active">Menu</button>
						<a href="add_teacher.jsp"
							class="list-group-item list-group-item-action">Add Teacher</a> <a
							href="teachers.jsp"
							class="list-group-item list-group-item-action">View Teacher</a>

					</div>
				</div>
				<div class="col-md-10">
					<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Teachers");
					List<Teachers> list = q.list();
					for (Teachers teacher : list) {
					%>

					<div class="card mt-3 ">
						<img src="img/class.png" style="max-width: 30px;"
							class="card-img-top pt-2 pl-2 m-2 " alt="...">
						<div class="card-body px-5">
							<h4>
								ID:
								<%=teacher.getTeacherid()%></h4>
							<h5 class="card-title">
								Teacher:-<%=teacher.getTeachername()%></h5>
							<p class="card-text">
								Age:-<%=teacher.getTeacherage()%>
							</p>
							<p class="card-text">
								Qualification:-<%=teacher.getTeacherqualification()%></p>
							<p class="card-text">
								Address:-<%=teacher.getTeacheraddress()%></p>
							<p class="card-text">
								Email:-<%=teacher.getTeacheremail()%></p>
							<p class="card-text">
								Contact:-<%=teacher.getTeachercontact()%></p>


							<a href="DeleteTeacher?teacher_id=<%=teacher.getTeacherid()%>"
								class="btn btn-danger">Delete</a> <a
								href="update_teacher.jsp?teacher_id=<%=teacher.getTeacherid()%>"
								class="btn btn-primary">Update</a>
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