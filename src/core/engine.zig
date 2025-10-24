const std = @import("std");
const rl = @import("raylib");
const Render = @import("renderer.zig").Render;
const WindowProp = @import("../window_properties.zig").WindowProp;
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
        Render.main();
    }
};
