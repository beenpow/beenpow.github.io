import os
import glob
import fileinput
basePath = "/Users/brad13/beenpow.github.io/**/*.*"

for file in glob.glob(basePath, recursive=True):
	if file.endswith('.md'):
		print(file)
		
		with fileinput.input(file, inplace = True) as f:
			for line in f:
				if line.startswith("header-img"):
					print('header-img: ""', end = '\n')
#print('header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"', end = '\n')
				else:
					print(line, end = '')
