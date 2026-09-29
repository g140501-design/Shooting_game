extends Sprite2D

@export var speed: float = 100.0
@export var textures :Array[Texture2D]

func _ready() -> void:
	randomize()
	texture = textures[randi() % textures.size()]

func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y >= get_viewport().size.y:
		position.y -= get_viewport().size.y *2
		texture = textures[randi() % textures.size()]
