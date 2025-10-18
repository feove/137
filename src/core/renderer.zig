const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("assets.zig");

pub const Render = struct {
    var target: rl.RenderTexture2D = undefined;
    const virtualWidth = 640;
    const virtualHeight = 360;

    pub fn init() !void {
        target = try rl.loadRenderTexture(virtualWidth, virtualHeight);
    }

    pub fn main() void {
        rl.beginTextureMode(target);
        rl.clearBackground(.white);

        rl.drawTexture(assets_mod.assets.dinoGame.dino_test, 0, 0, .white);

        rl.endTextureMode();

        const screenW = rl.getScreenWidth();
        const screenH = rl.getScreenHeight();

        const scaleX = @as(f32, @floatFromInt(screenW)) / @as(f32, @floatFromInt(virtualWidth));
        const scaleY = @as(f32, @floatFromInt(screenH)) / @as(f32, @floatFromInt(virtualHeight));
        const scale = if (scaleX < scaleY) scaleX else scaleY;

        const finalW = @as(i32, @intFromFloat(@as(f32, virtualWidth) * scale));
        const finalH = @as(i32, @intFromFloat(@as(f32, virtualHeight) * scale));
        const offsetX = @divTrunc(screenW - finalW, 2);
        const offsetY = @divTrunc(screenH - finalH, 2);

        rl.beginDrawing();
        rl.clearBackground(.black);

        rl.drawTexturePro(
            target.texture,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = @floatFromInt(target.texture.width),
                .height = @floatFromInt(target.texture.height),
            },
            rl.Rectangle{
                .x = @floatFromInt(offsetX),
                .y = @floatFromInt(offsetY),
                .width = @floatFromInt(finalW),
                .height = @floatFromInt(finalH),
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );

        rl.endDrawing();
    }
};
