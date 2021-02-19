extends Node2D


var timer


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 180


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timer = timer - 1
	if timer == 0: get_tree().change_scene("res://levels/start.tscn")
