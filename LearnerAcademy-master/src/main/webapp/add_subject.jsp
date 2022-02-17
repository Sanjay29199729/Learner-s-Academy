<!doctype html>
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
					<form action="AddSubjects" method="post">

						<div class="mb-3">
							<label for="name" class="form-label">Subject Name</label> <input
								name="subject_name" required type="text" class="form-control"
								id="subject" placeholder="Subject Name" />

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