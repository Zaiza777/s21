CC=gcc
FLAGS=-Wall -Werror -Wextra -std=c11 -D_GNU_SOURCE
LOG=log.txt

all:s21_grep s21_cat

s21_cat:
	$(CC) $(FLAGS) ./cat/s21_cat.c -o ./cat/s21_cat
	chmod +x ./cat/s21_cat

clean:
	rm -rf ./cat/s21_cat ./cat/catTest/s21_cat ./cat/catTest/log.txt ./grep/s21_grep ./grep/t1 ./grep/t2

test:testCpplint s21_grep_test s21_cat_test clean

s21_cat_test: s21_cat
	cp ./cat/s21_cat ./cat/catTest/.
	cd ./cat/catTest/
	chmod +x catTest.sh
	./catTest.sh

s21_grep_test:
	./grepTest.sh

testCpplint:
	python3 ../materials/linters/cpplint.py */*.c */*.h *.c *.h
	rm -rf ./CPPLINT.cfg

s21_grep:
	$(CC) $(FLAGS) grep/s21_grep.c -o grep/s21_grep $(shell pcre-config --libs-posix)
	chmod +x grep/s21_grep


