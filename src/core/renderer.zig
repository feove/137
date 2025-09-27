// Main renderer
const std = @import("std");

const rl = @import("raylib");

pub const assets_mod = @import("assets.zig");

pub const Render = struct {
    pub fn main() void {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.drawTexture(assets_mod.assets.dinoGame.dino_test, 0, 0, .white);

        rl.clearBackground(.white);
    }
};
