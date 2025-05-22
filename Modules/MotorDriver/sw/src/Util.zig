const std = @import("std");

pub fn addrToJmp(addr: u32) u32 {
    return 0x6f | (addr & (0b1111_1111_0000_0000_0000) |
        ((addr & 0b111_1111_1110) << 20) |
        ((addr & (1 << 11)) << 9) |
        ((addr & (1 << 20)) << 11));
}

test {
    const tc = struct { exp: u32, enc: u32 };
    const tcs = [_]tc{
        .{ .exp = 0x09c0006f, .enc = 0x9c },
        .{ .exp = 0x6efdb06f, .enc = 0xdeadbeef },
        .{ .exp = 0xeefdb06f, .enc = 0xdebdbeef },
    };
    for (tcs) |t| {
        const result = addrToJmp(t.enc);
        errdefer std.log.err("{x} => {x} != {x}", .{ t.enc, result, t.exp });
        try std.testing.expectEqual(t.exp, result);
    }

    try std.testing.expectEqual(0x6efdb06f, addrToJmp(0xdeadbeef));
}
