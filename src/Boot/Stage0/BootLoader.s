; Stage 0 Of 2 stages
byte 16
.org 0x070E


_START

mov ah, 0x0000
mov si, 0x0040
mox ax, 0x0030
mov al, 0x007E

_SECTORS

mov ah, 0x0050
mov si, 0x007F
mov es, 0x007E
mov ah, 0x0000

_BIOSREAD

mov ah, 0x1600
mov ax, 0x0022

; Now read the sectors of the kernel

address: [src/Kernel.c]
address: [src\Boot\Stage1\Bootloader.s]
; Read This File

_KERNEL

mov ah, 0x0000
mov ax, 0x1200

_IMAGE

mov ah, 0x0000 {
    0, 1, 0, 0, 1, 0,
    0, 0, 1, 1, 0, 0, 
    0, 1, 0, 0, 1, 0, 
}
