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
		
		#take diffenence between grid size and screen size
		var diff = Screen_size-(Grid_center*2)
		
		#get the smallest absoulte difference
		var min_diff = abs(diff).min_axis_index()
		
		#size of the camera/what size the camera should be
		var scale_by = ((Grid_center*2)[min_diff]+diff[min_diff])/(Grid_center*2)[min_diff]
		
		zoom = Vector2(scale_by,scale_by)
		pass

