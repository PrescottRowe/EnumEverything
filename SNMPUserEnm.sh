Oneliner:

# for user in $(cat user.txt); do echo VRFY $user |nc -nv -w 1 <ip> 25 2>/dev/null |grep ^"250";done
