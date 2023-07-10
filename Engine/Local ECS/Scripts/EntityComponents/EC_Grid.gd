extends TileMap

class_name EC_Grid

const COMPONENT_TYPE = "EC_Grid"

@export var c_raw_postion: C_RawPosition
@export var c_grid_size: C_GridSize

var _entity: Entity

var c_tile_set: C_Tileset = self.tile_set

# Called when the node enters the scene tree for the first time.
func _ready():
	## Create an trackable entity with the desired components
	## and bind it as a node
	
	var e: Entity = Entity.new([
			c_raw_postion,
			c_grid_size,
			c_tile_set,
			C_UpdateState.new(),
		],
		#autoregister=true
	)
	
	e.bind_node(self)
	_entity = e
	
	create_grid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func calc_grid_to_raw(c_grid_postition: C_GridPosition) -> Vector2:
	var calc_pos: Vector2 = (
		self.c_raw_postion.pos +
		Vector2(c_grid_postition.pos * c_tile_set.tile_size) +
		c_tile_set.offset
	)
	return calc_pos


func create_grid(grid_vec: Vector2i = c_grid_size.size):
	for x in range(grid_vec.x):
		for y in range(grid_vec.y):
			# placing cells should be Vector2i not Vector2
			set_cell(0, Vector2i(x,y), 0, Vector2i(0,0), 0)
