
CFLAGS := -Wall -Wextra -O2 -fPIC -I include
LDFLAGS := -v -lncurses

common-objs	:= confdata.o expr.o lexer.lex.o menu.o parser.tab.o \
		   preprocess.o symbol.o util.o

all: mconf

%.lex.c: %.l
	flex -o $@ $<

lexer.lex.o: parser.tab.h

%.tab.c %.tab.h: %.y
	bison -d -t -l $<

lxdialog	:= $(addprefix lxdialog/, \
		     checklist.o inputbox.o menubox.o textbox.o util.o yesno.o)

mconf-objs	:= mconf.o $(lxdialog) mnconf-common.o $(common-objs)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

mconf: $(mconf-objs)
	$(CC) -o mconf $(mconf-objs) $(LDFLAGS)

clean:
	rm -f $(mconf-objs) *.tab.c *.lex.o *.lex.c mconf

.PHONY: all clean
