<!doctype html>
<%@page import="com.entities.Teachers"%>
<%@page import="com.entities.Subjects"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="com.entities.Students"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Classes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css.jsp"%>
<style>
body {
	background-image: url('img/School-Education-Backgrounds.jpg');
}
</style>

<title>Learner's Academy : Class</title>

</head>

<body>
	<div class="container mt-2">
		<%@include file="navbar.jsp"%>

		<div class="container mt-3">
			<div class="row mt-3">
				<div class="col-md-2 mt-3">

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
					<%
					SimpleDateFormat format=new SimpleDateFormat("dd-MM-yyyy");
					int classid = Integer.parseInt(request.getParameter("classes_id").trim());
					Session s = FactoryProvider.getFactory().openSession();
					System.out.println("classid : " + classid);
					Query hql1 = s.createQuery("from Classes as c where c.classid=:x");
					hql1.setParameter("x", classid);
					hql1.setMaxResults(1);
					Classes classes = (Classes) hql1.uniqueResult();
					/* List<Classes> list = q.list();
					for (Classes classes : list) { */
					%>

					<h3 style="text-align: center">- - - Class Report - - -</h3>
					<h3 style="text-align: center">
						ID :-
						<%=classes.getClassid()%>
						&nbsp;&nbsp;Type :-
						<%=classes.getClasstitle()%>
						&nbsp;&nbsp;Name :-
						<%=classes.getClassname()%>
					</h3>
					<%
					Query hql2 = s.createQuery("from Students as s where s.classid=:x");
					hql2.setParameter("x", classid);
					List<Students> list2 = hql2.list();
					
					%>

					<br>
					<div style="text-align: center;">
						<b>Student Details</b> <br />
						<table class="table" border="1px"
							style="text-align: center; margin-left: auto; margin-right: auto;">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">D.O.B</th>
									<th scope="col">Father</th>
									<th scope="col">Mother</th>
									<th scope="col">Admission Date</th>
									<th scope="col">Contact</th>

								</tr>
							</thead>
							<tbody><%for (Students student : list2){ %>
								<tr>
									<th scope="row"><%=student.getStudentid() %></th>
									<td><%=student.getStudentname() %></td>
									<td><%=format.format(student.getDob()) %></td>
									<td><%=student.getFathername()%></td>
									<td><%=student.getMothername()%></td>
									<td><%=student.getDoa()%></td>
									<td><%=student.getStudentcontact()%></td>
								</tr><%} %>
							</tbody>
						</table>

					</div>
					
					<br>
					<%
					Query hql3 = s.createQuery("from Subjects as s where s.classid=:x");
					hql3.setParameter("x", classid);
					List<Subjects> list3 = hql3.list();
					%>
					<br>
					<div style="text-align: center;">
						<b>Subject Details</b> <br />
						<table class="table" border="1px"
							style="text-align: center; margin-left: auto; margin-right: auto;">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>

								</tr>
							</thead>
							<tbody><%for (Subjects subject : list3){ %>
								<tr>
									<th scope="row"><%=subject.getSubjectid() %></th>
									<td><%=subject.getSubjectname()%></td>
								</tr><%} %>
							</tbody>
						</table>

					</div>
					<br>
					<%
					Query hql4 = s.createQuery("from Teachers as t where t.teacherid in (select ts.teacherid from Subjects ts where ts.classid=:x)");
					hql4.setParameter("x", classid);
					List<Teachers> list4 = hql4.list();
					%>
					<br>
					<div style="text-align: center;">
						<b>Teacher Details</b> <br />
						<table class="table" border="1px"
							style="text-align: center; margin-left: auto; margin-right: auto;">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">Age</th>
									<th scope="col">Qualification</th>
									<th scope="col">Email</th>
									<th scope="col">Contact</th>

								</tr>
							</thead>
							<tbody><%for (Teachers teacher : list4){ %>
								<tr>
									<th scope="row"><%=teacher.getTeacherid()%></th>
									<td><%=teacher.getTeachername()%></td>
									<td><%=teacher.getTeacherage()%></td>
									<td><%=teacher.getTeacherqualification()%></td>
									<td><%=teacher.getTeacheremail()%></td>
									<td><%=teacher.getTeachercontact()%></td>
								</tr><%} %>
							</tbody>
						</table>

					</div>


					<%

					s.close();
					%>
				</div>

			</div>

		</div>


	</div>


</body>

</html>