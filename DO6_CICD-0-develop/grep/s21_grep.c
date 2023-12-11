#include "s21_grep.h"
#include <pcre.h>

int main(int argc, char *argv[]) {
  flags Flag = {};

  getFlags(argc, argv, &Flag);

  openFile(&Flag);

  return 0;
}

// OUTPUT FILE

void openFile(flags *flags) {
  FILE *fp;
  for (int i = 0; flags->filename[i]; i++) {
    if ((fp = fopen(flags->filename[i], "r")) != NULL) {
      workWithRegex(flags, fp, flags->filename[i]);
      fclose(fp);
    } else if (flags->flagS_IgnoreErrorEmptyFile == 0) {
      printf("s21_grep: %s:%s\n", flags->filename[i], strerror(errno));
    }}
}

void workWithRegex(flags *flags, FILE *fp, char *filename) {
  char *line = NULL, *lastLine = "\n", lastChar = '\0', i = 0;
  const char *error;
  int erroroffset = 0, rc = 0, vector[50] = {0}, vecsize = 50;
  size_t lenLine = 0;
  countStrU SC = {};
  pcre *re = pcre_compile(flags->ptrE_Template, flags->flagI_Ignore ? PCRE_CASELESS : 0, \
                                                                      &error, &erroroffset, 0);
  while (!feof(fp)) {
    getline(&line, &lenLine, fp);

    rc = pcre_exec(re, 0, line, (int) strlen(line), 0, 0, vector, vecsize);

    if (lastChar == '\n' && *line == '\0') break;
    if (rc >= 0) {
      i = 1;
      lastLine = strchr(lastLine, '\n');
      SC.countEcualeStr++;
    }
    SC.countStr++;
    if (!flags->flagL_EcualeFile && !flags->flagC_CountEcuale) outputResult(flags, rc, line, &SC, filename);
    if (lastLine != NULL) lastChar = *lastLine;
  }
  if (flags->flagL_EcualeFile || flags->flagC_CountEcuale) outputEcualeAndFileName(flags, &SC, filename, i);

  pcre_free(re);
  if (line != NULL) free(line);
  line = NULL;
}

//! Вывод для L или C флагов
void outputEcualeAndFileName(flags *FL, countStrU *SC, char *filename, int rc) {
  int len = FL->flagV_Invert ? SC->countStr - SC->countEcualeStr : SC->countEcualeStr;
  if (FL->flagL_EcualeFile && len >= 2) len = 1;
  if (FL->flagC_CountEcuale) {
    if (!FL->flagH_NameFile) printf("%s:", filename);
    printf("%d\n", len);
  }
  if (rc <= 0 && FL->flagV_Invert) rc = 1;
  if (FL->flagL_EcualeFile == 1 && rc >= 1 && len != 0) {
    printf("%s\n", filename);
  }
}

//! Вывод для содержимого строки
void outputResult(flags *flag, int rc, char *line, countStrU *StrCount, char *filename) {
  if (*line != '\0' && ((rc >= 1 && !flag->flagV_Invert) || (rc <= -1 && flag->flagV_Invert))) {
    if (flag->filename[1] != NULL && !flag->flagH_NameFile) printf("%s:", filename);
    if (flag->flagN_NumberWithFile) printf("%d:", StrCount->countStr);
    printf("%s", line);
    if (strchr(line, '\n') == NULL) printf("\n");
  }
}

void getFlags(int argc, char *argv[], flags *flag) {
  int opt, countFilename = 0;
  char temp[2046] = {'\0'};
  while ((opt = getopt_long(argc, argv, "e:f:ivclnhso", NULL, NULL)) != EOF) {
    switch (opt) {
      case 'e':
        strcpy(temp, flag->ptrE_Template);
        sprintf(flag->ptrE_Template, "%s%s%s", temp,
                                                !flag->ptrE_Template[0] ? "" : "|", optarg);
        flag->flagE_Template = 1;
        break;
      case 'i':flag->flagI_Ignore = 1;
        break;
      case 'v':flag->flagV_Invert = 1;
        break;
      case 'c':flag->flagC_CountEcuale = 1;
        break;
      case 'l':flag->flagL_EcualeFile = 1;
        break;
      case 'n':flag->flagN_NumberWithFile = 1;
        break;
      case 'h':flag->flagH_NameFile = 1;
        break;
      case 's':flag->flagS_IgnoreErrorEmptyFile = 1;
        break;
      case 'f':
        openfileRegex(flag, optarg);
        flag->flagF_RegexFromFile = 1;
        break;
      case 'o':flag->flagO_NoEmptyString = 1;
        break;
      default:printf("No math\n");
    }
  }
  !flag->flagE_Template && !flag->flagF_RegexFromFile ? \
                            sprintf(flag->ptrE_Template, "%s", argv[optind++]) : 0;
  for (int i = optind; i < argc; i++) flag->filename[countFilename++] = &argv[i][0];
}

//        Flag - F Regular From File     \\;
void openfileRegex(flags *FL, char *name) {
  FILE *FP = NULL;
  FP = fopen(name, "r");
  char *line = NULL, *ptr = NULL;
  size_t lenLine = 0;
  char temp[1048] = {'\0'};

  if (FP != NULL) {
    getline(&line, &lenLine, FP);
    if ((ptr = strchr(line, '\n')) != NULL) *ptr = '\0';
    if (*line != '\0') {
      strcpy(temp, FL->ptrE_Template);
      sprintf(FL->ptrE_Template, "%s%s%s", temp, !FL->ptrE_Template[0] ? "" : "|", line);
    }
    fclose(FP);
    if (line != NULL) free(line);
  }
}
