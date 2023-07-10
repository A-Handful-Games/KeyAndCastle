extends System
class_name S_KeyTouch

const NECCESSARY_COMPONENTS: Array[String] = [
	# YOUR_COMPOENENT.COMPONENT_TYPE,
]

const BANNED_COMPONENTS: Array[String] = [
	# YOUR_COMPOENENT.COMPONENT_TYPE,
]

### Systems Logic
### https://github.com/Germenzi/gdECSv4/blob/main/README.md
###

# here system logic
func on_entity_process(entity: Entity, delta: float):
	pass


# returns an array of necessary components
func get_necessary_components():
	return NECCESSARY_COMPONENTS

# returns an array of banned components
func get_banned_components():
	return BANNED_COMPONENTS

# returns a dictionary of the components from an entity
func get_entity_components(entity: Entity, components: Array[String]) -> Dictionary:
	var c_dict: Dictionary;
	
	for c_string in components:
		c_dict[c_string] = entity.get_component(c_string)
	
	return c_dict


