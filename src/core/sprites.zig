const rl = @import("raylib");

pub const SpriteDefaultConfig = struct {
    x_offset: f32 = 0,
    y_offset: f32 = 0,
    position: rl.Vector2 = rl.Vector2{ .x = 0, .y = 0 },
    scale: f32 = 1.0,
    rotation: f32 = 0,
    origin: rl.Vector2 = rl.Vector2{ .x = 0, .y = 0 },
    alpha: f32 = 1.0,
    color: rl.Color = .white,
};

pub const Sprite = struct {
    name: []const u8,
    src: rl.Rectangle,
    width: f32,
    height: f32,
    obj_width: f32,
    obj_height: f32,
    stateNumber: u16,
    currentState: u16,

    pub fn initFields(
        sprite: *Sprite,
        name: []const u8,
        texture: rl.Texture2D,
        obj_width: f32,
        obj_height: f32,
    ) void {
        sprite.height = @as(f32, @floatFromInt(texture.height));
        sprite.width = @as(f32, @floatFromInt(texture.width));
        sprite.name = name;
        sprite.obj_width = obj_width;
        sprite.obj_height = obj_height;
        sprite.stateNumber = @as(u16, @intFromFloat(sprite.width / sprite.obj_width));
        sprite.currentState = 0;
    }
};
