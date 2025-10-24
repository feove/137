const rl = @import("raylib");
const Assets = @import("assets.zig").Assets;
const assets_mod = @import("assets.zig");
const render_mod = @import("renderer.zig");
const DinoTexture = @import("../game/minigames/dino/textures.zig").DinoTexture;

pub fn init() !void {
    try Init.textures();
    rl.setTargetFPS(60);
}

const Init = struct {
    pub fn textures() !void {
        try assets_mod.assets.init();
        try render_mod.virtualTexture.init();
        // DinoTexture.init();
    }

    pub fn allocation() void {}
};
