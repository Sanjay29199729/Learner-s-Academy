<!doctype html>
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

					<h3>Please fill Teacher details:</h3>

					<!-- this is add form  -->
					<form action="AddTeacher" method="post">
						<div class="mb-3">
							<label for="teacher_name" class="form-label">Teacher:-</label> <input
								name="teacher_name" required type="text" class="form-control"
								id="teacher_name" placeholder="Teacher Name" />

						</div>
						<div class="mb-3">
							<label for="teacher_age" class="form-label">Age:-</label> <input
								name="teacher_age" required type="number" class="form-control"
								id="teacher_age" placeholder="Age" />

						</div>
						<div class="mb-3">
							<label for="teacher_qualification" class="form-label">Qualification:-</label>
							<input name="teacher_qualification" required type="text"
								class="form-control" id="teacher_qualification"
								placeholder="Qualification" />

						</div>
						<div class="mb-3">
							<label for="teacher_address" class="form-label">Address:-</label>
							<input name="teacher_address" required type="text"
								class="form-control" id="teacher_address" placeholder="Address" />

						</div>
						<div class="mb-3">
							<label for="teacher_email" class="form-label">Email:-</label> <input
								name="teacher_email" required type="email" class="form-control"
								id="teacher_email" placeholder="Email" />

						</div>
						<div class="mb-3">
							<label for="teacher_contact" class="form-label">Contact:-</label>
							<input name="teacher_contact" required type="number"
								class="form-control" id="teacher_contact" placeholder="Contact" />

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>


			</div>

		</div>


	</div>


</body>

</html>