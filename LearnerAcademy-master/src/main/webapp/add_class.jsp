<!doctype html>
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

					<h3>Please fill class details:</h3>

					<!-- this is add form  -->
					<form action="AddClasses" method="post">
						<div class="mb-3">
							<label for="title" class="form-label">Class</label> <input
								name="title" required type="text" class="form-control"
								id="title" placeholder="Class" />

						</div>
						<div class="mb-3">
							<label for="name" class="form-label">Section</label> <input
								name="name" required type="text" class="form-control"
								id="section" placeholder="Section" />

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