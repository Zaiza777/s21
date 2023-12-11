//
// Created by Astraeus Admiral on 5/26/22.
//

#ifndef BUILDS_ECBQBVNO_0_STUDENTS_DO6_CICD_ID_356283_ASTRAEUS_STUDENT_21_SCHOOL_RU_DO6_CICD_0_SRC_CAT_S21_CAT_H_
#define BUILDS_ECBQBVNO_0_STUDENTS_DO6_CICD_ID_356283_ASTRAEUS_STUDENT_21_SCHOOL_RU_DO6_CICD_0_SRC_CAT_S21_CAT_H_

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int noEmptyStringNum;  //  flag B
    int NumericInt;        //  Flag N
    int dollar;
    int deleteEmtpyString;
    int Flag_ForDeleteEmptyString_;
    int TabChangeOnChar_;
    int Flag_V;
} flags;

// Основные
void changePerenosOnDollar(char *ptr);

void s21CatJobWithGetString(FILE *filename, flags *Param, int *q);

// Доп функции обработки
void lineProcessing(char *ch, int *q, flags *Param);
void getFlags(int argc, char *argv[], flags *flags, char **name);

char *tabChangeOnCharFunc(char *ch);
int readFile(char *ch, FILE *fp);
void functionWorkWithV(char ch[1024], flags *Param);

#define ASCII_TABLE {"^@", "^A", "^B", "^C", "^D",           \
                     "^E", "^F", "^G", "^H", "\t",           \
                     "\n", "^K", "^L", "^M", "^N",           \
                     "^O", "^P", "^Q", "^R", "^S",           \
                     "^T", "^U", "^V", "^W", "^X",           \
                     "^Y", "^Z", "^[", "^\\", "^]",          \
                     "^^", "^_", " ", "!", "\"",             \
                     "#", "$", "%", "&", "'",                \
                     "(", ")", "*", "+", ",",                \
                     "-", ".", "/", "0", "1",                \
                     "2", "3", "4", "5", "6",                \
                     "7", "8", "9", ":", ";",                \
                     "<", "=", ">", "?", "@",                \
                     "A", "B", "C", "D", "E",                \
                     "F", "G", "H", "I", "J",                \
                     "K", "L", "M", "N", "O",                \
                     "P", "Q", "R", "S", "T",                \
                     "U", "V", "W", "X", "Y",                \
                     "Z", "[", "\\", "]", "^",               \
                     "_", "`", "a", "b", "c",                \
                     "d", "e", "f", "g", "h",                \
                     "i", "j", "k", "l", "m",                \
                     "n", "o", "p", "q", "r",                \
                     "s", "t", "u", "v", "w",                \
                     "x", "y", "z", "{", "|",                \
                     "}", "~", "^?", "M-^@", "M-^A",         \
                     "M-^B", "M-^C", "M-^D", "M-^E", "M-^F", \
                     "M-^G", "M-^H", "M-^I", "M-^J", "M-^K", \
                     "M-^L", "M-^M", "M-^N", "M-^O", "M-^P", \
                     "M-^Q", "M-^R", "M-^S", "M-^T", "M-^U", \
                     "M-^V", "M-^W", "M-^X", "M-^Y", "M-^Z", \
                     "M-^[", "M-^\\", "M-^]", "M-^^", "M-^_"};

#endif  //  BUILDS_ECBQBVNO_0_STUDENTS_DO6_CICD_ID_356283_ASTRAEUS_STUDENT_21_SCHOOL_RU_DO6_CICD_0_SRC_CAT_S21_CAT_H_
