<!doctype html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entities.Students"%>
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


<title>Learner's Academy : Students</title>
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
			<h2 style="text-align: center">Manage Students</h2>
		</div>


		<div class="container mt-3">


			<div class="row mt-3">
				<div class="col-md-2 mt-3">

					<div class="list-group">
						<button type="button"
							class="list-group-item list-group-item-action active">Menu</button>
						<a href="add_student.jsp"
							class="list-group-item list-group-item-action">Add Students</a> <a
							href="students.jsp"
							class="list-group-item list-group-item-action">View Students</a>

					</div>
				</div>
				<div class="col-md-10">
					<%
					SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Students");
					List<Students> list = q.list();
					for (Students student : list) {
					%>

					<div class="card mt-3 ">
						<img src="img/class.png" style="max-width: 30px;"
							class="card-img-top pt-2 pl-2 m-2 " alt="...">
						<div class="card-body px-5">
							<h4>
								ID:
								<%=student.getStudentid()%></h4>
							<h5 class="card-title">
								Name:-<%=student.getStudentname()%></h5>
							<p class="card-text">
								Date of Birth:-<%=format.format(student.getDob())%></p>
							<p class="card-text">
								Father's Name:-<%=student.getFathername()%></p>
							<p class="card-text">
								Mother's Name:-<%=student.getMothername()%></p>
							<p class="card-text">
								Address:-<%=student.getStudentaddress()%></p>
							<p class="card-text">
								Contact:-<%=student.getStudentcontact()%></p>
							<p class="card-text">
								Email:-<%=student.getStudentemail()%></p>
							<p class="card-text">
								Date of Admission:-<%=student.getDoa()%></p>



							<a href="DeleteStudents?student_id=<%=student.getStudentid()%>"
								class="btn btn-danger">Delete</a> <a
								href="update_student.jsp?student_id=<%=student.getStudentid()%>"
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