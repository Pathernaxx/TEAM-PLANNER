<div id="pop-title">
	<form>
		<p id="name-error" class="error"></p>
		<label for="fullname">FullName</label>
		<input type="text" name="fullname" id="fullname" tabindex="1" value="${ member.fullName }">
		<label for="username">UserName</label>
		<input type="text" name="username" id="username" tabindex="2" value="${ member.userName }">
		<input class="primary js-save-chagne" id="save" type="submit" tabindex="3" value="Save">
	</form>
</div>