pub const SCREENWIDTH = 1920 / 3;
pub const SCREENHEIGHT = 1080 / 3;

pub var winProp = WindowProp{};

pub const WindowProp = struct {
    width_f: f32 = SCREENWIDTH,
    height_f: f32 = SCREENHEIGHT,
    width_i: i32 = SCREENWIDTH,
    height_i: i32 = SCREENHEIGHT,
};
