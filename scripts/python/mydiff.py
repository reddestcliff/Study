#!/usr/bin/env python

import os
import sys
#adding package according to script own folder
dirPath = os.path.dirname(os.path.realpath(__file__))
sys.path.append(os.path.join(dirPath,'package'))
import foldercompare
import filecmp


def main():
	print ' main '
	'''
	arg_left = os.path.normpath(sys.argv[1])
	arg_right = os.path.normpath(sys.argv[2])
	if len(sys.argv)!=3:
		arg_left, arg_right = arg_right, arg_left
	'''
	#debug
	arg_left = os.path.normpath(r'C:\Downloads\test1')
	arg_right = os.path.normpath(r'C:\Downloads\test2')
	
	arg_left = arg_left.replace('\\','/')
	arg_right = arg_right.replace('\\','/')		
	print(arg_left)
	print("\n---------------script started-----------------")
	print('  comparing pathes')
	print('\t' + repr(arg_left) + ' ' + repr(arg_right))
	
	report = foldercompare.compare(arg_left, arg_right)
	print(report)
	
	print('  left only files')
	for ifile in report['left']:
		left_file = arg_left + ifile[1::]
		print('\t' + repr(left_file))

	print('  right only files')
	for ifile in report['right']:
		right_file = arg_right + ifile[1::]
		print('\t' + repr(right_file))
		
	print('  different files')
	for ifile in report['both']:
		left_file = arg_left + ifile[1::]
		right_file = arg_right + ifile[1::]
		if not filecmp.cmp(left_file, right_file):
			print('\t' + repr(left_file) + repr(right_file))
			
	print("---------------script finished-----------------\n")
	
if __name__ == "__main__":
	main()

