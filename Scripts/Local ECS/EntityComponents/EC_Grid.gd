extends TileMap

class_name EC_Grid

const COMPONENT_TYPE = "EC_Grid"

@export var init_pos := Vector2.ZERO
@export var grid_size := Vector2i(16,16)
@export var tile_size := Vector2i(12,12)

var _entity: Entity
var c_raw_postion: C_RawPosition
var c_grid_size: C_GridSize
var c_tile_size: C_TileSize

func _init():
	## Create an trackable entity with the desired components
	## and bind it as a node
	
	c_raw_postion = C_RawPosition.new(init_pos)
	c_grid_size = C_GridSize.new(grid_size)
	c_tile_size = C_TileSize.new(tile_size)
	
	var e: Entity = Entity.new([
			c_raw_postion,
			c_grid_size,
			c_tile_size,
			C_UpdateState.new(),
		],
		#autoregister=true
	)
	
	e.bind_node(self)
	_entity = e



# Called when the node enters the scene tree for the first time.
func _ready():
	# Workaround: tile-size doesnt update with editor
	_entity.get_component(C_TileSize.COMPONENT_TYPE).size = tile_size
	print_debug(self.c_tile_size.size)
	print_debug(self)
	create_grid()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func calc_grid_to_raw(c_grid_postition: C_GridPosition) -> Vector2:
	
	print_debug([self.c_tile_size.size, self.c_tile_size.offset])
	var calc_pos: Vector2 = (
		self.c_raw_postion.pos +
		(Vector2(c_grid_postition.pos) * self.c_tile_size.size) +
		self.c_tile_size.offset
	)
	return calc_pos


func create_grid(grid_vec: Vector2i = grid_size):
	for x in range(grid_vec.x):
		for y in range(grid_vec.y):
			# placing cells should be Vector2i not Vector2
			set_cell(0, Vector2i(x,y), 0, Vector2i(0,0), 0)
