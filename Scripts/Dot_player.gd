extends CharacterBody2D

@export var move_speed  = Vector2(16,16)

func _ready():
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
				
		velocity = input_direction * move_speed
		position = position + velocity
				
		if input_direction != Vector2(0,0):
			print(input_direction)
			print(position)


func _on_our_tile_grid_proportions(tile_scale):
	
	#divide tile size by 2 to be put in center of tile
	print(self.position)

	self.position = Vector2(self.position[0]*tile_scale[0],self.position[1]*tile_scale[1])
	self.apply_scale(tile_scale)
	self.move_speed = move_speed * tile_scale

	pass # Replace with function body.
