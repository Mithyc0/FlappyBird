extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("you failed")
	var player = get_node("../Player")
	player.queue_free()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.
