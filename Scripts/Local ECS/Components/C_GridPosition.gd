extends Component
class_name C_GridPosition

const COMPONENT_TYPE = "C_GridPosition"

@export var _position_data: Vector2i = Vector2i.ZERO


func _init(starting_position: Vector2i = Vector2i.ZERO):
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
			if typeof(new_value) != TYPE_VECTOR2I:
				return false
			
			_position_data = new_value
			return true
	
	return false
	
