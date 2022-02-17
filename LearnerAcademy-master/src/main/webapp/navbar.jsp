<nav class="navbar navbar-expand-lg navbar-dark purple">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Learner's Academy</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="welcome.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="class.jsp">Classes</a></li>

				<li class="nav-item"><a class="nav-link" href="subjects.jsp">Subjects</a></li>

				<li class="nav-item"><a class="nav-link" href="students.jsp">Students</a></li>

				<li class="nav-item"><a class="nav-link" href="teachers.jsp">Teachers</a></li>
			</ul>
			<form class="d-flex" method="get" action="LoginController">
				<input class="form-control me-2" 
					aria-label="Search">
				<button class="btn btn-outline-light" type="submit">Logout</button>
			</form>
		</div>
	</div>

</nav>

