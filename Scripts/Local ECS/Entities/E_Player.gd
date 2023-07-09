extends AnimatableBody2D

class_name E_Player

const COMPONENT_TYPE = C_SynchroRawPos.COMPONENT_TYPE
const NAME = "PLAYER"
const MOVE_UPDATE_STRING = "PLAYER_MOVE"

var _entity: Entity
var c_raw_postion: C_RawPosition
var c_grid_position: C_GridPosition
var c_move_update_state: C_UpdateState

@export var init_grid_pos: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	c_raw_postion = C_RawPosition.new()
	c_grid_position = C_GridPosition.new(init_grid_pos)
	c_move_update_state = C_UpdateState.new(
		MOVE_UPDATE_STRING
	)
	var e: Entity = Entity.new([
			self.get_parent() as EC_Grid,
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
