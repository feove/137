// Main renderer
const std = @import("std");
const rl = @import("raylib");

pub const Render = struct {
    pub fn main() void {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
};
