#!/bin/python3

import re
import os
import ast #ast.literal_eval(string_to_change_to_dictionary)
from matplotlib import pyplot as plt
import numpy as np

# data saved, list_dicts[0][dict_num][element]
# show todays data on graph

### VARIABLES
#
file_name = "selfasses_data.txt"
date = os.popen('date | awk \'{print $3" "$2" "$1" "}\' | tr -d "\n" ').read()

### ARRAYS
# key map
key_map = [-3, -2, -1, 0,  1,  2, 3]
# 7 values
arr_dep = ['depressed', 'sad', 'meloncoly', 'ok', 'calm', 'happy', 'confident']
arr_anx = ['terror', 'psychosis', 'anxiety', '  ok', 'calm', 'peace', 'tranquility']
arr_gen = ['horriffic', 'bad', 'down', 'ok', 'calm', 'happy', 'joyous']
arr_ang = ['furious', 'angry', 'bothered', 'ok', 'calm', 'peaceful', 'great']
arr_wei = ['whale', 'fat', 'chubby', 'normal', 'skinny', 'cut', 'built'] # SEPERATE
# 3 values
arr_sun = ['none', ' ', ' ', 'hour-', ' ', ' ', 'hour+'] #\
arr_sle = ['bad', ' ', ' ', 'ok', ' ', ' ', 'great']	 # \_arrays 3 val
arr_foo = ['bad', ' ', ' ', 'ok', ' ', ' ', 'great']     # /
arr_exr = ['overki', ' ', ' ', 'none', ' ', ' ', 'some'] #/
# catagories
arr_cat = ['depression', 'anxiety', 'general', 'anger', 'weight', 'sun', 'sleep', 'food', 'exercise']
# create dictionaries with key map & values
dic_ang = dict(zip(key_map, arr_ang)) #\
dic_gen = dict(zip(key_map, arr_gen)) # \
dic_anx = dict(zip(key_map, arr_anx)) #  \
dic_dep = dict(zip(key_map, arr_dep)) #   \
dic_wei = dict(zip(key_map, arr_wei)) #    > - dictionarys
dic_sun = dict(zip(key_map, arr_sun)) #   /
dic_sle = dict(zip(key_map, arr_sle)) #  /
dic_foo = dict(zip(key_map, arr_foo)) # /
dic_exr = dict(zip(key_map, arr_exr)) #/
# list of dictionaries
lis_dic = [dic_dep, dic_anx, dic_gen, dic_ang, dic_wei, dic_sun, dic_sle, dic_foo, dic_exr]

### FUNCTIONS
#

def remove_(i):
	i = re.sub(r"[\(\'\"\\\")", "", str(i))[:-3]
	print(i.strip())
	return i

def clear():
#{
	os.system('clear')
#}  clear(0)

def get_key(dictionary, value): #tested, works. use with file_readline()
#{
	for item in dictionary:
		if dictionary[item] == value:
			return item
#}  get_key(2)

## GRAPH FUNCTIONS

def today_graph(list_dict):
#{
	plt.plot(range(len(list_dict[0])), list(list_dict[0].values()))
	plt.xticks(range(len(list_dict[0])), list(list_dict[0].keys()))
	plt.grid()
	plt.show()
#}  today_graph(1)

def cat_graph(cat):
#{
	catagory = cat # ask for catagory
	cat_data = catagory_data(catagory)
	plt.plot(range(len(cat_data)), cat_data)
	plt.title(catagory)
	plt.grid()
	plt.show()
#}  cat_graph():


## BASIC FILE FUNCTIONS

def file_create(): # tested, works
#{
	with open(file_name,'w') as fn:
		os.system('chmod 755 ' + file_name)
#}  file_create(0)

def file_write(dict_values): #tested, works
#{
	with open(file_name,'a') as fn:
		fn.write(str(dict_values) + "\n")
#}  file_write(1)

def check_lines():
#{
	arr_line = []
	with open(file_name,'r') as fn:
		for line in fn:
			line = eval(line)
			arr_line.append([line])
	return arr_line
#}  file_readline(0)

def file_data():
#{
	arr_line = []
	dict_line = []

	with open(file_name,'r') as fn:
		for line in fn:
			line = eval(line)
			arr_line.insert(0, [line])
			del arr_line[0][0][0] #removes date position, #3 lists deep

		for i in arr_line:
			for m in i:
				dict_line.append(dict(zip(arr_cat, m)))

		return dict_line # returns list of dictionaries
#}  file_data(0)

def today_data():
#{
	list_of_data
	data = file_data()
	last = data[0]
	for element in last:
		list_of_data.append(element)

	return list_of_data # returns list of todays data
#}  today_data(0)

def catagory_data(cat):
#{
	list_of_values = []
	data = file_data()
	for dictionary_obj in data:
		list_of_values.append(dictionary_obj.get(cat))

	return list_of_values # [0, -1, 1, 0, 3] data from each day (cata)
#}  catagory_data(1)

## FILE DATA FUNCTIONS

def average_of_day(list1):
#{
	return int(sum(list1)/len(list1))
#}

## MAIN, && MENUS

def menu():
#{
	while True:
		clear()
		user_input = input('''

------------------------------------------
                MAIN MENU
------------------------------------------
 A.) Today   B.) Data (cata)

 C.) Raw Data (all)

 type EXIT to quite
-------------------------------------------

	''')
		user_input = user_input.upper()
		if user_input == "A":
			today_graph(file_data())

		elif user_input == "B":
			# data by catagory
			os.system('clear')
			print(" {obj1:^9} {obj2:^9} {obj3:^9} {obj4:^9} {obj5:^9} {obj6:^9} {obj7:^9} ".format(obj1=arr_cat[0],
obj2=arr_cat[1], obj3=arr_cat[2], obj4=arr_cat[3],
obj5=arr_cat[4], obj6=arr_cat[5], obj7=arr_cat[6],
obj8=arr_cat[7], obj9=arr_cat[8]))
			catagory = input("type name of catagory> ")
			cat_graph(catagory.lower())

		elif user_input == "C":
			input(file_data())

		elif user_input == "EXIT":
			clear()
			exit()
		else:
			print(f'Error: the item you chose is not available\nplease try again')
			input('')
#}  menu(0)


def Input_Menu():
#{
	# have you input data today?
	object = check_lines()
	for i in object:
		if date in i[0]: 	# [0] location of substring
			print('data for today already added')
			input('')
			menu()
	iter = 0
	store_input = []
	for catagory in arr_cat:
		clear()
		user_input = input("""

----------------------------------------------------------------------
                               {title}
----------------------------------------------------------------------
 {num1:^9} {num2:^9} {num3:^9} {num4:^9} {num5:^9} {num6:^9} {num7:^9}
 {obj1:^9} {obj2:^9} {obj3:^9} {obj4:^9} {obj5:^9} {obj6:^9} {obj7:^9}

""".format(title=catagory, obj1=lis_dic[iter][-3],
obj2=lis_dic[iter][-2], obj3=lis_dic[iter][-1], obj4=lis_dic[iter][0],
obj5=lis_dic[iter][1], obj6=lis_dic[iter][2], obj7=lis_dic[iter][3],
num1='-3', num2='-2', num3='-1', num4='0', num5='1', num6='2', num7='3' ))
		store_input.append(int(user_input)) # adding selected option to list
		selection = int(store_input[iter])
		if (selection in key_map):
			iter += 1
		else:
			input('Error: incorrect data entered')
			menu()
	print(store_input.insert(0, date))  # store date in array
	file_write(store_input)     # store array in file
#}  Input_Menu(0)


##################
catagory_data("depression")

def main(): # MAIN
#{
	check_exist = os.path.exists(file_name)
	if str(check_exist).upper() == 'FALSE':
		file_create(file_1)
	Input_Menu()
	menu()
#}  main(0)

### start_SELFASSES.py ###
main()

