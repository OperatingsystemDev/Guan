# Emulate bootloader
bootloader: $(isofile)
    $(QEMU) -cdrom $<

# Create ISO
$(isofile): $(ISO) $(floppy)
    $(CP) $(floppy) $(ISO)/
    $(GENISOIMAGE) -A "SCC300" -input-charset utf-8 -b $(floppy) -o $@ $(ISO)/

# Floppy disk image
$(floppy): $(BIN)/boot0.bin
    $(DD) if=/dev/zero of=$@ bs=1024 count=1440        # zero filled 1.44MB floppy disk image
    $(DD) if=$< of=$@ seek=0 count=1 conv=notrunc    # place stage1 into first sector, don't truncate

# Assemble boot stages to binaries
$(BIN)/boot0.bin: $(BOOT)/boot0.asm        # assemble boot0
    $(NASM) -I '$(BOOT)/' -o $@ $<

# Directory Targets
$(ISO):
    $(MKDIR) $@