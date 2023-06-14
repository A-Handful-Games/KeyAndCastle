extends TextEdit

var key_count : int

# Called when the node enters the scene tree for the first time.
func _ready():
	
	key_count = 0
	text = str(key_count)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_key_key_got():
	
	key_count = key_count + 1
	text = str(key_count)
	pass # Replace with function body.
