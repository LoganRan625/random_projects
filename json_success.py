#!/bin/python3

# JSON TUTORIAL

import json as js

mydict = {
	"people": [
		{
			"name": "sam",
			"age": 28,
			"weight": 80
		},
		{
			"name": "john",
			"age": 22,
			"weight": 20
		},
		{
			"name": "kelly",
			"age": 30,
			"weight": 180
		}
	]
}

string = js.dumps(mydict, indent=4)

####################
## FILE FUNCTIONS ##

def _WRITE():
	with open('test.json', 'w') as f:
		f.write(string)

def _READ():
	with open('test.json', 'r') as f:
		data = js.loads(f.read())
		return data

####################


data = _READ()

def data_by_subject(sub):
	subject = []
	for dictionary in data['people']:
		subject.append(dictionary[sub])
	return subject

def data_by_dictionary(d_num):
	return data['people'][d_num]

def get_dictionary_from_value(value):
	iter = 0
	for i in data['people'][iter].values():
		if value == i:
			return data['people'][iter]
		iter += 1

specific = get_dictionary_from_value('sam')

#specific = data_subject_in_dictionary(0, 'name')

names = []
age = []
weight = []

all_names = data_by_subject('name')
all_ages = data_by_subject('age')
all_weight = data_by_subject('weight')

dict1 = data_by_dictionary(0)
dict2 = data_by_dictionary(1)
dict3 = data_by_dictionary(2)

print(str(all_names), str(all_ages), str(all_weight))
print(str(dict1) + "\n" + str(dict2) + "\n" + str(dict3))
print(str(specific))

