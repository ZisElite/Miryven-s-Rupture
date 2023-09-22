extends Node3D

var playing = false
var chopping = true
var anim = null

# Called when the node enters the scene tree for the first time.
func _ready():
	playing = false
	anim = get_node("AnimationPlayer")
	

func chop():
	anim.play("chop")
	playing = true

func _process(_delta):
	if not playing and chopping:
		chop()


func _on_animation_player_animation_finished(anim_name):
	playing = false


func _on_oak_tree_stop_chopping():
	chopping = false


func _on_oak_tree_start_chopping():
	chopping = true
