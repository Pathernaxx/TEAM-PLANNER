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
	$.ajax({
		url: "/finalProject/card/writecardinfo.action",
		async: true,
		type: "post",
		data: {
			boardno: '${boardno}',
			listno: '${listno}',
			cardno: '${cardno}',
			information: $("#information").val()
		},
		success: function(message) {
			if(message == "success") {
				//var url = "/finalProject/card/cardview.action";
				//$(location).attr('href', url);
				
				var information = $("#information").val();
				
				$('.editinfo').css('visibility', 'hidden');
				$('.editinfo').css('display', 'none');
				$('.editinfo').css('height', '0px');
				
				$('.savedinfo').css('visibility', 'visible');
				$('.savedinfo').css('display', 'block');
				$(".savedinfodata").html(information);
				//$('.savedinfo').append(string);
				
				$('.editform').css('visibility', 'hidden');
				$('.editinfo').css('display', 'none');
				$('.editinfo').css('height', '0px');
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

$('#cardinfo').on('click', ".updateinfo", function() {
//$(".updateinfo").click(function() {
	//alert("aaa");
	$('.savedinfo').css('visibility', 'hidden');
	$('.savedinfo').css('display', 'none');
	$('.savedinfo').css('height', '0px');
	$('.editform').css('visibility', 'visible');
	$('.editform').css('display', 'block');
	
	$('#information').css('onfocus', 'this.value=""');
	
});

</script>
<div id="cardinfo">
	<div class="savedinfo" style="display:none;visibility:visible">
		&nbsp;&nbsp;&nbsp;<span class="savedinfodata"></span><br/>
		<span>
			<a class="updateinfo" style="float:right;color:#8c8c8c;font-size: small;cursor:pointer">
			Edit the Discription</a>
		</span>
	</div>
</div>

<div id="cardinfo">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a class="editinfo" style="cursor: pointer;">
		<img src="/finalProject/resources/styles/images/icons/234.png"
		class="window-icon2" />&nbsp;
		Write the Discription
	</a>
</div>
	
<div class="editform">
	<form id="editcontent" action="writecardinfo.action" method="post" enctype="multipart/form-data">
		<input id="information" type="text" class="edit-cardinfo"/>
		<input type="hidden" id="boardno" value="${boardno }">
		<input type="hidden" id="cardno" value="${cardno }">
		<input type="hidden" id="listno" value="${listno }">
	</form><br/>
	<input type="button" value="save" id="infosubmit" class="window-sidebutton" style='float:right;text-align:center'/>
	<input type="button" value="cancel" id="cancel" class="window-sidebutton" style='float:right;text-align:center' />
</div>
