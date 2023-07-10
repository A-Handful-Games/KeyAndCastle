extends Component
class_name C_UpdateState

const COMPONENT_TYPE = "C_UpdateState"

@export var name: String
@export var state: bool

func _init(init_name := "", init_state := false):
	name = name if name != null else init_name
	state = state if state != null else init_state

func _get_state():
	return state
