const rl = @import("raylib");
const Assets = @import("assets.zig").Assets;

pub var assets: Assets = undefined;

pub const Init = struct {
    pub fn textures() !void {
        try assets.init();
    }
};
