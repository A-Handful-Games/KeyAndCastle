extends System

const NECCESSARY_COMPONENTS: Array[String] = [
	C_GridPosition.COMPONENT_TYPE,
	C_RawPosition.COMPONENT_TYPE,
	EC_Grid.COMPONENT_TYPE,
	C_SynchroRawPos.COMPONENT_TYPE,
]

const OPTIONAL_COMPOENTS: Array[String] = [
	C_UpdateState.COMPONENT_TYPE,
]

const MOVE_UPDATE_STRING = "PLAYER_MOVE"

### Systems Logic
### https://github.com/Germenzi/gdECSv4/blob/main/README.md
###

# here system logic
func on_entity_process(entity: Entity, delta):
	var c_opt_dict: Dictionary = get_entity_components(
		entity, OPTIONAL_COMPOENTS
	)
	
	var c_move_update_state: C_UpdateState = c_opt_dict[
		C_UpdateState.COMPONENT_TYPE
	]
	
	if c_move_update_state.name == MOVE_UPDATE_STRING:
		if c_move_update_state.state == false:
			return
	
	
	
	var c_dict: Dictionary = get_entity_components(
		entity, NECCESSARY_COMPONENTS
	)
	
	
	var c_raw_position: C_RawPosition = c_dict[C_RawPosition.COMPONENT_TYPE]
	var c_synchro_player: E_Player = c_dict[C_SynchroRawPos.COMPONENT_TYPE]
	var c_grid_position: C_GridPosition = c_dict[C_GridPosition.COMPONENT_TYPE]
	
	var grid_tilemap: EC_Grid = c_dict[EC_Grid.COMPONENT_TYPE]
	print_debug(grid_tilemap)
	var future_pos = grid_tilemap.calc_grid_to_raw(c_grid_position)
	if future_pos == (c_grid_position.pos as Vector2):
		return
	
	c_raw_position.pos = future_pos
	
	c_synchro_player.position = c_raw_position.pos
	print_debug(c_synchro_player.position)


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
	


