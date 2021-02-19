extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed('start'): get_tree().change_scene("res://levels/level1.tscn") == OK
