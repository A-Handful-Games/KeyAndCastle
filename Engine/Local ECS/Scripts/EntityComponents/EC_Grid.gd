extends TileMap

class_name EC_Grid

const COMPONENT_TYPE = "EC_Grid"

@export var c_grid_size: C_GridSize
@export var c_update_state: C_UpdateState

var _entity: Entity
var c_tile_set: C_Tileset = self.tile_set

# Called when the node enters the scene tree for the first time.
func _ready():
	## Create an trackable entity with the desired components
	## and bind it as a node
	
	var e: Entity = Entity.new([
			c_grid_size,
			c_tile_set,
			c_update_state,
		],
		#autoregister=true
	)
	
	e.bind_node(self)
	_entity = e
	
	create_grid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func create_grid(grid_vec: Vector2i = c_grid_size.size):
	for x in range(grid_vec.x):
		for y in range(grid_vec.y):
			set_cell(0, Vector2i(x,y), 0, Vector2i(0,0), 0)
