const rl = @import("raylib");
const Sprite = @import("../../../core/sprites.zig").Sprite;
const dino_mod = @import("renderer.zig");

pub var dinoSprites: DinoGameSprites = struct {};

pub const DinoGameSprites = struct {
    OstrichRun: Sprite = undefined,

    pub fn init() void {
        // dinoSprites.OstrichRun.initFields("Dino", dino_mod.Dtext.ostrich_run, obj_width: f32, obj_height: f32)

        dinoSprites.OstrichRun = Sprite{ .name = "OstrichRun" };
    }
};
