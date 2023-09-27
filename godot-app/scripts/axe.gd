extends Node3D

var playing = false
var regenerating = false
var active = false
var anim = null

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = get_node("AnimationPlayer")
	

func chop():
	anim.play("chop")
	playing = true

func _process(_delta):
	if not playing and active and not regenerating:
		chop()


func _on_animation_player_animation_finished(_anim_name):
	playing = false


func _on_woodcutting_regenerating(value):
	regenerating = value


func _on_woodcutting_activate(value):
	active = value
