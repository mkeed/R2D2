comptime {
    @export(&ints, .{ .name = "_vectors", .linkage = .strong, .section = ".init" });
    @export(&startup_code, .{ .name = "_start", .linkage = .strong, .section = ".startup_code" });
}

fn startup_code() callconv(.c) void {}
fn NothingFn() callconv(.c) void {}
fn SpinWaitFn() callconv(.c) void {
    while (true) {}
}
const util = @import("Util.zig");
const VecFn = *const fn () callconv(.c) void;

const NIMI = extern struct {
    unused1: u32 = util.addrToJmp(@sizeOf(NIMI)),
    unused2: u32 = 0xcafebabe,
    nmi: VecFn = NothingFn,
    hardFault: VecFn = SpinWaitFn,
    res4: VecFn = NothingFn,
    res5: VecFn = NothingFn,
    res6: VecFn = NothingFn,
    res7: VecFn = NothingFn,
    res8: VecFn = NothingFn,
    res9: VecFn = NothingFn,
    res10: VecFn = NothingFn,
    res11: VecFn = NothingFn,
    sysTick: VecFn = NothingFn,
    res13: VecFn = NothingFn,
    sw: VecFn = NothingFn,
    res15: VecFn = NothingFn,
    wwdg: VecFn = NothingFn,
    pvd: VecFn = NothingFn,
    flash: VecFn = NothingFn,
    rcc: VecFn = NothingFn,
    exti7_0: VecFn = NothingFn,
    awu: VecFn = NothingFn,
    DMA1_CH1: VecFn = NothingFn,
    DMA1_CH2: VecFn = NothingFn,
    DMA1_CH3: VecFn = NothingFn,
    DMA1_CH4: VecFn = NothingFn,
    DMA1_CH5: VecFn = NothingFn,
    DMA1_CH6: VecFn = NothingFn,
    DMA1_CH7: VecFn = NothingFn,
    ADC: VecFn = NothingFn,
    I2C1_EV: VecFn = NothingFn,
    I2C1_ER: VecFn = NothingFn,
    USART1: VecFn = NothingFn,
    SPI1: VecFn = NothingFn,
    TIM1BRK: VecFn = NothingFn,
    TIM1UP: VecFn = NothingFn,
    TIM1TRG: VecFn = NothingFn,
    TIM1CC: VecFn = NothingFn,
    TIM2: VecFn = NothingFn,
};

pub const ints = NIMI{};

pub fn main() !void {}
const std = @import("std");

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("sw_lib");
