@tool
class_name item_pickup extends Node2D
@export var item_data : ItemData :set =_set_item_data


@onready var audio_stream_player2d : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var area_2d : Area2D=$Area2D
@onready var sprite_2d : Sprite2D =$Sprite2D

func _ready() -> void:
	_update_texture()
	if Engine.is_editor_hint():
		return
	area_2d.body_entered.connect(_on_body_entered)
	
func _on_body_entered(b) -> void :
	if b is player:
		if item_data:
			 item_picked_up()
	pass

func item_picked_up() -> void :
	pass


func _set_item_data(value : ItemData) -> void:
	item_data = value
	pass


func _update_texture()-> void:
	pass
