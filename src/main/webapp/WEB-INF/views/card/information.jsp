<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="charset=utf-8">
<script>

$(".editinfo").click(function() {
	$(".editinfo").css("display", "none");
	$(".editinfo").css("visibility", "hidden");
	$(".editform").css("display", "block");
	$(".editform").css("visibility", "visible");
});

</script>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="editinfo">
	<img src="/finalProject/resources/styles/images/icons/234.png"
	class="window-icon2" />&nbsp;
	Edit the Discription
</a>
${listno }
<div class="editform">
	<form action="writecardinfo.action" method="post" enctype="multipart/form-data">
		<input name="information" type="text" class="edit-cardinfo"/>
		<input type="hidden" value="${boardno }">
		<input type="hidden" value="${cardno }">
		<input type="hidden" value="${listno }">
	</form><br/>
	<input type="submit" value="save" class="window-sidebutton"
			 style='float:right;text-align:center' onclick="document.forms[0].submit();"/>
</div>
