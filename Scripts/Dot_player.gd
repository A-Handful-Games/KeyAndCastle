extends CharacterBody2D

@export var move_speed  = Vector2(16,16)

var this_grid_size = Vector2()
var this_tile_size = Vector2()
var grid_position = Vector2()
var starting_pos = Vector2()


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
				
		velocity = input_direction * move_speed
		var temp_position = position + velocity

		
		#grid size * tile size to get grid limits subtract tile size to put player at center of tile
		var border = this_grid_size/2*this_tile_size - this_tile_size/2
		
		#limits player movement to the grid
		#for some reason you have to clamp x and y seperately otherwise it just limits x axis
		position.x = clamp(temp_position.x,-border.x,border.x)
		position.y = clamp(temp_position.y,-border.y,border.y)
				
		if input_direction != Vector2(0,0):
			print(input_direction,position)

func _ready():
	grid_position = Vector2(0,0)
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
		
		
		grid_position = grid_position + input_direction
		print(grid_position)
		
		grid_position = grid_position.clamp(Vector2.ZERO,this_grid_size - Vector2.ONE)
		
		print(grid_position,this_grid_size,starting_pos)
		
		position = grid_position * this_tile_size + this_tile_size/2 
		



func _on_our_tile_grid_proportions(tile_scale, grid_size, tile_size):
	position = tile_size/2
	starting_pos = position
	apply_scale(tile_scale)
	
	move_speed = Vector2(tile_size)
	this_grid_size = Vector2(grid_size)
	this_tile_size = Vector2(tile_size)

