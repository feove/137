const std = @import("std");
const print = std.debug.print;
const rl = @import("raylib");

pub var dino_texture: rl.Texture2D = undefined;
pub var assets: Assets = undefined;
const DinoGame = @import("../game/minigames/dino/textures.zig").DinoGame;

pub const Assets = struct {
    dinoGame: DinoGame = undefined,

    pub fn init(self: *Assets) !void {
        self.dinoGame = try DinoGame.init();
        //And other games
    }
};
