LCC?=lcc -Wa-l
EMU?=sameboy

.PHONY:
build: rom.gb

.PHONY:
run: build
	$(EMU) rom.gb

%.gb: main.rel bank1.rel bank2.rel
	$(LCC) -Wl-yt0x03 -Wl-ya1 -Wl-yo4 -Wl-m -Wl-j -Wl'-yn="BANKTEST"' -o $@ $^

%.rel: %.s
	$(LCC) -c -o $@ $^

%.s: %.c
	$(LCC) -c -Wf--fverbose-asm -S -o $@ $^

.PHONY:
clean:
	find . -maxdepth 2 -type f -regex '.*.\(o\|map\|lst\|sym\|rel\|ihx\|lk\|noi\|s\|asm\|adb\|cdb\|bi4\)' -delete