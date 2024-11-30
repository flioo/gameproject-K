class_name PlayerStateMachine extends Node

var state : Array[State]
var prev_state:State
var curre_state:State
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Changestate(curre_state.process(delta))
	pass

func _physics_process(delta) -> void:
	Changestate(curre_state.Physics(delta))
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	Changestate(curre_state.HandleInput(event))

func initialize(_player :player) -> void:
	state =[]
	for c in get_children():
		if c is State:
			state.append(c)
	if state.size() >0:
		state[0].player =_player
		Changestate(state[0])
		process_mode = Node.PROCESS_MODE_INHERIT


func Changestate(new_state : State)->void:
	if new_state == null || new_state == curre_state:
		return
		
	if curre_state:
		curre_state.Exit()

	prev_state=curre_state
	curre_state = new_state
	curre_state.Enter()
