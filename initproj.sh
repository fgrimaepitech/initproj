#!/bin/bash

#Script init project for Epitech.
#Made by Florian Grima.


var=$1
varnb=$#

function make_folder() {
    CYAN='\033[0;36m'
    NC='\033[0m'
    loading
    mkdir src
    printf "Directory ${CYAN}src${NC} created\n"
    mkdir includes
    printf "Directory ${CYAN}includes${NC} created\n"
    touch includes/my.h
    printf "File      ${CYAN}includes/my.h${NC} created\n"
    echo -e "/*\n** EPITECH PROJECT, 2021\n** my.h\n** File description:\n** my.h\n*/\n\n#ifndef MY_H\n#define MY_H\n\n#endif" > includes/my.h
    touch Makefile
    printf "File      ${CYAN}Makefile${NC} created\n"
    echo -e "##\n## EPITECH PROJECT, 2021\n## makefile\n## File description:\n## makefile\n##\n\nSRC = \$(shell find src/*.c)\n\nNAME = $var\n\nall: \$(NAME)\n\n\$(NAME):\n			gcc \$(SRC) -o \$(NAME)\n\nclean:\n			rm \$(NAME)\n\nfclean:\n			rm \$(NAME)\n\nre: clean\n     make all" > Makefile
    touch src/"$var.c"
    printf "File      ${CYAN}"$var.c"${NC} created\n"
    echo -e "/*\n** EPITECH PROJECT, 2021\n** $var\n** File description:\n** $var\n*/\n\n#include" '"includes/my.h"' > src/"$var.c"
    return 1
}

function clear() {
    CYAN='\033[0;31m'
    NC='\033[0m'
    rm -rf Makefile
    rm -rf includes
    rm -rf src
    printf "Directory ${CYAN}src${NC} deleted\n"
    printf "Directory ${CYAN}includes${NC} deleted\n"
    printf "File      ${CYAN}Makefile${NC} deleted\n"
}

function loading() {
    echo "Waiting"
    while :; do
      for (( i=0; i<7; i++ )); do
        sleep 0.3
        echo -n "."
      done
      echo -e "\n"
      break
    done
}

function help_msg() {
    CYAN='\033[0;36m'
    NC='\033[0m'
    printf "USAGE\n        initproj [-OPTIONS] ${CYAN}PROJECT_NAME${NC}\n"
    printf "OPTIONS\n        ${CYAN}-h${NC} help for commands\n"
    printf "        ${CYAN}-c${NC} clean your project\n"
    printf "        ${CYAN}-i${NC} install initproj\n"
    printf "PROJECT_NAME\n        Your project's name\n"
}

function main() {
    if [ $varnb -eq 0 ]; then
        printf "initproj -h to help\n"
        return 0
    fi
    if [ $var = "-h" ]; then
        help_msg
        return 0
    fi
    if [ $var = "-c" ]; then
        clear
        return 0
    fi
    make_folder
}

main