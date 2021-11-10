$(document).on('turbolinks:load', function() {
	$("#postsTable").DataTable({
		columns: [null, null, {orderable: false}, {orderable: false}, {orderable: false}]
	});

	$("#usersTable").DataTable({
		columns: [null, null, {orderable: false}, {orderable: false}, {orderable: false}, {orderable: false}]
	});
});