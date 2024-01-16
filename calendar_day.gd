extends VBoxContainer

func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
    return data is Texture2D

func _drop_data(_pos: Vector2, data: Variant):
    var textureRect = TextureRect.new()
    textureRect.texture = data
    textureRect.custom_minimum_size = Vector2(80, 300)
    add_child(textureRect)
