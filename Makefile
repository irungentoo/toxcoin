CC = gcc
BINOUT = toxcoin

CFLAGS += -std=gnu99 -Wall

SRCDIR = code
OBJDIR = code/obj

LIBS =
INC =

CFILES = crypto crypto_core network
OBJFILES = $(CFILES:%=$(OBJDIR)/%.o)
HEADERS = crypto crypto_core network

all: $(BINOUT)

$(BINOUT): $(CFILES:%=$(OBJDIR)/%.o)
	$(CC) $(CFLAGS) -I$(INC) -I$(SRCDIR) $^ -o $@ $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADERS:%=$(SRCDIR)/%.h)
	$(CC) $(CFLAGS) -I$(INC) -I$(SRCDIR) -c $< -o $@ 

clean:
	rm -f $(OBJDIR)/*.o $(BINOUT)
