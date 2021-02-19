extends Area2D

var level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var name = get_tree().get_current_scene().get_name()
	name = name.right(5)
	level = int(name)
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")


func _on_body_entered(_body):
	get_node("AnimatedSprite1").visible = false
	select_image()
	get_node("AnimatedSprite2").visible = true


func select_image():
	if (level == 1): get_node("AnimatedSprite2").frame = 2
	elif (level == 2): get_node("AnimatedSprite2").frame = 0
	elif (level == 3): get_node("AnimatedSprite2").frame = 4
	elif (level == 4): get_node("AnimatedSprite2").frame = 1
	elif (level == 5): get_node("AnimatedSprite2").frame = 2


func _on_body_exited(_body):
	get_node("AnimatedSprite1").visible = true
	get_node("AnimatedSprite2").visible = false
