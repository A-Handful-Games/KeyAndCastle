extends StaticBody2D
var key_rng = RandomNumberGenerator.new()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#hide()
	
func _physics_process(delta):
	pass


func _on_our_tile_grid_proportions(tile_scale, grid_size_in_tiles, tile_size):
	
	#first choses random x,y in tiles then converts that to position
	var offset = tile_size/2
	var rand_pos_x = key_rng.randi_range(0,grid_size_in_tiles[0]) 
	var rand_pos_y =  key_rng.randi_range(0,grid_size_in_tiles[1]) 
	scale = tile_scale
	position = Vector2(rand_pos_x,rand_pos_y)*Vector2(tile_size) + Vector2(offset)
	pass # Replace with function body.
