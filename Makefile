BIN:=$(notdir $(shell pwd))
SRCFILES:=$(shell find src/ -name *.c)
TMPOBJS:=${SRCFILES:.c=.o}
OBJFILES:=${foreach TMP,$(TMPOBJS),$(subst src/,obj/,$(TMP))}
CC=gcc
INCLUDES:=-Isrc/

all : obj ${BIN}

obj :
	mkdir -p obj/

obj/%.o : src/%.c
	${CC} -c $^ ${INCLUDES} -o $@

${BIN} : ${OBJFILES}
	${CC} $^ -o $@


clean :
	rm -rf obj ${BIN}

.PHONY: clean

