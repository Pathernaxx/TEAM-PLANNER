<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="charset=utf-8">

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