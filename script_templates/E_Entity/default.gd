# meta-name: Positional Entity
# meta-description: An entity with a position (or similar data)

extends E_Entity # Replace this with your actual base class

func _init():
	## Create an trackable entity with the desired components
	## and bind it as a node
	var _entity: Entity = Entity.new([
			## List of components to register 
		],
		#autoregister=true
	)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
