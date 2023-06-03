extends CharacterBody2D

@export var move_speed : float = 4



	
func _physics_process(delta):
	
	
	
	
	var has_action_been_pressed = Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right")
	
	if has_action_been_pressed:
		var x = Input.get_action_strength("right") - Input.get_action_strength("left")
		var y = Input.get_action_strength("down") - Input.get_action_strength("up")
		var input_direction = Vector2(x,y)
		
		print(input_direction)
	
		velocity  = input_direction * move_speed
		position = position + velocity
		print(position)
	







