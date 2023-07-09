extends Node2D

const PLAYER_SCENE = preload("res://Scenes/ECS/Entities/player_entity.tscn")

func _ready():
	add_child(PLAYER_SCENE.instantiate())

func _process(delta):
	pass
