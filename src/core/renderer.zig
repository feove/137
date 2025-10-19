const std = @import("std");
const rl = @import("raylib");
const assets_mod = @import("assets.zig");

pub var virtualTexture = VirtualTexture{};

const VIRTUAL_W = 1920 / 4;
const VIRTUAL_H = 1080 / 4;
const VIRTUAL_X = 0;
const VIRTUAL_Y = 0;

const VirtualTexture = struct {
    virtualH: f32 = VIRTUAL_H,
    virtualW: f32 = VIRTUAL_W,
    virtualX: f32 = VIRTUAL_X,
    virtualY: f32 = VIRTUAL_Y,
    rtexture: rl.RenderTexture2D = undefined,

    pub fn init(vtexture: *VirtualTexture) !void {
        vtexture.rtexture = try rl.loadRenderTexture(VIRTUAL_W, VIRTUAL_H);
    }

    pub fn deinit(vtexture: *VirtualTexture) void {
        rl.unloadTexture(vtexture.texture);
    }
};

pub const Render = struct {
    pub fn main() void {
        rl.beginTextureMode(virtualTexture.rtexture);

        rl.clearBackground(.white);
        rl.drawTexture(assets_mod.assets.dinoGame.dino_test, 0, 0, .white);

        rl.endTextureMode();

        rl.beginDrawing();
        rl.clearBackground(.black);

        rl.drawTexture(virtualTexture.rtexture.texture, 100, 100, .white);

        rl.endDrawing();
    }
};
