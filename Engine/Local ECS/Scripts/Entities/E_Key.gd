extends Area2D

const COMPONENT_TYPE = C_SynchroRawPos.COMPONENT_TYPE

var attached_grid: EC_Grid

func _init(grid:= EC_Grid.new()):
	attached_grid = grid

# Called when the node enters the scene tree for the first time.
func _ready():
	var _entity: Entity = Entity.new([
			attached_grid,
			C_GridPosition.new(),
			C_RawPosition.new(),
			self
		],
		#autoregister:=true
	)
	
	_entity.bind_node(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
