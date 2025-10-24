const rl = @import("raylib");
const assets_mod = @import("../../../core/assets.zig");
const DinoSprites = @import("sprites.zig").DinoSprites;

const root = "assets/dino/";

pub const DinoGame = struct {
    dinoTextures: DinoTexture,
    dinoSprites: DinoSprites,

    pub fn init() !DinoGame {
        const dinoTexture: DinoTexture = try DinoTexture.init();
        const dinoSprite = DinoSprites.init(dinoTexture);

        return DinoGame{
            .dinoTextures = dinoTexture,
            .dinoSprites = dinoSprite,
        };
    }
};

pub const DinoTexture = struct {
    dino_test: rl.Texture2D = undefined,
    background: rl.Texture2D = undefined,
    ground: rl.Texture2D = undefined,
    ostrich_run: rl.Texture2D = undefined,

    pub fn init() !DinoTexture {
        return DinoTexture{
            .dino_test = try rl.loadTexture(root ++ "sprites/dinotest.png"),
            .background = try rl.loadTexture(root ++ "sprites/backgrounds.png"),
            .ground = try rl.loadTexture(root ++ "sprites/Ground.png"),
            .ostrich_run = try rl.loadTexture(root ++ "sprites/OstrichRun.png"),
        };
    }
};
