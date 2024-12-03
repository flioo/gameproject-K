extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://main scene/Main.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scene'/mainmenu/option-menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
