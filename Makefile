CXX=gcc

SANITY_FLAGS=-Wall -Wextra -Werror -fstack-protector-all -pedantic -Wno-unused -Wfloat-equal -Wshadow -Wpointer-arith -Wformat=2
CXXFLAGS_GENERIC=-std=c99 -O2 $(SANITY_FLAGS)
CXXFLAGS_LINK=-lm -fopenmp
CXXFLAGS_SANDY_BRIDGE    = -DTEST_NAME="\"Sandy Bridge - 256 bits (No FMA) \"" -DAVX_256_3_NOFMA -march=sandybridge    $(CXXFLAGS_GENERIC)
CXXFLAGS_IVY_BRIDGE      = -DTEST_NAME="\"Ivy Bridge - 256 bits (No FMA)\""    -DAVX_256_3_NOFMA -march=ivybridge      $(CXXFLAGS_GENERIC)
CXXFLAGS_HASWELL         = -DTEST_NAME="\"Haswell - 256 bits\""                -DAVX_256_10      -march=haswell        $(CXXFLAGS_GENERIC)
CXXFLAGS_SKYLAKE         = -DTEST_NAME="\"Skylake - 256 bits\""                -DAVX_256_8       -march=skylake        $(CXXFLAGS_GENERIC)
CXXFLAGS_BROADWELL       = -DTEST_NAME="\"Broadwell - 256 bits\""              -DAVX_256_8       -march=broadwell      $(CXXFLAGS_GENERIC)
CXXFLAGS_KABY_LAKE       = -DTEST_NAME="\"Kaby Lake - 256 bits\""              -DAVX_256_10      -march=skylake        $(CXXFLAGS_GENERIC)
CXXFLAGS_COFFE_LAKE      = -DTEST_NAME="\"Coffe Lake - 256 bits\""             -DAVX_256_10      -march=skylake        $(CXXFLAGS_GENERIC)
CXXFLAGS_CANNON_LAKE_256 = -DTEST_NAME="\"Cannon Lake - 256 bits\""            -DAVX_256_10      -march=cannonlake     $(CXXFLAGS_GENERIC)
CXXFLAGS_CANNON_LAKE_512 = -DTEST_NAME="\"Cannon Lake - 512 bits\""            -DAVX_256_10      -march=cannonlake     $(CXXFLAGS_GENERIC)
CXXFLAGS_ICE_LAKE_256    = -DTEST_NAME="\"Ice Lake - 256 bits\""               -DAVX_256_10      -march=icelake-client $(CXXFLAGS_GENERIC)
CXXFLAGS_ICE_LAKE_512    = -DTEST_NAME="\"Ice Lake - 512 bits\""               -DAVX_256_10      -march=icelake-server $(CXXFLAGS_GENERIC)
CXXFLAGS_KNL             = -DTEST_NAME="\"KNL - 512 bits\""                    -DAVX_512_12      -march=knl            $(CXXFLAGS_GENERIC)
CXXFLAGS_ZEN             = -DTEST_NAME="\"ZEN  - 256 bits\""                   -DAVX_256_10      -march=znver1         $(CXXFLAGS_GENERIC)
CXXFLAGS_ZEN_PLUS        = -DTEST_NAME="\"ZEN+ - 256 bits\""                   -DAVX_256_10      -march=znver1         $(CXXFLAGS_GENERIC)

ARCH_DIR=Arch
MAIN=main.c getarg.c cpufetch.c

SANDY_BRIDGE=$(ARCH_DIR)/256_3_nofma.c
SANDY_BRIDGE_HEADERS=$(ARCH_DIR)/256_3_nofma.h $(ARCH_DIR)/Arch.h

IVY_BRIDGE=$(ARCH_DIR)/256_3_nofma.c
IVY_BRIDGE_HEADERS=$(ARCH_DIR)/256_3_nofma.h $(ARCH_DIR)/Arch.h

HASWELL=$(ARCH_DIR)/256_10.c
HASWELL_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

SKYLAKE=$(ARCH_DIR)/256_8.c
SKYLAKE_HEADERS=$(ARCH_DIR)/256_8.h $(ARCH_DIR)/Arch.h

BROADWELL=$(ARCH_DIR)/256_8.c
BROADWELL_HEADERS=$(ARCH_DIR)/256_8.h $(ARCH_DIR)/Arch.h

KABY_LAKE=$(ARCH_DIR)/256_10.c
KABY_LAKE_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

COFFE_LAKE=$(ARCH_DIR)/256_10.c
COFFE_LAKE_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

CANNON_LAKE_256=$(ARCH_DIR)/256_10.c
CANNON_LAKE_256_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

CANNON_LAKE_512=$(ARCH_DIR)/256_10.c
CANNON_LAKE_512_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

ICE_LAKE_256=$(ARCH_DIR)/256_10.c
ICE_LAKE_256_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

ICE_LAKE_512=$(ARCH_DIR)/256_10.c
ICE_LAKE_512_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

KNL=$(ARCH_DIR)/512_12.c
KNL_HEADERS=$(ARCH_DIR)/512_12.h $(ARCH_DIR)/Arch.h

ZEN=$(ARCH_DIR)/256_10.c
ZEN_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

ZEN_PLUS=$(ARCH_DIR)/256_10.c
ZEN_PLUS_HEADERS=$(ARCH_DIR)/256_10.h $(ARCH_DIR)/Arch.h

OUTPUT_DIR=output
$(shell mkdir -p $(OUTPUT_DIR))

# INTEL #
OUTPUT_SANDY_BRIDGE=$(OUTPUT_DIR)/sandy_bridge
OUTPUT_IVY_BRIDGE=$(OUTPUT_DIR)/ivy_bridge
OUTPUT_HASWELL=$(OUTPUT_DIR)/haswell
OUTPUT_SKYLAKE=$(OUTPUT_DIR)/skylake
OUTPUT_BROADWELL=$(OUTPUT_DIR)/broadwell
OUTPUT_KABY_LAKE=$(OUTPUT_DIR)/kaby_lake
OUTPUT_COFFE_LAKE=$(OUTPUT_DIR)/coffe_lake
OUTPUT_CANNON_LAKE_256=$(OUTPUT_DIR)/cannon_lake_256
OUTPUT_CANNON_LAKE_512=$(OUTPUT_DIR)/cannon_lake_512
OUTPUT_ICE_LAKE_256=$(OUTPUT_DIR)/ice_lake_256
OUTPUT_ICE_LAKE_512=$(OUTPUT_DIR)/ice_lake_512
OUTPUT_KNL=$(OUTPUT_DIR)/knl

# AMD #
OUTPUT_ZEN=$(OUTPUT_DIR)/zen
OUTPUT_ZEN_PLUS=$(OUTPUT_DIR)/zen_plus

all: $(OUTPUT_SANDY_BRIDGE) $(OUTPUT_IVY_BRIDGE) $(OUTPUT_HASWELL) $(OUTPUT_SKYLAKE) $(OUTPUT_BROADWELL) $(OUTPUT_KABY_LAKE) $(OUTPUT_COFFE_LAKE) $(OUTPUT_CANNON_LAKE_256) $(OUTPUT_CANNON_LAKE_512) $(OUTPUT_ICE_LAKE_256) $(OUTPUT_ICE_LAKE_512) $(OUTPUT_KNL) $(OUTPUT_ZEN) $(OUTPUT_ZEN_PLUS)

$(OUTPUT_SANDY_BRIDGE): Makefile $(MAIN) $(SANDY_BRIDGE) $(SANDY_BRIDGE_HEADERS)
	$(CXX) $(CXXFLAGS_SANDY_BRIDGE) $(MAIN) $(SANDY_BRIDGE) $(CXXFLAGS_LINK) -o $@

$(OUTPUT_IVY_BRIDGE): Makefile $(MAIN) $(IVY_BRIDGE) $(IVY_BRIDGE_HEADERS)
	$(CXX) $(CXXFLAGS_IVY_BRIDGE) $(MAIN) $(IVY_BRIDGE) $(CXXFLAGS_LINK) -o $@

$(OUTPUT_HASWELL): Makefile $(MAIN) $(HASWELL) $(HASWELL_HEADERS)
	$(CXX) $(CXXFLAGS_HASWELL) $(MAIN) $(HASWELL) $(CXXFLAGS_LINK) -o $@

$(OUTPUT_SKYLAKE): Makefile $(MAIN) $(SKYLAKE) $(SKYLAKE_HEADERS)
	$(CXX) $(CXXFLAGS_SKYLAKE) $(MAIN) $(SKYLAKE) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_BROADWELL): Makefile $(MAIN) $(BROADWELL) $(BROADWELL_HEADERS)
	$(CXX) $(CXXFLAGS_BROADWELL) $(MAIN) $(BROADWELL) $(CXXFLAGS_LINK) -o $@	
	
$(OUTPUT_KABY_LAKE): Makefile $(MAIN) $(KABY_LAKE) $(KABY_LAKE_HEADERS)
	$(CXX) $(CXXFLAGS_KABY_LAKE) $(MAIN) $(KABY_LAKE) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_COFFE_LAKE): Makefile $(MAIN) $(COFFE_LAKE) $(COFFE_LAKE_HEADERS)
	$(CXX) $(CXXFLAGS_HASWELL) $(MAIN) $(COFFE_LAKE) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_CANNON_LAKE_256): Makefile $(MAIN) $(CANNON_LAKE_256) $(CANNON_LAKE_256_HEADERS)
	$(CXX) $(CXXFLAGS_CANNON_LAKE_256) $(MAIN) $(CANNON_LAKE_256) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_CANNON_LAKE_512): Makefile $(MAIN) $(CANNON_LAKE_512) $(CANNON_LAKE_512_HEADERS)
	$(CXX) $(CXXFLAGS_CANNON_LAKE_512) $(MAIN) $(CANNON_LAKE_512) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_ICE_LAKE_256): Makefile $(MAIN) $(ICE_LAKE_256) $(ICE_LAKE_256_HEADERS)
	$(CXX) $(CXXFLAGS_ICE_LAKE_256) $(MAIN) $(ICE_LAKE_256) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_ICE_LAKE_512): Makefile $(MAIN) $(ICE_LAKE_512) $(ICE_LAKE_512_HEADERS)
	$(CXX) $(CXXFLAGS_ICE_LAKE_512) $(MAIN) $(ICE_LAKE_512) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_KNL): Makefile $(MAIN) $(KNL) $(KNL_HEADERS)
	$(CXX) $(CXXFLAGS_KNL) $(MAIN) $(KNL) $(CXXFLAGS_LINK) -o $@
	
$(OUTPUT_ZEN): Makefile $(MAIN) $(ZEN) $(ZEN_HEADERS)
	$(CXX) $(CXXFLAGS_ZEN) $(MAIN) $(ZEN) $(CXXFLAGS_LINK) -o $@

$(OUTPUT_ZEN_PLUS): Makefile $(MAIN) $(ZEN_PLUS) $(ZEN_PLUS_HEADERS)
	$(CXX) $(CXXFLAGS_ZEN_PLUS) $(MAIN) $(ZEN_PLUS) $(CXXFLAGS_LINK) -o $@

clean:
	@rm $(OUTPUT_DIR)/*
