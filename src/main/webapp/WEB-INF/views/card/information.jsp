<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="charset=utf-8">
<script>

$(".editinfo").click(function() {
	$(".editinfo").css("display", "none");
	$(".editinfo").css("visibility", "hidden");
	$(".editform").css("display", "block");
	$(".editform").css("visibility", "visible");
});

$("#cancel").click(function() {
	$("#information").val("");
	$(".editform").css("display", "none");
	$(".editform").css("visibility", "hidden");
	$(".editinfo").css("display", "block");
	$(".editinfo").css("visibility", "visible");
});

$("#infosubmit").click(function(e) {
	alert($("#listno").val());
	$.ajax({
		url: "/finalProject/card/writecardinfo.action",
		async: true,
		type: "post",
		data: {
			boardno: $("#boardno").val(),
			listno: $("#listno").val(),
			cardno: $("#cardno").val(),
			information: $("#information").val()
		},
		success: function(message) {
			if(message == "success") {
				var url = "/finalProject/card/cardview.action";
				$(location).attr('href', url);
			} else {
				alert("fail");
			}
		},
		error: function(xhr, status, ex) {
			alert(status + ex);
		}
	});
	e.preventDefault();
});

</script>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="editinfo" style="cursor: pointer;">
	<img src="/finalProject/resources/styles/images/icons/234.png"
	class="window-icon2" />&nbsp;
	Write the Discription
</a>
<div class="editform">
	<form id="editcontent" action="writecardinfo.action" method="post" enctype="multipart/form-data">
		<input id="information" type="text" class="edit-cardinfo"/>
		<input type="hidden" id="boardno" value="${boardno }">
		<input type="hidden" id="cardno" value="${cardno }">
		<input type="hidden" id="listno" value="${listno }">
	</form><br/>
	<!-- <input id="infosubmit" type="submit" value="save" class="window-sidebutton"
			 style='float:right;text-align:center'/> -->
	<input type="button" value="save" id="infosubmit" class="window-sidebutton" style='float:right;text-align:center'/>
	<input type="button" value="cancel" id="cancel" class="window-sidebutton" style='float:right;text-align:center' />
</div>
