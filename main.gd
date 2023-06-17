extends Node2D

@export var debug : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print_tree_pretty()
	print_debug(RawPositionComponent.new(Vector2.ONE).data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.