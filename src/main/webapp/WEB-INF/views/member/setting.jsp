<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="text/plain; charset=utf-8">
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
				            placement:'bottom-right',
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
				            placement:'bottom-right',
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
			
			$(document).on('click', '#save-name', function(event) {
				
				var check = true;
				
				$('form#changename input[type=text]').each(function() {
					if($(this).attr('value') == "") {
						event.preventDefault();
						$("#name-error").html("input please");
						$("#name-error").css('display', 'block');
						check = false;
						return;	
					}
				});
				
				if(check) {
					var formData2 = $('form#changename').serialize();
				
					$.ajax({
						url : "/finalProject/member/change.action",
						type : "post",
						async: true,
						data : formData2,
						success : function(result) {
							//alert(result);
							if(result != null) {
								event.preventDefault();
								$("#name-error").html(result);
								$("#name-error").css('display', 'block');
								
								return;
							}
							
						},
						error: function(xhr, state, e) {
							//alert(state + "/" + e);
						}
					});
				}
				
				event.preventDefault();
			});
				
		
			$(document).on('click', '#save-pass', function(event) {
				var check = true;
				
				$('form#changepass input[type=password]').each(function() {
					if($(this).attr('value') == "") {
						event.preventDefault();
						$("#password-error").html("input please");
						$("#password-error").css('display', 'block');
						check = false;
						return;	
					}
				});
				
				if(check) {
					var formData = $('form#changepass').serialize();
					
					$.ajax({
						url : "/finalProject/member/change.action",
						type : "post",
						async: true,
						data : formData,
						success : function(result) {
							//alert(result);
							if(result != null) {
								event.preventDefault();
								$("#password-error").html(result);
								$("#password-error").css('display', 'block');
								
								return;
							}
							
						},
						error: function(xhr, state, e) {
							//alert(state + "/" + e);
						}
					});
				}
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