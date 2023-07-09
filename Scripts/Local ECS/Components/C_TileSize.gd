extends Component
class_name C_TileSize  # Replace this with your actual class name

const COMPONENT_TYPE = "C_TileSize"  # Same as class name

@export var size: Vector2 = Vector2i(16,16) as Vector2


func _init(tile_size: Vector2i = Vector2i.ZERO):
	size = tile_size as Vector2


func _get(property):
	match property:
		"x", "size.x":
			return size.x as int
		"y", "size.y":
			return size.y as int
		"size":
			return size as Vector2i
		"offset":
			return size/2


func _set(property, new_value):
	match property:
		"x", "size.x":
			if typeof(new_value) != TYPE_INT:
				return false
			
			size.x = new_value
			return true

		"y", "size.y":
			if typeof(new_value) != TYPE_INT:
				return false
			
			size.y = new_value
			return true
			
		"size":
			if typeof(new_value) != TYPE_VECTOR2I:
				return false
			
			size = new_value
	
	return false
	

