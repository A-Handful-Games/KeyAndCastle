extends TileMap

@export var grid_size = 96

#this is the size of the visible tile
@export var tile_size = 8
#pixilart-drawing.png



# Called when the node enters the scene tree for the first time.
func _ready():
	var square_size = grid_size/tile_size
	print(square_size)
	for i in range(square_size):
		for x in square_size:
			print("i: " + str(i)," x: " + str(x))
			set_cell(0, Vector2i(i-square_size/2,x-square_size/2), 0, Vector2i(0,0), 0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
