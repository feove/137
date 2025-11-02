const debug = @import("std").debug.print;
const rl = @import("raylib");
const render_mod = @import("renderer.zig");

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

        const obj_width: f32 = width / @as(f32, @floatFromInt(stateNumber));
        //debug("OBJ WIDTH = {d}\n", .{obj_width});
        const obj_height: f32 = height;

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

    pub fn drawSprite(sprite: Sprite, texture: rl.Texture2D, default: SpriteDefaultConfig) void {
        const x = sprite.src.x;
        const y = sprite.src.y;
        const w_obj = sprite.src.width;
        const h_obj = sprite.src.height;
        const state: f32 = @as(f32, @floatFromInt(sprite.currentState));

        const src: rl.Rectangle = .init(x + w_obj * state, y + h_obj * state, w_obj, h_obj);

        rl.drawTexturePro(
            texture,
            src,
            rl.Rectangle{
                .x = default.position.x,
                .y = default.position.y,
                .width = sprite.src.width * default.scale,
                .height = sprite.src.height * default.scale,
            },
            .init(0, 0),
            0,
            default.color,
        );
    }
};
