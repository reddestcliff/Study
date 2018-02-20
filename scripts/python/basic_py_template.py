#!/usr/bin/env python

import os
import sys
#adding package according to script own folder
dirPath = os.path.dirname(os.path.realpath(__file__))
sys.path.append(os.path.join(dirPath,'package'))



def main():
    print ' main '


if __name__ == "__main__":
    main()

