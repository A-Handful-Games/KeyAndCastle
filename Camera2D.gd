extends Camera2D
var Grid_center : Vector2
var Screen_size : Vector2
var ratio : Vector2
@export var Take_up_full_screen : bool = false



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_our_tile_grid_proportions(tile_scale, grid_size, tile_size):
	
	
	Grid_center = (grid_size*tile_size)/2
	Screen_size = get_viewport_rect().size #(1920, 1009) full screen
	ratio = Screen_size/(Grid_center*2)
	
	#Centers camera at grid center
	position = Grid_center
	
	print(ratio,Screen_size)
	if Take_up_full_screen == true:
		#if true makes grid take up full screen
		zoom = ratio
	else:
		
		print((Grid_center*2).normalized())
		zoom = Vector2.ONE/(Grid_center*2).normalized()

