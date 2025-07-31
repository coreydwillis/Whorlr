extends CharacterBody2D

var run_speed = 25
@export var player : CharacterBody2D
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
		
	if velocity.x >= 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
		
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		SignalBus.player_attacked.emit()
		queue_free()
