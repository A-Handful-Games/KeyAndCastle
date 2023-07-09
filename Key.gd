extends Area2D

var key_rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	pass


func _on_dot_player_player_moved(player_data):
	#if overlaps with player disable collision and hide
	if overlaps_body(player_data.player_node):
		$CollisionShape2D.disabled = true
		hide()
