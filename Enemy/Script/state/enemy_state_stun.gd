class_name  EnemyStateStun extends EnemyState

@export var anim_name : String = "Stun"
@export var knockback_speed : float = 300.0
@export var decelerate_speed : float = 10.0
@export_category("AI")


@export var next_state :EnemyState
 
var _damage_position : Vector2
var _direction : Vector2 
var _animation_finished:bool = false
func init() -> void:
	Enemy.enemy_damaged.connect(_on_enemy_damaged)
	pass



func enter() -> void:
	Enemy.invulnerable = true
	_animation_finished = false
	_direction = Enemy.global_position.direction_to(_damage_position)
	Enemy.SetDirection(_direction)
	Enemy.velocity = _direction * -knockback_speed

	Enemy.Update_Animation(anim_name)
	Enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass
	

func exit() -> void:
	Enemy.animation_player.animation_finished.disconnect(_on_animation_finished)
	Enemy.invulnerable = false
	pass
func process(_delta: float) -> EnemyState:
	if _animation_finished == true:
		return  next_state
	Enemy.velocity -=Enemy.velocity * decelerate_speed * _delta
	return null
	
func physics(_delta: float) -> EnemyState:
	return null

func _on_enemy_damaged(Hurt_box : HurtBox) -> void :
	_damage_position =Hurt_box.global_position
	StateMachine.Changestate(self)

func _on_animation_finished(_a : String) -> void:
	_animation_finished = true
