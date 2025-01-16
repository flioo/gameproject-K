class_name  EnemyStateDestroy extends EnemyState

@export var anim_name : String = "destroy"
@export var knockback_speed : float = 300.0
@export var decelerate_speed : float = 10.0
@export_category("AI")
@export_category("Item Drops")
@export var drops : Array[Dropdata]
 
var _damage_position :Vector2
var _direction : Vector2 

func init() -> void:
	Enemy.enemy_destroyed.connect(_on_enemy_destroyed)
	pass



func enter() -> void:
	Enemy.invulnerable = true

	_direction = Enemy.global_position.direction_to(_damage_position)
	Enemy.SetDirection(_direction)
	Enemy.velocity = _direction * -knockback_speed

	Enemy.Update_Animation(anim_name)
	Enemy.animation_player.animation_finished.connect(_on_animation_finished)
	disable_hurtbox()
	pass
	

func exit() -> void:

	pass
func process(_delta: float) -> EnemyState:
	
	Enemy.velocity -=Enemy.velocity * decelerate_speed * _delta
	return null
	
func physics(_delta: float) -> EnemyState:
	return null

func _on_enemy_destroyed(Hurt_box : HurtBox) -> void :
	_damage_position = Hurt_box.global_position
	StateMachine.Changestate(self)

func _on_animation_finished(_a : String) -> void:
	Enemy.queue_free()
	
func disable_hurtbox() -> void:
	var hurt_box :HurtBox = Enemy.get_node_or_null("Hurtbox")
	if hurt_box:
		hurt_box.monitoring = false

func drop_items() ->void:
	if drops.size() ==0 :
		return
	
	for i in drops.size():
		if drops[i] ==null or drops[i].item == null:
			continue
		var drop_count :int = drops[i].get_drop_count()
		for j in drop_count:
			var drop
			drop.item_data = drops[i].item
			Enemy.get_parent().call_deferred("add_child",drop)
			drop.global_position = Enemy.global_position +Vector2(randf() * 16,randf() * 16 )
	pass
