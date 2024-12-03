class_name playerinteractionhost extends Node2D
@onready var player : player =$".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.DirectionChanged.connect(UpdateDirection)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func UpdateDirection(new_direction: Vector2) -> void :
	match new_direction:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.LEFT:
			rotation_degrees= 90
		Vector2.RIGHT:
			rotation_degrees = -90
		_:
			rotation_degrees = 0
	pass
