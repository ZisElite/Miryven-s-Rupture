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
		hp = 10
		wait = 5
	elif "willow" in name:
		type = "willow"
		hp_max = 10
		hp = 10
		wait = 6
	elif "teak" in name:
		type = "teak"
		hp_max = 10
		hp = 10
		wait = 7
	elif "maple" in name:
		type = "maple"
		hp_max = 10
		hp = 10
		wait = 8
	elif "mahogany" in name:
		type = "mahogany"
		hp_max = 10
		hp = 10
		wait = 9
	timer = get_node("timer")

func _process(_delta):
	if hp <=  0 and regen == false:
		print("regen")
		regenerate();

func regenerate():
	stop_chopping.emit()
	timer.start(wait)
	timer.timeout.connect(regenerated)
	regen = true
	
func regenerated():
	print("all heald up")
	hp = hp_max
	start_chopping.emit()
	regen = false
	
func _on_area_3d_area_entered(_area):
	hp = hp - 1
