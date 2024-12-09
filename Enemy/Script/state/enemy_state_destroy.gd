class_name  EnemyStateDestroy extends EnemyState

@export var anim_name : String = "destroy"
@export var knockback_speed : float = 300.0
@export var decelerate_speed : float = 10.0
@export_category("AI")


 

var _direction : Vector2 

func init() -> void:
	Enemy.enemy_destroyed.connect(_on_enemy_destroyed)
	pass



func enter() -> void:
	Enemy.invulnerable = true

	_direction = Enemy.global_position.direction_to(Enemy.Player.global_position)
	Enemy.SetDirection(_direction)
	Enemy.velocity = _direction * -knockback_speed

	Enemy.Update_Animation(anim_name)
	Enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass
	

func exit() -> void:

	pass
func process(_delta: float) -> EnemyState:
	
	Enemy.velocity -=Enemy.velocity * decelerate_speed * _delta
	return null
	
func physics(_delta: float) -> EnemyState:
	return null

func _on_enemy_destroyed() -> void :
	StateMachine.Changestate(self)

func _on_animation_finished(_a : String) -> void:
	Enemy.queue_free()
