class_name HitBox extends Area2D
signal damaged(urt_box : HurtBox)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func takedamage(Hurt_box : HurtBox) -> void :

	damaged.emit(Hurt_box)
