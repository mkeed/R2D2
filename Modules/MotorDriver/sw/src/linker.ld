ENTRY( _start )

__stack_size = 256;

PROVIDE( _stack_size = __stack_size );

MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 60K
	RAM (xrw)  : ORIGIN = 0x20000000, LENGTH = 2K
}
SECTIONS
{
   .init :
    { 
      _sinit = .;
      . = ALIGN(4);
      KEEP(*(SORT_NONE(.init)))
      _init_fn_pos = .;
      KEEP(*(SORT_NONE(.startup_code)))
      . = ALIGN(4);
      _einit = .;
    } >FLASH AT>FLASH
    .text :
    {
      . = ALIGN(4);
      *(.text)
      *(.text.*)
      *(.rodata)
      *(.rodata*)
      . = ALIGN(4);
    } >FLASH AT>FLASH 
}
