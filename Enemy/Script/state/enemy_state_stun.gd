class_name  EnemyStateStun extends EnemyState

@export var anim_name : String = "Stun"
@export var knockback_speed : float = 300.0
@export var decelerate_speed : float = 10.0
@export_category("AI")


@export var next_state :EnemyState
 

var _direction : Vector2 
var _animation_finished:bool = false
func _init() -> void:
	#Enemy.enemy_damaged.connect(_on_enemy_damaged)
	pass


func enter() -> void:
	
	_animation_finished = false
	#_direction = Enemy.DIR_4[rand]
	Enemy.SetDirection(_direction)
	Enemy.velocity = _direction * -knockback_speed

	Enemy.Update_Animation(anim_name)
	Enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass
	

func exit() -> void:
	pass
func process(_delta: float) -> EnemyState:
	if _animation_finished == true:
		return  next_state
	Enemy.velocity-=Enemy.velocity * decelerate_speed * _delta
	return null
	
func physics(_delta: float) -> EnemyState:
	return null

func _on_enemy_damaged() -> void :
	StateMachine.Changestate(self)

func _on_animation_finished(_a : String) -> void:
	_animation_finished = true
