const std = @import("std");
const print = std.debug.print;
const rl = @import("raylib");

const root = "../../assets/";

pub var dino_texture: rl.Texture2D = undefined;

pub const Assets = struct {
    dinoGame: DinoGame = undefined,

    pub fn init(self: *Assets) !void {
        try self.dinoGame.init();
    }
};

// Dino Game
pub const DinoGame = struct {
    dino_test: rl.Texture2D = undefined,

    pub fn init(self: *DinoGame) !void {
        try rl.loadTexture(root ++ "t-rex/sprites/dino_spritesheet_seperated.png");

        print("No segfault\n", .{});
        self.dino_test = dino_texture;
    }
};
