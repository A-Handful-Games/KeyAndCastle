extends TileMap

signal proportions(tile_scale)
#this is the size of each tile
@export var our_tile_size = Vector2i(16,16)

#how many tiles the grid should be
@export var our_grid_size = Vector2i(12,12)

# Called when the node enters the scene tree for the first time.
func _ready():
	create_grid()
	


#creates grid that that scalse with tile size and grid size
func create_grid():
	var grid = self
	var base_tile_size = Vector2i(16,16)
	var base_grid_size = Vector2i(12,12)
	
	
	grid.our_grid_size = our_grid_size
	
	#needs to be float and vector2(not 2i) otherwise will round
	grid.scale = Vector2(float(our_tile_size[0])/float(base_tile_size[0]),float(our_tile_size[1])/float(base_tile_size[1]))
	print(our_tile_size," Size")
	#print(grid.our_grid_size)
	print(grid.scale, " Scale")

	
	var our_grid_size_x = our_grid_size[0]
	var our_grid_size_y = our_grid_size[1]
	
	#places cells by column
	for x in range(our_grid_size_x):
		for y in range(our_grid_size_y):
			#print("x: " + str(x)," y: " + str(y))
			set_cell(0, Vector2i(x-our_grid_size_x/2,y-our_grid_size_y/2), 0, Vector2i(0,0), 0)
			
	#clears a cell at 0,0 to help keep track
	set_cell(0, Vector2i(0,0), -1, Vector2i(0,0), 0)
	
	proportions.emit(grid.scale)
	
func _process(delta):
	pass
	
