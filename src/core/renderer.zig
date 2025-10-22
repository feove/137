const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("assets.zig");
const Engine = @import("engine.zig").Engine;
const DinoRender = @import("../game/minigames/dino/renderer.zig").DinoRender;

pub var virtualTexture = VirtualTexture{};

const VIRTUAL_W = 1920 / 4;
const VIRTUAL_H = 1080 / 4;
const VIRTUAL_X = 0;
const VIRTUAL_Y = 0;

const VirtualTexture = struct {
    virtualH: f32 = VIRTUAL_H,
    virtualW: f32 = VIRTUAL_W,
    virtualX: f32 = VIRTUAL_X,
    virtualY: f32 = VIRTUAL_Y,
    rtexture: rl.RenderTexture2D = undefined,

    pub fn init(vtexture: *VirtualTexture) !void {
        vtexture.rtexture = try rl.loadRenderTexture(VIRTUAL_W, VIRTUAL_H);
    }

    pub fn deinit(vtexture: *VirtualTexture) void {
        rl.unloadTexture(vtexture.texture);
    }
};

pub const SpriteDefaultConfig = struct {
    x_offset: f32 = 0,
    y_offset: f32 = 0,
    position: rl.Vector2,
    scale: f32 = 1.0,
    rotation: f32 = 0,
    origin: rl.Vector2 = rl.Vector2{ .x = 0, .y = 0 },
    alpha: f32 = 1.0,
    color: rl.Color = .white,
};

pub const Render = struct {
    pub fn main() void {
        rl.beginTextureMode(virtualTexture.rtexture);

        rl.clearBackground(.white);

        viewDrawing();

        rl.endTextureMode();

        rl.beginDrawing();

        draw_virtual_texture();

        rl.endDrawing();
    }

    fn viewDrawing() void {
        const currentView = Engine.getCurrentView();

        switch (currentView) {
            .DINO => {
                DinoRender.render();
            },
            .MENU => {},
        }
    }

    fn draw_virtual_texture() void {
        const screenW = @as(f32, @floatFromInt(rl.getScreenWidth()));
        const screenH = @as(f32, @floatFromInt(rl.getScreenHeight()));

        rl.drawTexturePro(
            virtualTexture.rtexture.texture,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = @floatFromInt(virtualTexture.rtexture.texture.width),
                .height = @floatFromInt(-virtualTexture.rtexture.texture.height),
            },
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = screenW, //@floatFromInt(virtualTexture.rtexture.texture.width),
                .height = screenH, //@floatFromInt(-virtualTexture.rtexture.texture.height),
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );
    }

    pub fn draw_simple_sprite(texture: rl.Texture2D, default: SpriteDefaultConfig) void {
        rl.drawTextureEx(
            texture,
            default.position,
            default.rotation,
            default.scale,
            default.color,
        );
    }
};
