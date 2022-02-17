<!doctype html>
<%@page import="com.entities.Teachers"%>
<%@page import="com.entities.Classes"%>
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

		<%
		int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
		Session s = FactoryProvider.getFactory().openSession();

		//Load Object
		Teachers teacher = (Teachers) s.get(Teachers.class, teacherId);
		s.close();
		%>


		<div class="container mt-3">


			<div class="row mt-5">
				<div class="col-md-2">

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

					<h3>Edit Teacher's details:</h3>

					<!-- this is add form  -->
					<form action="UpdateTeacher" method="post">
						<input value="<%=teacher.getTeacherid()%>" name="teacher_id"
							type="hidden" />
						<div class="mb-3">
							<label for="teacher" class="form-label">Teacher Name:-</label> <input
								name="teacher_name" required type="text" class="form-control"
								id="name" placeholder="Teacher Name"
								value="<%=teacher.getTeachername()%>" />

						</div>
						<div class="mb-3">
							<label for="teacher" class="form-label">Age:-</label> <input
								name="teacher_age" required type="number" class="form-control"
								id="age" placeholder="Age" value="<%=teacher.getTeacherage()%>" />

						</div>
						<div class="mb-3">
							<label for="teacher" class="form-label">Qualification:-</label> <input
								name="teacher_qualification" required type="text"
								class="form-control" id="qualification"
								placeholder="Qualification"
								value="<%=teacher.getTeacherqualification()%>" />

						</div>
						<div class="mb-3">
							<label for="teacher" class="form-label">Address:-</label> <input
								name="teacher_address" required type="text" class="form-control"
								id="address" placeholder="Address"
								value="<%=teacher.getTeacheraddress()%>" />

						</div>
						<div class="mb-3">
							<label for="teacher" class="form-label">Email:-</label> <input
								name="teacher_email" required type="email" class="form-control"
								id="email" placeholder="Email"
								value="<%=teacher.getTeacheremail()%>" />

						</div>
						<div class="mb-3">
							<label for="teacher" class="form-label">Contact:-</label> <input
								name="teacher_contact" required type="number"
								class="form-control" id="contact" placeholder="Contact"
								value="<%=teacher.getTeachercontact()%>" />

						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-success">Save
								Update</button>
						</div>

					</form>

				</div>


			</div>

		</div>


	</div>


</body>

</html>