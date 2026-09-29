extends Node2D

var speed : float = 600.0	# 弾の速さ
var velocity := Vector2.ZERO	# 移動方向と速度		
var spawn_offset := 32.0

func _ready():
	velocity = transform.y * speed	# ノードのY軸方向に velocity を設定
	position += transform.y * spawn_offset

func _process(delta):
	position += velocity * delta	# 毎秒speedピクセルの速さで transform.y方向に移動

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
