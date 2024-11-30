class_name State_attack extends State
@onready var walk :State=$"../walk"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var  idle : State=$"../idle"
var attacking:bool =false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Enter() -> void :
	player.UpdateAnimation("attack")
	animation_player.animation_finished.connect(EndAttack)
	attacking = true
	pass
func Exit() -> void :
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass
func process(_delta: float) -> State:
	
	player.velocity = Vector2.ZERO
	if attacking == false :
		if player.direction ==Vector2.ZERO:
			return idle
		else:
			return walk
	return null

func Physics(_delta: float) -> State:
	return null
func HandleInput(_event: InputEvent) -> State:
	return null
func EndAttack(_newAnimName : String) -> void:
	attacking = false
