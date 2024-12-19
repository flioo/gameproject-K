class_name heartgui extends Control


@onready var sprite2d:Sprite2D = $Sprite2D

var value:int = 2:
	set(_value):
		value=_value
		Updatesprite()
func Updatesprite() -> void:
	sprite2d.frame = value
