<!doctype html>
<%@page import="com.entities.Classes"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css.jsp"%>

<title>Learner's Academy : Classes</title>
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
		int classesId = Integer.parseInt(request.getParameter("classes_id"));
		Session s = FactoryProvider.getFactory().openSession();

		//Load Object
		Classes classes = (Classes) s.get(Classes.class, classesId);
		s.close();
		%>


		<div class="container mt-3">


			<div class="row mt-5">
				<div class="col-md-2">

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

					<h3>Edit class details:</h3>

					<!-- this is add form  -->
					<form action="UpdateClasses" method="post">
						<input value="<%=classes.getClassid()%>" name="classes_id"
							type="hidden" />
						<div class="mb-3">
							<label for="title" class="form-label">Class Title</label> <input
								name="title" required type="text" class="form-control"
								id="title" placeholder="Title"
								value="<%=classes.getClasstitle()%>" />

						</div>
						<div class="mb-3">
							<label for="name" class="form-label">Class Name</label> <input
								name="name" required type="text" class="form-control" id="title"
								placeholder="Class Name" value="<%=classes.getClassname()%>" />

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