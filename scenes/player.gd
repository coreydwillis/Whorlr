extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D

func _ready():
	Game.player_health = Game.PLAYER_START_HEALTH
	SignalBus.player_attacked.connect(playerAttacked)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("left"):
		$Sprite2D.flip_h = false
	if Input.is_action_just_pressed("right"):
		$Sprite2D.flip_h = true
		
	move_and_slide()

func playerAttacked():
	Game.player_health -= 1
	if Game.player_health <= 0:
		Game.game_over = true
		SignalBus.game_over.emit()
