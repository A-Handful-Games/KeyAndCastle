extends TileSet
class_name C_Tileset  # Replace this with your actual class name

const COMPONENT_TYPE = "C_Tileset"  # Same as class name

var offset: Vector2:
	get:
		return self.tile_size/2
