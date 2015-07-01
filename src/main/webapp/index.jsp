<%-- <% 
	response.sendRedirect("angularServiceCall");
%> --%>
<html>
<head>
	<title>Home - NextGen API Client</title>
	<link type="text/css" href="static/css/metro-bootstrap.min.css" rel="stylesheet"/>
</head>
<body style="padding:20px">
<h2>NextGen API Client</h2>
<!-- <a href="angularServiceCallGet">angularServiceCall Get</a> <br>
<a href="angularServiceCallPost">angularServiceCall Post</a><br>
<a href="angularServiceCallFormPost">angularServiceCall Form Post</a><br>
<a href="ShowPersonView">List all the users</a><br>
<a href="ShowInvitationList">Invitations</a> <br>
<a href="createPersonViewVersionBeta">Create a User</a><br>
<a href="PersonDetailsView">Show detailed info about the Person/User</a><br> -->
<div style="width:883px">
<div class="col-sm-6 col-md-2">
	<div class="thumbnail tile tile-medium tile-red">
		<a href="ShowPersonView"><h1>
			See All Users
		</h1></a>
	</div>
</div>
<div class="col-sm-6 col-md-2">
	<div class="thumbnail tile tile-medium tile-wet-asphalt col-md-3">
		<a href="createPersonViewVersionBeta"><h1>
			Create a User
		</h1></a>
	</div>
</div>
<div class="col-sm-6 col-md-2">
	<div class="thumbnail tile tile-medium tile-green">
		<a href="PersonDetailsView"><h1>
			User Details
		</h1></a>
	</div>
</div>
<div class="col-sm-6 col-md-2">
	<div class="thumbnail tile tile-medium tile-amethyst">
		<a href="createInviteView"><h1>
			Invite User
		</h1></a>
	</div>
</div>
<div class="col-sm-6 col-md-2">
	<div class="thumbnail tile tile-medium tile-teal">
		<a href="ShowInvitationList"><h1>
			Invitations
		</h1></a>
	</div>
</div></div>
</body>
</html>
