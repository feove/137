const std = @import("std");
const print = std.debug.print;
const rl = @import("raylib");

const root = "assets/dino/";

pub var dino_texture: rl.Texture2D = undefined;
pub var assets: Assets = undefined;

pub const Assets = struct {
    dinoGame: DinoGame = undefined,

    pub fn init(self: *Assets) !void {
        try self.dinoGame.init();
    }
};

// Dino Game
pub const DinoGame = struct {
    dino_test: rl.Texture2D = undefined,
    background: rl.Texture2D = undefined,
    ground: rl.Texture2D = undefined,

    pub fn init(self: *DinoGame) !void {
        self.dino_test = try rl.loadTexture(root ++ "sprites/dinotest.png");
        self.background = try rl.loadTexture(root ++ "sprites/backgrounds.png");
        self.ground = try rl.loadTexture(root ++ "sprites/Ground.png");
    }
};
