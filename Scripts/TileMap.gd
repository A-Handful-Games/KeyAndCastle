extends TileMap

signal proportions(grid_shape,tile_size,grid_size_in_tiles,grid_size_in_units,scale_of_grid,tile_center_offset,center_of_grid)
#this is the size of each tile
@export var our_tile_size = Vector2i(16,16)

#how many tiles the grid should be
@export var our_grid_size = Vector2i(12,12)

#the shape of the grid
#grid_shape will return selected index
@export_enum("square","cricle") var grid_shape

# Called when the node enters the scene tree for the first time.
func _ready():
	create_grid()
	
	
func _process(delta):
	pass
	
	
#creates grid that that scales with tile size and grid size
func create_grid():
	
	#default grid settings
	var base_tile_size = Vector2i(16,16)
	var base_grid_size = Vector2i(12,12)
	
	
	
	var grid_size_in_units = our_tile_size * our_grid_size
	var tile_center_offset = our_tile_size/2
	var center_of_grid = grid_size_in_units/2
	
	#needs to be float and vector2(not 2i) otherwise will round
	scale = Vector2(our_tile_size)/Vector2(base_tile_size)
	
	
	
	#This can probaly be done more simple but grid_shape returns index not string
	var selected_grid_shape : String
	match grid_shape:
		0:
			create_square_grid()
			selected_grid_shape = "square"
		1:
			create_circle_grid()
			selected_grid_shape = "circle"
	
	#emit the proportions signal with the scale of the grid
	proportions.emit(selected_grid_shape,our_tile_size,our_grid_size,grid_size_in_units,scale,tile_center_offset,center_of_grid)
	
func create_square_grid():
	#places cells by column
	for x in range(our_grid_size[0]):
		for y in range(our_grid_size[1]):
			#print("x: " + str(x)," y: " + str(y))
			set_cell(0, Vector2i(x,y), 0, Vector2i(0,0), 0)
	pass
	
func create_circle_grid():
	pass
