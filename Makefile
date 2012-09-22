BIN:=$(notdir $(shell pwd))
SRCFILES:=$(shell find src/ -name *.c)
TMPOBJS:=${SRCFILES:.c=.o}
OBJFILES:=${foreach TMP,$(TMPOBJS),$(subst src/,obj/,$(TMP))}
CC=gcc

all : ${BIN}
	@echo $(BIN)

obj/%.o : src/%.c
	${CC} -c $^ -o $@

${BIN} : ${OBJFILES}
	${CC} $^ -o $@

