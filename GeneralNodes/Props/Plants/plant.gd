class_name  plant extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Hitbox.damaged.connect(takedamage)
	pass # Replace with function body.


func takedamage(_damage:int) -> void :
	queue_free()
	pass
