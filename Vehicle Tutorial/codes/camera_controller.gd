extends Spatial

# ---------------------
# Script author: Warrpy
# ---------------------

var increment = 0
var enabled = false
var mouse_x = 0

onready var vehicle = get_parent().get_node("VehicleBody")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin.y = vehicle.transform.origin.y #+ offset
	transform.origin.z = vehicle.transform.origin.z #+ offset
	transform.origin.x = vehicle.transform.origin.x #+ offset
	
	
func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		if enabled:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			enabled = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			enabled = true
	if event is InputEventMouseMotion && enabled:
		rotation.y += event.relative.x / -300
		rotation.x += event.relative.y / 300
