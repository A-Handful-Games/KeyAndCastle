extends AnimatableBody2D

class_name E_Player

const COMPONENT_TYPE = C_SynchroRawPos.COMPONENT_TYPE
const NAME = "PLAYER"

var _entity: Entity

@export_category("Entity: Player")
@export_group("Components")
@export var c_raw_postion: C_RawPosition
@export var c_grid_position: C_GridPosition
@export var c_move_update_state: C_UpdateState
@export var attached_grid: EC_Grid

# Called when the node enters the scene tree for the first time.
func _ready():
	var e: Entity = Entity.new([
			attached_grid,
			c_raw_postion,
			c_grid_position,
			c_move_update_state,
			self,
		],
		#autoregister:=true
	)
	
	e.bind_node(self)
	_entity = e



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
