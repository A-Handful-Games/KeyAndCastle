extends Component
class_name C_RawPosition

const COMPONENT_TYPE = "C_RawPosition"

@export var _position_data: Vector2 = Vector2.ZERO


func _init(starting_position: Vector2 = Vector2.ZERO):
	resource_name = "Component: Raw Position"
	_position_data = starting_position


func _get(property):
	match property:
		"x","pos.x":
			return _position_data.x
		"y", "pos.y":
			return _position_data.y
		"pos":
			return _position_data


func _set(property, new_value):
	match property:
		"x","pos.x":
			if typeof(new_value) != TYPE_INT:
				return false
			
			_position_data.x = new_value
			return true

		"y", "pos.y":
			if typeof(new_value) != TYPE_INT:
				return false
			
			_position_data.y = new_value
			return true
			
		"pos":
			if typeof(new_value) != TYPE_VECTOR2:
				return false
			
			_position_data = new_value
			return true
	
	return false
	
