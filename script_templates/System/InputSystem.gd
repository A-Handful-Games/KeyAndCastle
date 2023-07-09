# meta-name: Input System
# meta-description: A system with hooks for Input

extends System
class_name YOUR_INPUT_SYSTEM_HERE

### Input Events
### (See DEV_DOC for more)

# Called for every InputEvent.
# Ideal for event filtering.
#
#func _input(event):
# 	pass


# All other input; ideal for gameplay events.
# Not received when GUI is active
#
func _unhandled_input(event):
	pass


# Raw keyboard input; ideal for key events. 
# Only received if event is InputEventKey.
#
#func _unhandled_key_input(event):
#	pass


### Systems Logic
### https://github.com/Germenzi/gdECSv4/blob/main/README.md
###

# here system logic
func on_entity_process(entity: Entity, delta: float):
	pass


# returns an array of necessary components
func get_necessary_components():
	pass


# returns an array of banned components
func get_banned_components():
	pass
	


