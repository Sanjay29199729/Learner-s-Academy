<!doctype html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entities.Students"%>
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

		<%
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");

		int sId = Integer.parseInt(request.getParameter("student_id"));
		Session s = FactoryProvider.getFactory().openSession();

		//Load Object
		Students student = (Students) s.get(Students.class, sId);
		s.close();
		%>


		<div class="container mt-3">


			<div class="row mt-5">
				<div class="col-md-2">

					<div class="list-group">
						<button type="button"
							class="list-group-item list-group-item-action active">Menu</button>
						<a href="add_student.jsp"
							class="list-group-item list-group-item-action">Add Class</a> <a
							href="students.jsp"
							class="list-group-item list-group-item-action">View Class</a>

					</div>
				</div>

				<div class="col-md-10">

					<h4>Update student details:-</h4>

					<!-- this is add form  -->
					<form action="UpdateStudents" method="post">

						<input value="<%=student.getStudentid()%>" name="student_id"
							type="hidden" />

						<div class="mb-3">
							<label for="name" class="form-label">Student Name:</label> <input
								name="student_name" required type="text" class="form-control"
								id="student" placeholder="Student Name"
								value="<%=student.getStudentname()%>" />

						</div>
						<div class="mb-3">
							<label for="dob" class="form-label">Date of Birth:<%=format.format(student.getDob())%></label>
							<input name="student_dob" required type="date"
								class="form-control" id="dob" placeholder="Date of Birth"
								value="<%=format.format(student.getDob())%>" />

						</div>
						<div class="mb-3">
							<label for="fathername" class="form-label">Father Name:</label> <input
								name="student_fathername" required type="text"
								class="form-control" id="fathername" placeholder="Father Name"
								value="<%=student.getFathername()%>" />

						</div>
						<div class="mb-3">
							<label for="mothername" class="form-label">Mother Name</label> <input
								name="student_mothername" required type="text"
								class="form-control" id="mothername" placeholder="Mother Name"
								value="<%=student.getMothername()%>" />

						</div>
						<div class="mb-3">
							<label for="address" class="form-label">Address:</label> <input
								name="student_address" required type="text" class="form-control"
								id="address" placeholder="Student Address"
								value="<%=student.getStudentaddress()%>" />

						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email:</label> <input
								name="student_email" required type="email" class="form-control"
								id="email" placeholder="Email"
								value="<%=student.getStudentemail()%>" />

						</div>
						<div class="mb-3">
							<label for="contact" class="form-label">Contact:</label> <input
								name="student_contact" required type="number"
								class="form-control" id="contact" placeholder="Student Contact"
								value="<%=student.getStudentcontact()%>" />

						</div>
						
						<div class="mb-3">
							<label for="classid" class="form-label">Set Class ID:-</label> <input
								name="class_id" required type="number"
								class="form-control" id="classid" placeholder="Class ID"
								value="<%=student.getClassid()%>" />

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-success">Update</button>
						</div>

					</form>

				</div>


			</div>

		</div>


	</div>


</body>

</html>