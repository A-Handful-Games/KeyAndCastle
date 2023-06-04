extends CharacterBody2D

@export var move_speed : float = 16



	
func _physics_process(delta):
	
	#var test = Input.get_vector("left","right","up","down")
	var input_direction = Vector2(0,0)
	if Input.is_action_just_pressed("up"):
		input_direction = Vector2(0,-1)
	if Input.is_action_just_pressed("down"):
		input_direction = Vector2(0,1)
	if Input.is_action_just_pressed("right"):
		input_direction = Vector2(1,0)
	if Input.is_action_just_pressed("left"):
		input_direction = Vector2(-1,0)

	velocity = input_direction * move_speed
	position = position + velocity
	
	if input_direction != Vector2(0,0):
		print(input_direction)
		print(position)
	





