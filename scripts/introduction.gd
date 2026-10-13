extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = $PlayButton
var paused := false

func _ready() -> void:
    play_button.pressed.connect(toggle_animation)
    $ReplayButton.pressed.connect(replay)
    animation.play("welcome_loop")
    var args := OS.get_cmdline_user_args()
    if "--capture" in args:
        capture_preview()
    if "--editor-preview" in args:
        animation.seek(1.5, true)
        animation.pause()

func toggle_animation() -> void:
    paused = not paused
    if paused:
        animation.pause()
        play_button.text = "เล่นต่อ"
    else:
        animation.play("welcome_loop")
        play_button.text = "หยุดชั่วคราว"

func replay() -> void:
    paused = false
    animation.play("welcome_loop")
    animation.seek(0.0, true)
    play_button.text = "หยุดชั่วคราว"

func _unhandled_key_input(event: InputEvent) -> void:
    if event is InputEventKey and event.pressed and not event.echo:
        if event.keycode == KEY_SPACE:
            toggle_animation()
            get_viewport().set_input_as_handled()
        elif event.keycode == KEY_R:
            replay()
            get_viewport().set_input_as_handled()

func capture_preview() -> void:
    await get_tree().create_timer(1.5).timeout
    await RenderingServer.frame_post_draw
    var image := get_viewport().get_texture().get_image()
    var target := ProjectSettings.globalize_path("res://evidence/runtime.png")
    DirAccess.make_dir_recursive_absolute(target.get_base_dir())
    image.save_png(target)
    get_tree().quit()
