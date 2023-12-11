#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
TEST_FILE="bytes.txt"
TEST_FILE2="file"
TEST_FILE3="111.txt"
TEST_FILE4="222.txt"
echo /dev/null > log.txt
echo "Первый тест"

for var in -b -n -s #-E -T --number-nonblank --number --squeeze-blank
do
          TEST1="$var $TEST_FILE"
          TEST2="$var $TEST_FILE2"
          TEST3="$var $TEST_FILE3"
          TEST4="$var $TEST_FILE4"
#          echo "$TEST1"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
          fi

          # === TEST 2 ===
          ./s21_cat $TEST2 > s21_cat2.txt
          cat $TEST2 > cat2.txt
          DIFF_RES="$(diff -s s21_cat2.txt cat2.txt)"
          if [ "$DIFF_RES" == "Files s21_cat2.txt and cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
          fi

          # === TEST 3 ===
          ./s21_cat $TEST3 > s21_cat3.txt
          cat $TEST3 > cat3.txt
          DIFF_RES="$(diff -s s21_cat3.txt cat3.txt)"
          if [ "$DIFF_RES" == "Files s21_cat3.txt and cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> log.txt
              (( COUNTER_FAIL++ ))
          fi

          # === TEST 4 ===
          ./s21_cat $TEST4 > s21_cat4.txt
          cat $TEST4 > cat4.txt
          DIFF_RES="$(diff -s s21_cat4.txt cat4.txt)"
          if [ "$DIFF_RES" == "Files s21_cat4.txt and cat4.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST4" >> log.txt
              (( COUNTER_FAIL++ ))
          fi

          rm s21_cat*.txt cat*.txt
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"

