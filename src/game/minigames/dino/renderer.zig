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

        Render.draw_texture(textures.background, SpriteDefaultConfig{});

        Render.draw_texture(textures.ground, SpriteDefaultConfig{
            .position = .init(0, @as(f32, @floatFromInt(
                WindowProp.SCREENHEIGHT - 4 * textures.ground.height,
            ))),
        });
    }

    fn drawEntity() !void {
        const textures = assets_mod.assets.dinoGame.dinoTextures;
        const sprite = assets_mod.assets.dinoGame.dinoSprites;
        //Render.draw_texture(textures.ostrich_run, SpriteDefaultConfig{
        //    .position = .init(0, 210),
        //});
        Sprite.drawSprite(sprite.OstrichRun, textures.ostrich_run, SpriteDefaultConfig{
            .position = .init(0, 210),
        });
    }
};
