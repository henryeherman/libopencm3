##
## This file is part of the libopenstm32 project.
##
## Copyright (C) 2009 Uwe Hermann <uwe@hermann-uwe.de>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
##

# PREFIX	?= arm-none-eabi
PREFIX		?= arm-elf
DESTDIR		?= /usr/local
INCLUDEDIR	= $(DESTDIR)/$(PREFIX)/include
LIBDIR		= $(DESTDIR)/$(PREFIX)/lib
INSTALL		= install

# Do not print "Entering directory ...".
MAKEFLAGS += --no-print-directory

# Be silent per default, but 'make V=1' will show all compiler calls.
ifneq ($(V),1)
Q := @
endif

all: build

build:
	$(Q)$(MAKE) -C lib all

install: build
	$(Q)$(INSTALL) -d $(INCLUDEDIR)/libopenstm32
	$(Q)$(INSTALL) -d $(LIBDIR)
	$(Q)$(INSTALL) -m 0644 include/libopenstm32.h $(INCLUDEDIR)
	$(Q)$(INSTALL) -m 0644 include/libopenstm32/*.h $(INCLUDEDIR)/libopenstm32
	$(Q)$(INSTALL) -m 0644 lib/*.a $(LIBDIR)

clean:
	$(Q)$(MAKE) -C lib clean
