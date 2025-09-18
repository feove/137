const rl = @import("raylib");

const root = "../../assets/";

pub const Assets = struct {
    dinoGame: DinoGame,

    pub fn init(self: *Assets) !void {
        try self.dinoGame.init();
    }
};

// Dino Game
pub const DinoGame = struct {
    dino_test: rl.Texture2D,

    pub fn init(self: *DinoGame) !void {
        self.dino_test = try rl.loadTexture(root ++ "t-rex/sprites/dino.png");
    }
};
