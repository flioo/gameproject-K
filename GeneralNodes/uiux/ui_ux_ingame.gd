extends Control

func _on_backingame_pressed() -> void:
	get_tree().change_scene_to_file("res://main scene/main_menu.tscn")