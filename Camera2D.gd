extends Camera2D


@export var Take_up_full_screen : bool = false






func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_our_tile_grid_proportions(tile_scale, grid_size_in_tiles, tile_size):
	
	var grid_size = Vector2(grid_size_in_tiles*tile_size)
	var grid_center = grid_size/2
	var screen_size = get_viewport_rect().size
	var ratio = screen_size/grid_size

	
	#Centers camera at grid center
	position = grid_center
	
	zoom = calc_camera_zoom(
		grid_size,
		grid_center,
		screen_size,
		ratio
	)


func calc_camera_zoom(grid_size,grid_center,screen_size,ratio)->Vector2:

	
	if Take_up_full_screen == true:
		#if true makes grid take up full screen
		return ratio
		
	
	#make grid smaller
	var index_diff : int = grid_size.max_axis_index()
	
	if grid_size < screen_size:
		#make grid bigger
		
		#take diffenence between grid size and screen size
		var diff = Vector2(screen_size-grid_size)
		
		#if grid is samller than screen size get the axis in which the 
		#difference between the grid and the sccreen is the smallest
		index_diff = diff.min_axis_index()
			
		
	#size of the camera/what size the camera should be
	var scale_by = ratio[index_diff]

	return Vector2(scale_by,scale_by)


