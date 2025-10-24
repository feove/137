const std = @import("std");
const print = std.debug.print;
const rl = @import("raylib");
const Engine = @import("core/engine.zig").Engine;
const init = @import("core/init.zig").init;
const WindowProp = @import("window_properties.zig");

pub fn main() anyerror!void {
    rl.initWindow(WindowProp.SCREENWIDTH, WindowProp.SCREENHEIGHT, "137");
    defer rl.closeWindow();

    try init(); // (Full domains init)

    while (!rl.windowShouldClose()) {
        try Engine.run();
    }
}
