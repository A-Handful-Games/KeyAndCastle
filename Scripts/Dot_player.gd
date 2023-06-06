extends CharacterBody2D

@export var move_speed : float = 16


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

