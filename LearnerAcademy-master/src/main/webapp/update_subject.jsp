<!doctype html>
<%@page import="com.entities.Subjects"%>
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
		<%
		int sId = Integer.parseInt(request.getParameter("subject_id"));
		Session s = FactoryProvider.getFactory().openSession();
		Subjects subject = (Subjects) s.get(Subjects.class, sId);
		s.close();
		%>

		<div class="container mt-3">


			<div class="row mt-5">
				<div class="col-md-2">

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

					<h4>Please fill subject details:-</h4>

					<!-- this is add form  -->
					<form action="UpdateSubject" method="post">
						<input value="<%=subject.getSubjectid()%>" name="subject_id"
							type="hidden" />
						<div class="mb-3">
							<label for="name" class="form-label">Subject Name</label> <input
								name="subject_name" required type="text" class="form-control"
								id="subject" placeholder="Subject Name"
								value="<%=subject.getSubjectname()%>" />
						</div>
						<div class="mb-3">
							<label for="id" class="form-label">Set Class ID:</label> <input
								name="class_id" required type="text" class="form-control"
								id="class" placeholder="New Class ID"
								value="<%=subject.getClassid()%>" />
						</div>
						<div class="mb-3">
							<label for="id" class="form-label">Set Teacher ID:</label> <input
								name="teacher_id" required type="text" class="form-control"
								id="class" placeholder="New Teacher ID"
								value="<%=subject.getTeacherid()%>" />
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