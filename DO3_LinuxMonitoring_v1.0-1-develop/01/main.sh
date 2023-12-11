if [[ $# = 1 ]] && ! [[ $1 = *[[:digit:]]* ]]; then
  echo $1
else
  echo "Дурачек, ввел ты не то!!!!"
fi