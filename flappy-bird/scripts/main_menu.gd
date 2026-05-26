extends Control



func _ready():
	pass
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_activities_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/activities_menu.tscn")


func _on_leave_pressed() -> void:
	get_tree().quit()
