#!/bin/bash
try() {
  expected="$1"
  input="$2"

  ./9cc "$input" > ./tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

try 0 0
try 42 42
try 4 "3+2-1" 
try 20 "13 + 12 - 5" 
try 22 "2 * 5 + 3 * 4"
try 25 "30 / (2 + 4) * 5"
try 4 "(3+5)/2"
try 2 "-3+5"
try 8 "+(3+5)"
try 12 "20-(3+5)"
try 5 "20-(3*+5)"
try 1 "1 < 3"
try 0 "1 > 3"
try 1 "2 <= 2"
try 0 "1 >= 2"
try 1 "1 == 1"
try 0 "1 != 1"
try 4 "(4 / 2 >= 1 < (5-3) * 2) + 3"

echo OK
