extends CharacterBody2D

signal player_moved(player_data)

@export var move_speed  = Vector2(16,16)


var this_grid_size_in_tiles : Vector2
var this_tile_size : Vector2
var this_grid_position : Vector2
var this_starting_pos : Vector2
var this_tile_center_offset : Vector2
var player_data : Dictionary
var id : RID

func _ready():
	this_grid_position = Vector2(0,0)
	id = get_rid()
	position = this_grid_position * this_tile_size + this_tile_size/2 
	pass


func _input(event):
	var input_direction : Vector2
	
	if event is InputEventKey:

		input_direction = Vector2(0,0)
		if event.pressed:
			if InputMap.event_is_action(event, "up"):
				input_direction = Vector2(0,-1)
			elif InputMap.event_is_action(event, "left"):
				input_direction = Vector2(-1,0)
			elif InputMap.event_is_action(event, "down"):
				input_direction = Vector2(0,1)
			elif InputMap.event_is_action(event, "right"):
				input_direction = Vector2(1,0)
		
		
		this_grid_position = this_grid_position + input_direction
		
		print_debug(this_grid_position)
		
		position = this_grid_position * this_tile_size + this_tile_size/2 
		
		player_data = {
			"player_position_in_units":position,
			"player_position_in_tiles":this_grid_position,
			"player_id":id
		}
		player_moved.emit(player_data)

func _on_our_tile_grid_proportions(grid_data):
	
	#set starting position to center of tile
	position = position + grid_data.tile_center_offset
	
	#scale character to size of grid
	apply_scale(grid_data.scale_of_grid)
	
	move_speed = grid_data.tile_size
	this_grid_size_in_tiles = grid_data.grid_size_in_tiles
	this_tile_size = grid_data.tile_size
	this_tile_center_offset = grid_data.tile_center_offset


