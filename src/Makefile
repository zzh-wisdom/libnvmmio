CFLAGS = -W -Wall -fPIC
# CFLAGS = -W -Wall -fPIC -g -DDEBUG

LDFLAGS = -ldl -lpthread -lpmem
TARGET = libnvmmio.so

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))

all : $(TARGET)

$(TARGET) : $(OBJECTS)
	$(CC) -shared -o $@ $^ $(LDFLAGS)

clean :
	$(RM) $(OBJECTS) $(TARGET)
