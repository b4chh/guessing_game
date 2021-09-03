include ../config.mk

CFLAGS=$(shell pkg-config oehost-$(COMPILER) --cflags)
CXXFLAGS=$(shell pkg-config oehost-$(CXX_COMPILER) --cflags)
LDFLAGS=$(shell pkg-config oehost-$(COMPILER) --libs)
INCDIR=$(shell pkg-config oehost-$(COMPILER) --variable=includedir)

build:
	@ echo "Compilers used: $(CC), $(CXX)"
	oeedger8r ../game.edl --untrusted \
		--search-path $(INCDIR) \
		--search-path $(INCDIR)/openenclave/edl/sgx
	$(CXX) -g -c $(CXXFLAGS) host.cpp
	$(CC) -g -c $(CFLAGS) game_u.c
	$(CXX) -o game_host game_u.o host.o $(LDFLAGS)

clean:
	rm -f game_host host.o game_u.o game_u.c game_u.h game_args.h
