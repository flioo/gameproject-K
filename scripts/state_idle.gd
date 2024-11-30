class_name State_idle extends State
@onready var walk :State=$"../walk"
@onready var attack : State = $"../attack"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func Enter() -> void :
	player.UpdateAnimation("idle")
	pass
func Exit() -> void :
	
	pass
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

func Physics(_delta: float) -> State:
	return null
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
