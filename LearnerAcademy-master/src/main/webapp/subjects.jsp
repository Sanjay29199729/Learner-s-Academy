<!doctype html>
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


<title>Learner's Academy : Subjects</title>
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
			<h2 style="text-align: center">Manage Subjects</h2>
		</div>

		<div class="container mt-3">


			<div class="row mt-3">
				<div class="col-md-2 mt-3">

					<div class="list-group">
						<button type="button"
							class="list-group-item list-group-item-action active">Menu</button>
						<a href="add_subject.jsp"
							class="list-group-item list-group-item-action">Add Subject</a> <a
							href="subjects.jsp"
							class="list-group-item list-group-item-action">View Subject</a>

					</div>
				</div>
				<div class="col-md-10">
					<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Subjects");
					List<Subjects> list = q.list();
					for (Subjects subjects : list) {
					%>

					<div class="card mt-3 ">
						<img src="img/class.png" style="max-width: 30px;"
							class="card-img-top pt-2 pl-2 m-2 " alt="...">
						<div class="card-body px-5">
							<h4>
								ID:
								<%=subjects.getSubjectid()%></h4>
							<h5 class="card-title"><%=subjects.getSubjectname()%></h5>


							<a href="DeleteSubject?subject_id=<%=subjects.getSubjectid()%>"
								class="btn btn-danger">Delete</a> <a
								href="update_subject.jsp?subject_id=<%=subjects.getSubjectid()%>"
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