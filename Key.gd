extends Area2D

signal key_got()


var key_rng = RandomNumberGenerator.new()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func _physics_process(delta):
	pass


func _on_our_tile_grid_proportions(grid_data):
	var offset : Vector2
	var rand_pos_x : int
	var rand_pos_y : int
	
	#first choses random x,y in tiles then converts that to position
	offset = grid_data.tile_size/2
	rand_pos_x = key_rng.randi_range(0, grid_data.grid_size_in_tiles[0]) 
	rand_pos_y =  key_rng.randi_range(0, grid_data.grid_size_in_tiles[1]) 
	scale = grid_data.scale_of_grid
	position = Vector2(rand_pos_x, rand_pos_y) * grid_data.tile_size + grid_data.tile_center_offset
	pass # Replace with function body.


func _on_dot_player_player_moved(player_data):
	if player_data.player_position_in_units == position:
		#TODO: the key still exists and can still be collected - BAD
		hide()
		key_got.emit()
	pass # Replace with function body.
