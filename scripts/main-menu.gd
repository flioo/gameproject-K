extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Scene/Main.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://GeneralNodes/uiux/option-menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
