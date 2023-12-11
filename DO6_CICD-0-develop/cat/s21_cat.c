//
// Created by Astraeus Admiral on 5/26/22.
//

#include "s21_cat.h"

void changePerenosOnDollar(char *ptr) {
    size_t x = 0;
    while (ptr[x] != '\n') x++;
    if (ptr[x - 1] != '\0') {
        ptr[x++] = '$';
        ptr[x] = '\n';
    }
}
void lineProcessing(char *ch, int *q, flags *Param) {
    size_t k = 0;
    if (*ch != '\n') {
        if (Param->dollar) changePerenosOnDollar(ch);
        if (Param->noEmptyStringNum || Param->NumericInt) printf("%6d\t", (*q)++);
        if (Param->TabChangeOnChar_) ch = tabChangeOnCharFunc(ch);
        if (Param->Flag_V) {
            functionWorkWithV(ch, Param);
        } else {
            for (k = 0; ch[k] != '\n' && k <= 1000; k++) {
                if (ch[k] == '\0' && ch[k + 1] == '\n') break;
                printf("%c", ch[k]);
            }
        }
        if (ch[k] == '\n') printf("\n");
        Param->Flag_ForDeleteEmptyString_ = 0;
    } else if (Param->Flag_ForDeleteEmptyString_ == 0) {
        if (Param->dollar && Param->NumericInt)
            printf("%6d\t$", (*q)++);
        else if (Param->dollar && Param->NumericInt == 0)
            printf("$");
        else if (Param->dollar == 0 && Param->NumericInt)
            printf("%6d\t", (*q)++);
        printf("\n");
        if (Param->deleteEmtpyString) Param->Flag_ForDeleteEmptyString_++;
    }
}

char *tabChangeOnCharFunc(char *ch) {
    for (; (*ch != '\n' && *ch != '\0') && *ch == '\t'; ch++) printf("^I");
    return ch;
}
void functionWorkWithV(char ch[1024], flags *Param) {
    char *temp[200] = ASCII_TABLE int i;
    size_t k;

    for (k = 0; ch[k] != '\n' && k < 1000; k++) {
        i = (int)ch[k];
        if (i <= -97) {
            i *= -1;
            i = 256 - i;
        }
        if (Param->TabChangeOnChar_ && ch[k] == '\t')
            printf("^I");
        else if (i < 0)
            printf("%c", ch[k]);
        else if (i == 32)
            printf("%c", 32);
        else if (!(ch[k] == '\0' && ch[k + 1] == '\n'))
            printf("%s", temp[i]);
    }
    if (ch[k - 1] != '\0') printf("\n");
}

void s21CatJobWithGetString(FILE *filename, flags *Param, int *q) {
    char *ch = NULL;
    size_t sizeCh = 0, lenline;
#ifdef __APPLE__
    *q = 1;
#elif __linux__
    if (*q > 1) printf("\n");
#endif
    while (!feof(filename)) {
        if (getline(&ch, &sizeCh, filename) != -1) {
            for (lenline = 0; ch[lenline] != '\n'; lenline++) {
            }
            if (lenline == 0) lenline = 1;
            if (ch[lenline - 1] == '\0') {
                ch[lenline] = '\n';
                ch[lenline + 1] = '\0';
            }
            lineProcessing(ch, q, Param);
            for (size_t k = 0; k < sizeCh; k++) ch[k] = '\n';
        } else {
            if (ch != NULL) free(ch);
            ch = NULL;
        }
    }
    if (ch != NULL) free(ch);
    ch = NULL;
}

void getFlags(int argc, char *argv[], flags *flags, char **name) {
    int numFile = 0;
    for (int i = 1; i < argc; i++) {
        if (argv[i][0] == '-') {
            for (int q = 0; argv[i][q] != '\0'; q++) {
                if ((argv[i][q] == 'n' || strcmp(argv[i], "--number") == 0) && flags->noEmptyStringNum == 0) {
                    flags->NumericInt = 1;
                    if (argv[i][q] != 'n') break;
                } else if (argv[i][q] == 'b' || strcmp(argv[i], "--number-nonblank") == 0) {
                    flags->NumericInt = 0;
                    flags->noEmptyStringNum = 1;
                    if (argv[i][q] != 'b') break;
                } else if (argv[i][q] == 'e' || argv[i][q] == 'E') {
                    flags->dollar = 1;
                    if (argv[i][q] == 'e') flags->Flag_V = 1;
                } else if (argv[i][q] == 's' || strcmp(argv[i], "--squeeze-blank") == 0) {
                    flags->deleteEmtpyString = 1;
                    if (argv[i][q] != 's') break;
                } else if (argv[i][q] == 't' || argv[i][q] == 'T') {
                    flags->TabChangeOnChar_ = 1;
                    if (argv[i][q] == 't') flags->Flag_V = 1;
                } else if (argv[i][q] == 'v') {
                    flags->Flag_V = 1;
                }  //  else if (argv[i][q] != '-') {
                   // printf("cat: illegal option -- %c\nusage: cat [-benstuv] [file ...]", argv[i][q]);
                   //          exit(1);
                   //        }
            }
        } else {
            name[numFile++] = &argv[i][0];
        }
    }
}

int main(int argc, char *argv[]) {
    FILE *filename;
    char **name = (char **)calloc(999, sizeof(char *));
    flags Param = {};
    if (name != NULL) getFlags(argc, argv, &Param, name);
    int s = 1;

    for (int q = 0; name[q] && *name != NULL; q++) {
        if ((filename = fopen(name[q], "r")) == NULL) {
            printf("s21_cat: %s:%s\n", name[q], strerror(errno));
        } else {
            s21CatJobWithGetString(filename, &Param, &s);
        }
        if (filename != NULL) fclose(filename);
    }
    if (*name != NULL) free(name);
    return errno;
}
