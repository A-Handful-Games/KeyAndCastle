extends CharacterBody2D

@export var move_speed  = Vector2(16,16)

var this_grid_size_in_tiles = Vector2()
var this_tile_size = Vector2()
var this_grid_position = Vector2()
var this_starting_pos = Vector2()
var this_tile_center_offset = Vector2()

func _ready():
	this_grid_position = Vector2(0,0)
	pass


func _input(event):
	
	
	if event is InputEventKey:

		var input_direction = Vector2(0,0)
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
		
		this_grid_position = this_grid_position.clamp(Vector2.ZERO,this_grid_size_in_tiles - Vector2.ONE)
		
		print_debug(this_grid_position)
		
		position = this_grid_position * this_tile_size + this_tile_size/2 
		



func _on_our_tile_grid_proportions(grid_shape,tile_size,grid_size_in_tiles,grid_size_in_units,scale_of_grid,tile_center_offset,center_of_grid):
	
	#set starting position to center of tile
	position = Vector2(position) + Vector2(tile_center_offset)
	
	#scale character to size of grid
	apply_scale(scale_of_grid)
	
	move_speed = Vector2(tile_size)
	this_grid_size_in_tiles = Vector2(grid_size_in_tiles)
	this_tile_size = Vector2(tile_size)
	this_tile_center_offset = Vector2(tile_center_offset)

