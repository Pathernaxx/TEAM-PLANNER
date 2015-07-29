<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="charset=utf-8">
<div id="settings">
	<h1>Account Details</h1>
	<hr/>
	<div>
		<a href="#" id="changename" class="big-link js-change-name">
			<span class="text">Change Name, Initails</span>
		</a>
		<a href="#" id="changeavatar" class="big-link js-change-avatar">
			<span class="text">Change Avatar</span>
		</a>
		<a href="#" id="changepass" class="big-link js-change-password">
			<span class="text">Change Password</span>
		</a>
		<script type="text/javascript">
			$(function() {			
				
				$.ajax({
					url: "/finalProject/member/changenameform.action",
					type: "get",
					success: function(result) {
						$('#changename').webuiPopover({
							constrains: 'horizontal', 
				            trigger:'click',
				            multi: false,
				            placement:'bottom',
				            width:300,
							closeable: true,
							arrow: false,
							title: 'ChangeName',
				            content: result
						});
					},
					error: function() {
						alert('error');
					}
				});
				
				$.ajax({
					url: "/finalProject/member/changepassform.action",
					type: "get",
					success: function(result) {
						$('#changepass').webuiPopover({
							constrains: 'horizontal', 
				            trigger:'click',
				            multi: false,
				            placement:'bottom',
				            width:300,
							closeable: true,
							arrow: false,
							title: 'Change Password',
				            content: result 
						});
					},
					error: function() {
						alert('error');
					}
				});
			});
			
			$(document).on('click', '#save', function(event) {
				
				if( $('form input[value=""]') > 0 ) {
					event.preventDefault();
					$(".error").html("WHY");
					$(".error").css('display', 'block');
					return;	
				}
				
				var formData = $("form").serialize();
				
				$.ajax({
					url : "/finalProject/member/change.action",
					type : "post",
					async: true,
					data : formData,
					success : function(result) {
						if(result != null) {
							event.preventDefault();
							$(".error").html(result);
							$(".error").css('display', 'block');
							return;
						}
					},
					error: function() {
						
					}
				})
				event.preventDefault();
				
			});
		</script>
	</div>
	<h1>Notification</h1>
	<hr/>
	<div>
		<a href="#" id="changenotifi">Change Notification for Email</a>
	</div>
</div>