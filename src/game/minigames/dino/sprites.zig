const rl = @import("raylib");
const Sprite = @import("../../../core/sprites.zig").Sprite;
const dino_mod = @import("renderer.zig");

const DinoTexture = @import("textures.zig").DinoTexture;

pub var dinoSprites = DinoSprites{};

pub const DinoSprites = struct {
    OstrichRun: Sprite = undefined,

    pub fn init(dinoTexture: DinoTexture) DinoSprites {
        // dinoSprites.OstrichRun.initFields("Dino", dino_mod.Dtext.ostrich_run, obj_width: f32, obj_height: f32)

        return DinoSprites{
            .OstrichRun = Sprite.init(dinoTexture.ostrich_run, 4),
        };
    }
};
