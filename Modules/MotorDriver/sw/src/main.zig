comptime {
    @export(&startup_code, .{ .name = "_start", .linkage = .strong });
}

fn NothingFn() callconv(.c) void {}
fn SpinWaitFn() callconv(.c) void {
    while (true) {}
}

const VecFn = *const fn () void;

const NIMI = packed struct {
    unused1: u32 = 0,
    unused2: u32 = 0,
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

fn startup_code() callconv(.c) void {}

pub fn main() !void {}
const std = @import("std");

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("sw_lib");
