const rl = @import("raylib");
const Engine = @import("core/engine.zig").Engine;
const Init = @import("core/init.zig").Init;
pub fn main() anyerror!void {
    const screenWidth = 1920 / 3;
    const screenHeight = 1080 / 3;

    try Init.textures();

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        try Engine.run();
    }
}
