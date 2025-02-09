class_name PlayerStateMachine extends Node

var states: Array[State]
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
	states =[]
	for c in get_children():
		if c is State:
			states.append(c)
	if states.size() == 0:
		return
	states[0].Player =_player
	states[0].state_machine = self
	for state in states:
		state.init()
	Changestate(states[0])
	process_mode = Node.PROCESS_MODE_INHERIT


func Changestate(new_state : State)->void:
	if new_state == null || new_state == curre_state:
		return
		
	if curre_state:
		curre_state.Exit()

	prev_state=curre_state
	curre_state = new_state
	curre_state.Enter()
