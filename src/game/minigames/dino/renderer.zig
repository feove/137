const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("../../../core/assets.zig");
const Render = @import("../../../core/renderer.zig").Render;
const SpriteDefaultConfig = @import("../../../core/renderer.zig").SpriteDefaultConfig;
const Sprite = @import("../../../core/sprites.zig").Sprite;
const WindowProp = @import("../../../window_properties.zig");
const DinoGame = @import("textures.zig").DinoGame;

//const dTexture: DinoGameTexture = ;

pub const DinoRender = struct {
    pub fn render() !void {
        scene();
        try drawEntity();
    }

    fn scene() void {
        const textures = assets_mod.assets.dinoGame.dinoTextures;

        Render.draw_texture(textures.background, SpriteDefaultConfig{
            .scale = 2.0,
        });

        Render.draw_texture(textures.ground, SpriteDefaultConfig{
            .position = .init(0, 0.67 * @as(f32, @floatFromInt(
                WindowProp.SCREENHEIGHT,
            ))),
            .scale = 2.0,
        });
    }

    fn drawEntity() !void {
        const textures = assets_mod.assets.dinoGame.dinoTextures;
        const sprite = assets_mod.assets.dinoGame.dinoSprites;

        Sprite.drawSprite(sprite.OstrichRun, textures.ostrich_run, SpriteDefaultConfig{
            .position = .init(0, 178),
            .scale = 2.0,
        });
    }
};
