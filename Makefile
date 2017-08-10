obj-m := dummy_hcd.o
KVERSION := $(shell uname -r)
SVERSION := $(shell uname -r | grep -o "^[^-]*")

all: dummy_hcd.c
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) clean

dummy_hcd.c: /usr/src/linux-source-$(SVERSION)/linux-source-$(SVERSION).tar.bz2
	tar -xjvf $^ linux-source-$(SVERSION)/drivers/usb/gadget/udc/dummy_hcd.c &&\
	cp linux-source-$(SVERSION)/drivers/usb/gadget/udc/dummy_hcd.c $@
