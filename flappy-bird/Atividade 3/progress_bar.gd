extends Control


func _on_timer_timeout() -> void:
	var texture_progress_bar: TextureProgressBar = $TextureProgressBar
	texture_progress_bar.value += 1
	pass # Replace with function body.


func _on_texture_progress_bar_value_changed(value: float) -> void:
	var label: Label = $Label
	var texture_progress_bar: TextureProgressBar = $TextureProgressBar
	if texture_progress_bar.value == texture_progress_bar.max_value:
		texture_progress_bar.value = 0
		label.text = str(int(label.text) + 1)
		texture_progress_bar.max_value *= 1.1
	pass # Replace with function body.
