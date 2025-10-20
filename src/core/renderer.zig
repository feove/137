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

        const dt = assets_mod.assets.dinoGame.dino_test;
        const dinoWidth = @as(f32, @floatFromInt(dt.width));
        const dinoHeight = @as(f32, @floatFromInt(dt.height));

        rl.drawTexturePro(
            dt,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = dinoWidth,
                .height = -dinoHeight,
            },
            rl.Rectangle{
                .x = 0,
                .y = virtualTexture.virtualH - dinoHeight,
                .width = dinoWidth,
                .height = dinoHeight,
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );

        const screenW = @as(f32, @floatFromInt(rl.getScreenWidth()));
        const screenH = @as(f32, @floatFromInt(rl.getScreenHeight()));

        // Calculate scale to fit the virtual resolution inside the screen
        var scale = screenW / virtualTexture.virtualW;
        if (virtualTexture.virtualH * scale > screenH) {
            scale = screenH / virtualTexture.virtualH;
        }

        // Compute offset (center it)
        const scaledW = virtualTexture.virtualW * scale;
        const scaledH = virtualTexture.virtualH * scale;
        const offsetX = (screenW - scaledW) / 2.0;
        const offsetY = (screenH - scaledH) / 2.0;

        rl.endTextureMode();

        rl.beginDrawing();
        rl.clearBackground(.black);

        rl.drawTexturePro(
            virtualTexture.rtexture.texture,
            rl.Rectangle{
                .x = 0,
                .y = 0,
                .width = @floatFromInt(virtualTexture.rtexture.texture.width),
                .height = @floatFromInt(-virtualTexture.rtexture.texture.height),
            },
            rl.Rectangle{
                .x = offsetX,
                .y = offsetY,
                .width = scaledW,
                .height = scaledH,
            },
            rl.Vector2{ .x = 0, .y = 0 },
            0,
            rl.Color.white,
        );

        rl.endDrawing();
    }
};
