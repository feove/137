const std = @import("std");
const rl = @import("raylib");
const Render = @import("renderer.zig").Render;

pub const GameView = enum {
    MENU,
    DINO,
};

pub var currentView: GameView = .DINO;

pub const Engine = struct {
    pub fn getCurrentView() GameView {
        return currentView;
    }

    pub fn run() !void {
        try Render.main();
    }
};
