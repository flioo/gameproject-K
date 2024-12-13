class_name State_Walk extends State

@export var move_speed : float = 200.0
@onready var idle : State = $"../idle"
@onready var attack : State =$"../attack"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Enter() -> void :
	Player.UpdateAnimation("walk")
	pass
func Exit() -> void :
	
	pass
func process(_delta: float) -> State:
	if Player.direction == Vector2.ZERO:
		return idle
	Player.velocity = Player.direction * move_speed
	if Player.SetDirection():
		Player.UpdateAnimation("walk")
	return null

func Physics(_delta: float) -> State:
	return null
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
