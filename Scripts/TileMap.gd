extends TileMap

signal proportions(grid_data)


#this is the size of each tile
@export var our_tile_size = Vector2(16,16)

#how many tiles the grid should be
@export var our_grid_size = Vector2(12,12)

#the shape of the grid
#grid_shape will return selected index
@export_enum("square","cricle") var grid_shape : int

# Called when the node enters the scene tree for the first time.
func _ready():
	create_grid()
	
	
func _process(delta):
	pass
	
	
#creates grid that that scales with tile size and grid size
func create_grid():
	var grid_data : Dictionary
	var selected_grid_shape : String
	var base_tile_size : Vector2
	var base_grid_size : Vector2
	var grid_size_in_units : Vector2
	var tile_center_offset : Vector2
	var center_of_grid : Vector2
	
	#default grid settings
	base_tile_size = Vector2(16,16)
	base_grid_size = Vector2(12,12)
	
	
	
	grid_size_in_units = our_tile_size * our_grid_size
	tile_center_offset = our_tile_size/2
	center_of_grid = grid_size_in_units/2
	
	#needs to be float and vector2(not 2i) otherwise will round
	scale = our_tile_size/base_tile_size
	
	
	
	#This can probaly be done more simple but grid_shape returns index not string
	
	match grid_shape:
		0:
			create_square_grid()
			selected_grid_shape = "square"
		1:
			create_circle_grid()
			selected_grid_shape = "circle"
	
	
	grid_data = {
		"selected_grid_shape":selected_grid_shape,
		"tile_size":our_tile_size,
		"grid_size_in_tiles":our_grid_size - Vector2.ONE,#subtect 1 because index starts at 0
		"grid_size_in_units":grid_size_in_units,
		"scale_of_grid":scale, #key should be scale_of_grid and not just scale to prevent naming conflicts
		"tile_center_offset":tile_center_offset,
		"center_of_grid":center_of_grid
		}
		
	#emit the proportions signal with data about the grids proportions
	proportions.emit(grid_data)
	
func create_square_grid():
	#places cells by column
	for x in range(our_grid_size[0]):
		for y in range(our_grid_size[1]):
			#print("x: " + str(x)," y: " + str(y))
			#placing cells should be Vector2i not Vector2
			set_cell(0, Vector2i(x,y), 0, Vector2i(0,0), 0)
	pass
	
func create_circle_grid():
	pass
