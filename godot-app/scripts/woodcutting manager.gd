extends Node3D

var trees = {}

var active_tree = null
var active_skill = false
var mouse_on_tree = false

signal regenerating()
signal activate()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_MASK_LEFT and mouse_on_tree:
		if active_skill:
			active_skill = false
			activate.emit(false)
		else:
			active_skill = true
			activate.emit(true)


func _on_static_body_3d_mouse_entered():
	mouse_on_tree = true


func _on_static_body_3d_mouse_exited():
	mouse_on_tree = false

func check_if_still_same_tree(tree_name, regen):
	if active_tree == tree_name:
		regenerating.emit(regen)

#--------------------------------------

func _on_oak_tree_start_chopping(tree_name):
	check_if_still_same_tree(tree_name, true)


func _on_oak_tree_stop_chopping(tree_name):
	check_if_still_same_tree(tree_name, false)


func _on_willow_tree_start_chopping(tree_name):
	check_if_still_same_tree(tree_name, true)


func _on_willow_tree_stop_chopping(tree_name):
	check_if_still_same_tree(tree_name, false)



func _on_teak_tree_start_chopping(tree_name):
	check_if_still_same_tree(tree_name, true)


func _on_teak_tree_stop_chopping(tree_name):
	check_if_still_same_tree(tree_name, false)


func _on_maple_tree_start_chopping(tree_name):
	check_if_still_same_tree(tree_name, true)


func _on_maple_tree_stop_chopping(tree_name):
	check_if_still_same_tree(tree_name, false)


func _on_mahogany_tree_start_chopping(tree_name):
	check_if_still_same_tree(tree_name, true)


func _on_mahogany_tree_stop_chopping(tree_name):
	check_if_still_same_tree(tree_name, false)
