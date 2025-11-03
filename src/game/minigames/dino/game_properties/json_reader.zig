const std = @import("std");
const rl = @import("raylib");

pub fn levelReader(allocator: std.mem.Allocator, level_pathway: []const u8) !void {
    var file = try std.fs.cwd().openFile(level_pathway, .{});
    defer file.close();

    const json_data = try file.readToEndAlloc(allocator, 1024 * 10);
    defer allocator.free(json_data);

    const parsed = std.json.parseFromSlice(std.json.Value, allocator, json_data, .{}) catch |err| {
        std.debug.print("JSON Parse Error: {}\n", .{err});
        return err;
    };
    defer parsed.deinit();

    const root_object = parsed.value.object;
    var iter = root_object.iterator();

    while (iter.next()) |_| {}

    return;
}
