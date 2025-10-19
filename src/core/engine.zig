const std = @import("std");
const rl = @import("raylib");
const Render = @import("renderer.zig").Render;

pub const GameView = enum {
    MENU,
    DINO,
};

pub var CurrentView = .MENU;

pub const Engine = struct {
    pub fn run() !void {
        Render.main();
    }
};
