CC=gcc
FLAGS=-Wall -Werror -Wextra -std=c11 -D_GNU_SOURCE

all:s21_grep

s21_grep:
	rm -rf ./s21_grep
	$(CC) $(FLAGS) ./s21_grep.c -o ./s21_grep $(shell pcre-config --libs-posix)
	chmod +x ./s21_grep


clean:
	rm -rf ../cat/s21_cat ../cat/catTest/s21_cat ../cat/catTest/log.txt ../grep/s21_grep ../grep/t1 ../grep/t2