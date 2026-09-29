extends Node2D

@export var speed: float = 400.0 # 1秒間の移動ピクセル数

const TAMA = preload("uid://p0tpbdwqm3sv")
var base_angle := deg_to_rad(180) 


# 画面のサイズを取得する用
var screen_size: Vector2

func _ready() -> void:
	# ゲーム画面の横幅・縦幅を取得
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	# 1. 入力を取得 (矢印キーやWASD)
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	# 斜め移動でも移動速度が変わらないように正規化
	if direction.length() > 0:
		direction = direction.normalized()
	
	# 2. 位置を移動させる (座標 = 速度 × 時間 × 向き)
	position += direction * speed * delta
	
	# 3. 画面外にはみ出さないように制限 (横スクロールSTG用)
	position.x = clamp(position.x, 0.0, screen_size.x)
	position.y = clamp(position.y, 0.0, screen_size.y)


func _on_timer_timeout() -> void:
	shoot()

func shoot():
	var tama = TAMA.instantiate()
	tama.position = position
	tama.rotation = base_angle
	get_parent().add_child(tama)
