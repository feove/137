const rl = @import("raylib");
const Assets = @import("assets.zig").Assets;
const assets_mod = @import("assets.zig");

pub const Init = struct {
    pub fn textures() !void {
        try assets_mod.assets.init();
    }
};
