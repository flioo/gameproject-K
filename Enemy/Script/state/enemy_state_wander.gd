class_name  EnemyStateWander extends EnemyState

@export var anim_name : String = "walk"
@export var walk_speed : float = 30.0
@export_category("AI")
@export var state_animation_duration : float = 0.5
@export var state_cycles_min : int = 1
@export var state_cycles_max : int = 5

@export var next_state :EnemyState
 

var _timer:float = 0.0
var _direction : Vector2 
func _init() -> void:
	pass


func enter() -> void:
	_timer = randi_range(state_cycles_min,state_cycles_max) * state_animation_duration
	var rand = randi_range(0,3)
	_direction = Enemy.DIR_4[rand]
	Enemy.velocity = _direction * walk_speed
	Enemy.SetDirection(_direction)
	Enemy.Update_Animation(anim_name)
	pass
	

func exit() -> void:
	pass
func process(_delta: float) -> EnemyState:
	_timer -= _delta
	if  _timer <0 :
		return next_state
	return null
	
func physics(_delta: float) -> EnemyState:
	return null
