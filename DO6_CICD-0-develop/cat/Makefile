CC=gcc
FLAGS=-Wall -Werror -Wextra -std=c11 -D_GNU_SOURCE

all: s21_cat

s21_cat:
	rm -rf ./s21_cat
	$(CC) $(FLAGS) s21_cat.c -o s21_cat
	chmod +x ./s21_cat

clean:
	rm -rf ../cat/s21_cat ../cat/catTest/s21_cat ../cat/catTest/log.txt ../grep/s21_grep ../grep/t1 ../grep/t2