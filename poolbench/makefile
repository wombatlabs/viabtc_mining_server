TARGET  := poolbench.exe
INCS = -I ../network -I ../utils
LIBS = -L ../utils -lutils -L ../network -lnetwork -Wl,-Bstatic -lev -lhiredis -ljansson -lcurl -lssl -lcrypto -Wl,-Bdynamic -ldl -lm  -lpthread -lz-lgssapi_krb5 -lldap -llber -lidn2 -lrtmp -lbrotlidec -lssh -lpsl -lnghttp2
include ../makefile.inc
