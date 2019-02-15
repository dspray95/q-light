extends RigidBody2D

export (int) var min_speed
export (int) var max_speed
var mob_types = ["fall"]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
