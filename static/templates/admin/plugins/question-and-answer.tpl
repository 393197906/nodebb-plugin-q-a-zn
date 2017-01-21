<form role="form" class="question-and-answer-settings">
	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">常规设置</div>
		<div class="col-sm-10 col-xs-12">
			<div class="checkbox">
				<label>
					<input type="checkbox" name="forceQuestions">
					只允许询问所有类别的问题（禁用常规主题行为）
				</label>
				<p class="help-block">
					此选项取代以下选项
				</p>
			</div>
			<hr />
			<label>
				只允许针对以下类别提出问题（禁用常规主题行为）
			</label>
			<!-- BEGIN categories -->
			<div class="checkbox">
				<label>
					<input type="checkbox" name="defaultCid_{../cid}">
					{../name}
				</label>
			</div>
			<!-- END categories -->
		</div>
	</div>
</form>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">保存</i>
</button>

<script>
	require(['settings'], function(Settings) {
		Settings.load('question-and-answer', $('.question-and-answer-settings'));

		$('#save').on('click', function() {
			Settings.save('question-and-answer', $('.question-and-answer-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'question-and-answer-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				})
			});
		});
	});
</script>
