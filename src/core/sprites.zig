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
    name: []const u8 = undefined,
    src: rl.Rectangle = undefined,
    width: f32 = undefined,
    height: f32 = undefined,
    obj_width: f32 = undefined,
    obj_height: f32 = undefined,
    stateNumber: u8 = undefined,
    currentState: u8 = undefined,

    //TODO Add vertical Sprite init option in the futur
    pub fn init(texture: rl.Texture2D, stateNumber: u8) Sprite {
        const width: f32 = @as(f32, @floatFromInt(texture.width));
        const height: f32 = @as(f32, @floatFromInt(texture.height));

        const obj_width: f32 = @as(f32, @floatFromInt(@as(u8, @intCast(texture.width)) / stateNumber));
        const obj_height: f32 = @as(f32, @floatFromInt(texture.height));

        return Sprite{
            .src = rl.Rectangle.init(0, 0, obj_width, obj_height),
            .height = height,
            .width = width,
            .obj_width = obj_width,
            .obj_height = obj_height,
            .stateNumber = stateNumber,
            .currentState = 0,
        };
    }
};
