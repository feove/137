const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("../../../core/assets.zig");
const Render = @import("../../../core/renderer.zig").Render;
const SpriteDefaultConfig = @import("../../../core/renderer.zig").SpriteDefaultConfig;

pub const DinoTexture = struct {
    dino_texture_test: rl.Texture2D = undefined,
    background: rl.Texture2D = undefined,
    ground: rl.Texture2D = undefined,
};

var Dtext: DinoTexture = undefined;

pub const DinoRender = struct {
    pub fn init() void {
        Dtext = DinoTexture{
            .dino_texture_test = assets_mod.assets.dinoGame.dino_test,
            .background = assets_mod.assets.dinoGame.background,
            .ground = assets_mod.assets.dinoGame.ground,
        };
    }

    pub fn render() void {
        scene();
        drawEntity();
    }

    fn scene() void {
        const bg_width = @as(f32, @floatFromInt(Dtext.background.width));
        const bg_height = @as(f32, @floatFromInt(Dtext.background.height));

        const g_width = @as(f32, @floatFromInt(Dtext.ground.width));
        const g_height = @as(f32, @floatFromInt(Dtext.ground.height));

        rl.drawTexturePro(
            Dtext.background,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = bg_width,
                .height = bg_height,
            },
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = bg_width,
                .height = bg_height,
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );

        rl.drawTexturePro(
            Dtext.ground,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = g_width,
                .height = g_height,
            },
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = g_width,
                .height = g_height,
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );

        Render.draw_simple_sprite(Dtext.ground, SpriteDefaultConfig{
            .position = .init(0, 50),
        });
    }

    fn drawEntity() void {
        Render.draw_simple_sprite(Dtext.dino_texture_test, SpriteDefaultConfig{
            .position = .init(0, 0),
        });
    }
};
