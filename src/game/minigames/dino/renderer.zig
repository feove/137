const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("../../../core/assets.zig");

pub const DinoRender = struct {
    pub fn render() void {
        const dt = assets_mod.assets.dinoGame.dino_test;
        const dinoWidth = @as(f32, @floatFromInt(dt.width));
        const dinoHeight = @as(f32, @floatFromInt(dt.height));

        rl.drawTexturePro(
            dt,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = dinoWidth,
                .height = dinoHeight,
            },
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = dinoWidth,
                .height = dinoHeight,
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );
    }
};
