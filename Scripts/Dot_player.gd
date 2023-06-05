extends CharacterBody2D

@export var move_speed : float = 16


func _input(event):
	if event is InputEventKey:
		
		var input_direction = Vector2(0,0)
		
		var x = char(event.unicode)
		match x:
			"w":
				input_direction = Vector2(0,-1)
			"a":
				input_direction = Vector2(-1,0)
			"s":
				input_direction = Vector2(0,1)
			"d":
				input_direction = Vector2(1,0)
				
		velocity = input_direction * move_speed
		position = position + velocity
				
		if input_direction != Vector2(0,0):
			print(input_direction)
			print(position)

