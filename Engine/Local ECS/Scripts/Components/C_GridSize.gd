extends Component
class_name C_GridSize

const COMPONENT_TYPE = "C_GridSize"

@export var size: Vector2i = Vector2i(16,16)


func _init(grid_size: Vector2i = size):
	size = grid_size


func _get(property):
	if property == "x":
		return size.x

	if property == "y":
		return size.y


func _set(property, new_value):
	if property == "x":
		size.x = new_value
		return true

	if property == "y":
		size.y = new_value
		return true
		
	return false
	
