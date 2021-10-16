#!/bin/sh

cmd_w_mode()
{
mode=$1
case "$mode" in
cbc*)
openssl aes-128-cbc  -d -K 000102030405060708090A0B0C0D0E0F -iv 01020304050607080807060504030201 < OUTPUT > RECOVERED_PLAIN
;;
cfb*)
openssl aes-128-cfb  -d -K 000102030405060708090A0B0C0D0E0F -iv 01020304050607080807060504030201 < OUTPUT > RECOVERED_PLAIN
;;
ctr*)
openssl aes-128-ctr  -d -K 000102030405060708090A0B0C0D0E0F -iv 01020304050607080807060504030201 < OUTPUT > RECOVERED_PLAIN
;;
*)
echo catch-all failure
;;
esac
}


rm -f a.out *.o *.exe OUTPUT NEW_PLAIN RECOVERED_PLAIN
for c in *.c
do
    s=$(echo $c | sed 's/.c$//')
    gcc -o $s.exe  -lcrypto $c
done

for e in *.exe
do
        rm -f OUTPUT NEW_PLAIN RECOVERED_PLAIN
	echo testing $e
	./$e \
	&& cmd_w_mode $e \
        && cmp INPUT NEW_PLAIN    \
        && cmp INPUT RECOVERED_PLAIN    \
	&& echo test ok on $e
done
