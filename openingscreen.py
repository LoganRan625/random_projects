#!/usr/bin/python3
import os
import curses
import time
# centers text using curses

def main(stdscr):
    curses.curs_set(0)
    h, w = stdscr.getmaxyx()
    text = "OPENING SCREEN"
    x_center = w//2 - len(text)//2
    y_center = h//2
    stdscr.addstr(y_center, x_center, text)
    stdscr.refresh()
    time.sleep(4)
    os.system("clear")

def menu():
    os.system("bash /MainMenu.sh")

curses.wrapper(main)
menu()
