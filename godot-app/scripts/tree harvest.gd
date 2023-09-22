extends Node3D

signal stop_chopping
signal start_chopping

var type = ""
var hp_max = 0
var hp = 0
var wait = 0
var regen = false
var timer = null

func _ready():
	if "oak" in name:
		type = "oak"
		hp_max = 10
		hp = 3
		wait = 5
		timer = get_node("timer")

func _process(delta):
	if hp <=  0 and regen == false:
		print("regen")
		regenerate();

func regenerate():
	stop_chopping.emit()
	timer.start(wait)
	timer.timeout.connect(regenerated)
	regen = true
	
func regenerated():
	hp = hp_max
	start_chopping.emit()
	regen = false
	
func _on_area_3d_area_entered(area):
	hp = hp - 1
