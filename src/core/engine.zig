const std = @import("std");
const rl = @import("raylib");
const Render = @import("renderer.zig").Render;

pub const Engine = struct {
    pub fn run() !void {
        Render.main();
    }
};
