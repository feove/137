const rl = @import("raylib");
const Assets = @import("assets.zig").Assets;
const assets_mod = @import("assets.zig");
const render_mod = @import("renderer.zig");

pub const Init = struct {
    pub fn textures() !void {
        try assets_mod.assets.init();
        try render_mod.virtualTexture.init();
    }
};
