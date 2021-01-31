#!/usr/bin/env python
import sys
import os.path

if __name__ == "__main__": 
    print ("UName Gen takes a list of first and last names and creates common usernames from them.")
    print("Check for the file 'unames.txt' after completion.")
    if len(sys.argv) != 2:
        print("usage: {} names.txt".format((sys.argv[0])))
        sys.exit(0)

    if not os.path.exists(sys.argv[1]): 
        print("{} not found".format(sys.argv[1]))
        sys.exit(0)
    
    print("Generating names...")
    for line in open(sys.argv[1]):
        name = ''.join([c for c in line if  c == " " or  c.isalpha()])

        tokens = name.lower().split()

        # skip empty lines
        if len(tokens) < 1: 
            continue
        f = open("unames.txt", "a")
        fname = tokens[0]
        lname = tokens[-1]

        f.write(fname + lname + '\n')           # johndoe
        f.write(lname + fname + '\n')           # doejohn
        f.write(fname + "." + lname + '\n')     # john.doe
        f.write(lname + "." + fname + '\n')     # doe.john
        f.write(lname + fname[0] + '\n')        # doej
        f.write(fname[0] + lname + '\n')        # jdoe
        f.write(lname[0] + fname + '\n')        # djoe
        f.write(fname[0] + "." + lname+ '\n')  # j.doe
        f.write(lname[0] + "." + fname+ '\n')  # d.john
        f.write(fname + '\n')                   # john
        f.write(lname + '\n')                   # joe
    
    print("Check unames.txt")    
    f.close()
    
