extends Node

const PLAYER_START_HEALTH = 10

var game_over: bool = false
var player_health: int

func _ready():
	SignalBus.game_over.connect(gameOver)
	
func gameOver():
	print("Game over man, Game over")
