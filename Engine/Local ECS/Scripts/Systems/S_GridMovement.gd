extends System


const NECCESSARY_COMPONENTS: Array[String] = [
	C_GridPosition.COMPONENT_TYPE,
	EC_Grid.COMPONENT_TYPE,
]

const OPTIONAL_COMPOENTS: Array[String] = [
	C_UpdateState.COMPONENT_TYPE,
]

const MOVE_UPDATE_STRING = "PLAYER_MOVE"

var InputDirectionVector: Vector2i = Vector2i.ZERO
var _DEBUG_OLD_VECTOR: Vector2i = InputDirectionVector

var InputActionsVectors = {
	# Action Name: Vector2i
	"LEFT": Vector2i.LEFT,
	"RIGHT": Vector2i.RIGHT,
	"UP": Vector2i.UP,
	"DOWN": Vector2i.DOWN,
}

func _init():
	pass
# here system logic
func on_entity_process(entity: Entity, delta):

	var input_direction: Vector2i = Vector2i.ZERO
	
	var c_dict: Dictionary = get_entity_components(
		entity, NECCESSARY_COMPONENTS
	)
	
	var c_grid_size: C_GridSize = (
		c_dict[EC_Grid.COMPONENT_TYPE]._entity
	).get_component(
		C_GridSize.COMPONENT_TYPE
	)
	
	var c_opt_dict: Dictionary = get_entity_components(
		entity, OPTIONAL_COMPOENTS
	)
	
	var c_move_update_state: C_UpdateState = c_opt_dict[
		C_UpdateState.COMPONENT_TYPE
	]
	
	
	if InputDirectionVector != Vector2i.ZERO:
		c_dict[C_GridPosition.COMPONENT_TYPE].pos = ((
				c_dict[C_GridPosition.COMPONENT_TYPE].pos + InputDirectionVector
			) as Vector2i).clamp(
				Vector2i.ZERO, c_grid_size.size
			)
		_DEBUG_OLD_VECTOR = InputDirectionVector
		InputDirectionVector = Vector2i.ZERO
	
		if c_move_update_state.name == MOVE_UPDATE_STRING:
			c_move_update_state.state = true
			
			
# returns an array of necessary components
func get_necessary_components():
	return NECCESSARY_COMPONENTS

# returns an array of banned components
# func get_banned_components():

# returns a dictionary of the components from an entity
func get_entity_components(entity: Entity, components: Array[String]) -> Dictionary:
	var c_dict: Dictionary;
	
	for c_string in components:
		c_dict[c_string] = entity.get_component(c_string)
	
	return c_dict

### Input Events
### (See DEV_DOC for more)

# Raw keyboard input; ideal for key events. 
# Only received if event is InputEventKey.
#
func _unhandled_key_input(event: InputEvent) -> void:
	if !event.pressed or event.is_echo():
		return
	#print_debug((event as InputEventKey).as_text_key_label())
	
	for action in InputActionsVectors:
		if !(event as InputEventKey).is_action(action):
			continue
			
		InputDirectionVector += InputActionsVectors[action]
		
	#print_debug(InputDirectionVector)

"""
func _direction_to_dir_vec(
	inputs: Dictionary = InputActionsVectors,
) -> Vector2i:
	var dir_vec := Vector2i.ZERO
	for dir_name in inputs.keys():
		var just_pressed = Input.is_action_just_pressed(dir_name)
		
		if !just_pressed:
			continue
			
		dir_vec += inputs[dir_name]
		
		''' Alternate (enum or dict): Execute
		# This only works if we have right action names.
		
		dir_vec += (Expression.new().execute("Vector2i.%s" % dir_name) as Vector2i)
		'''
		
		''' Alterate (enum): Calculate it.
		var direction := (inputs[dir_name]) as int
		var axis := (direction > 1) as int
		var sign: int = 2 * (direction % 2) - 1
		dir_vec[axis] = sign
		'''
		
	return dir_vec
"""
'''
func _event_to_dir_vec(event, inputs := InputDirections):
	var dir_vec := Vector2i.ZERO
	(event as InputEventKey).is_action
	
	var direction := (inputs[dir_name]) as int
	var axis := (direction > 1) as int
	var sign: int = 2 * (direction % 2) - 1
	
	dir_vec[axis] = sign
	
	return dir_vec
	
'''
'''
func _action_press_vec(
	event: InputEventKey,
	negative_x: StringName,
	positive_x: StringName,
	negative_y: StringName,
	positive_y: StringName,
	allow_echo:  bool = false,
	exact_match: bool = false
) -> Vector2i:
	return Vector2(
		Vector2i(
			(
				int(event.is_action_pressed(positive_x, allow_echo, exact_match)) 
			  - int(event.is_action_pressed(negative_x, allow_echo, exact_match))
			),
			(
				int(event.is_action_pressed(positive_y, allow_echo, exact_match))
			  - int(event.is_action_pressed(negative_y, allow_echo, exact_match))
			)
		)
	)
'''	


