const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("../../../core/assets.zig");
const Render = @import("../../../core/renderer.zig").Render;
const SpriteDefaultConfig = @import("../../../core/renderer.zig").SpriteDefaultConfig;
const WindowProp = @import("../../../window_properties.zig");
const DinoGameSprites = @import("sprites.zig").DinoGameSprites;

pub const DinoTexture = struct {
    dino_texture_test: rl.Texture2D = undefined,
    background: rl.Texture2D = undefined,
    ground: rl.Texture2D = undefined,
    ostrich_run: rl.Texture2D = undefined,
};

pub var Dtext: DinoTexture = undefined;

pub const DinoRender = struct {
    pub fn init() void {
        Dtext = DinoTexture{
            .dino_texture_test = assets_mod.assets.dinoGame.dino_test,
            .background = assets_mod.assets.dinoGame.background,
            .ground = assets_mod.assets.dinoGame.ground,
            .ostrich_run = assets_mod.assets.dinoGame.ostrich_run,
        };

        //init sprites
        DinoGameSprites.init();
    }

    pub fn render() void {
        scene();
        drawEntity();
    }

    fn scene() void {
        Render.draw_simple_sprite(Dtext.background, SpriteDefaultConfig{});

        Render.draw_simple_sprite(Dtext.ground, SpriteDefaultConfig{
            .position = .init(0, @as(f32, @floatFromInt(WindowProp.SCREENHEIGHT - 4 * Dtext.ground.height))),
        });
    }

    fn drawEntity() void {
        Render.draw_simple_sprite(Dtext.dino_texture_test, SpriteDefaultConfig{
            .position = .init(0, 0),
        });
    }
};
