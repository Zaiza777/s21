//
// Created by Astraeus Admiral on 6/1/22.
//

#ifndef BUILDS_ECBQBVNO_0_STUDENTS_DO6_CICD_ID_356283_ASTRAEUS_STUDENT_21_SCHOOL_RU_DO6_CICD_0_SRC_GREP_S21_GREP_H_
#define BUILDS_ECBQBVNO_0_STUDENTS_DO6_CICD_ID_356283_ASTRAEUS_STUDENT_21_SCHOOL_RU_DO6_CICD_0_SRC_GREP_S21_GREP_H_

#include <errno.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int flagE_Template;
    char ptrE_Template[1024];

    int flagI_Ignore;
    int flagV_Invert;

    int flagC_CountEcuale;
    int flagForC;

    int flagL_EcualeFile;
    int flagForL;

    int flagN_NumberWithFile;
    int flagH_NameFile;
    int flagS_IgnoreErrorEmptyFile;
    int flagF_RegexFromFile;
    int flagO;

    int flagO_NoEmptyString;

    char *filename[2056];

    int probel;
    char *temp;
} flags;

typedef struct {
    int countStr;
    int countEcualeStr;
} countStrU;

void openfileRegex(flags *FL, char *name);
void outputEcualeAndFileName(flags *FL, countStrU *SC, char *filename, int rc);
void outputResult(flags *flag, int rc, char *line, countStrU *StrCount, char *filename);
void ownWork(flags *flags);
void openFile(flags *flags);
void workWithRegex(flags *flags, FILE *fp, char *filename);
void getFlags(int argc, char *argv[], flags *flags);
#endif  //  BUILDS_ECBQBVNO_0_STUDENTS_DO6_CICD_ID_356283_ASTRAEUS_STUDENT_21_SCHOOL_RU_DO6_CICD_0_SRC_GREP_S21_GREP_H_
