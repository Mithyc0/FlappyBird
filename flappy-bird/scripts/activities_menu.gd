extends Control

func _on_atividade_3e_4_pressed() -> void:
	pass # Replace with function body.

func _on_atividade_8_pressed() -> void:
	get_tree().change_scene_to_file("res://Atividade8/calculadora.tscn")

func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_atividade_9_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
