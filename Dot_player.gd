extends CharacterBody2D

@export var move_speed : float = 16



	
func _physics_process(delta):
	
	var input_direction = Vector2(0,0)
	
	#only run the other if statements if something is pressed
	if Input.is_anything_pressed() == false:
		pass
	
	# -1 is up and +1 is down (opposite of what you think)
	# -1 is left and +1 is right
	elif Input.is_action_just_pressed("up"):
		input_direction = Vector2(0,-1)
	elif Input.is_action_just_pressed("down"):
		input_direction = Vector2(0,1)
	elif Input.is_action_just_pressed("right"):
		input_direction = Vector2(1,0)
	elif Input.is_action_just_pressed("left"):
		input_direction = Vector2(-1,0)

	velocity = input_direction * move_speed
	position = position + velocity
	
	if input_direction != Vector2(0,0):
		print(input_direction)
		print(position)
	





