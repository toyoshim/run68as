# Copyright 2016 Takashi Toyoshima <toyoshim@gmail.com>. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

TARGET	= run68.js
OUT	= out
DEPEND	= $(OUT)/depend
RUN68	= third_party/run68/src
MOD68	= mod
CC	= emcc
DEFS	= -DFNC_TRACE -DENV_FROM_INI
CFLAGS	= $(DEFS) -Oz -include $(MOD68)/preinc.h -I $(RUN68)
EXPORTS	= -s EXPORTED_FUNCTIONS="['_main', '_set_slow_mode']"
LDFLAGS	= -lm -Oz --js-library empty_runtime.js $(EXPORTS)
SRCS	= \
	$(RUN68)/ansicolor-w32.c \
	$(RUN68)/calc.c \
	$(RUN68)/conditions.c \
	$(RUN68)/disassemble.c \
	$(RUN68)/eaaccess.c \
	$(RUN68)/exec.c \
	$(RUN68)/getini.c \
	$(RUN68)/key.c \
	$(RUN68)/line0.c \
	$(RUN68)/line2.c \
	$(RUN68)/line5.c \
	$(RUN68)/line6.c \
	$(RUN68)/line7.c \
	$(RUN68)/line8.c \
	$(RUN68)/line9.c \
	$(RUN68)/lineb.c \
	$(RUN68)/linec.c \
	$(RUN68)/lined.c \
	$(RUN68)/linee.c \
	$(RUN68)/load.c \
	$(MOD68)/line4.c \
	$(MOD68)/linef.c \
	$(MOD68)/mem.c \
	$(MOD68)/run68.c

OBJS	= $(addprefix $(OUT)/, $(notdir $(SRCS:.c=.o)))

$(OUT)/%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<

$(OUT)/%.o: $(MOD68)/%.c
	$(CC) $(CFLAGS) -o $@ $<

$(OUT)/%.o: $(RUN68)/%.c
	$(CC) $(CFLAGS) -o $@ $<

.PHONY: all clean depend
all: $(DEPEND) $(TARGET)

clean:
	rm -rf $(OUT) $(TARGET) *.mem

depend: $(DEPEND)

$(DEPEND): $(SRCS) Makefile
	mkdir -p $(OUT)
	$(CC) $(CFLAGS) -MM $(SRCS) > $@

$(TARGET): $(OBJS) empty_runtime.js
	$(CC) -o $@ $(LDFLAGS) $(OBJS)

ifneq "$(MAKECMDGOALS)" "clean"
-include $(DEPEND)
endif
