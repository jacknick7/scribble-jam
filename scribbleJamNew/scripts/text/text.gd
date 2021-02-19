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


func select_image():
	if (level == 1): 
		get_node("AnimatedSpriteU").frame = 0
		get_node("AnimatedSpriteU").visible = true
	elif (level == 2): 
		get_node("AnimatedSpriteL").frame = 0
		get_node("AnimatedSpriteL").visible = true
		get_node("AnimatedSpriteR").frame = 9
		get_node("AnimatedSpriteR").visible = true
	elif (level == 3): 
		get_node("AnimatedSpriteL").frame = 8
		get_node("AnimatedSpriteL").visible = true
		get_node("AnimatedSpriteU").frame = 3
		get_node("AnimatedSpriteU").visible = true
	elif (level == 4): 
		get_node("AnimatedSpriteU").frame = 0
		get_node("AnimatedSpriteU").visible = true
		get_node("AnimatedSpriteL").frame = 9
		get_node("AnimatedSpriteL").visible = true
		get_node("AnimatedSpriteD").frame = 2
		get_node("AnimatedSpriteD").visible = true
	elif (level == 5): 
		get_node("AnimatedSpriteL").frame = 2
		get_node("AnimatedSpriteL").visible = true
		get_node("AnimatedSpriteR").frame = 8
		get_node("AnimatedSpriteR").visible = true
		get_node("AnimatedSpriteD").frame = 3
		get_node("AnimatedSpriteD").visible = true


func _on_body_exited(_body):
	get_node("AnimatedSprite1").visible = true
	get_node("AnimatedSpriteU").visible = false
	get_node("AnimatedSpriteR").visible = false
	get_node("AnimatedSpriteD").visible = false
	get_node("AnimatedSpriteL").visible = false
