extends Resource

class_name C_GridData

const COMPONENT_TYPE = "C_GridData"

@export var c_raw_postion: C_RawPosition
@export var c_grid_size: C_GridSize
@export var c_tile_set: C_Tileset

# Called when the node enters the scene tree for the first time.
func _ready():
	create_grid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func calc_grid_to_raw(c_grid_postition: C_GridPosition) -> Vector2:
	var calc_pos: Vector2 = (
		self.c_raw_postion.pos +
		(Vector2(c_grid_postition.pos) * self.c_tile_size.size) +
		self.c_tile_size.offset
	)
	return calc_pos
