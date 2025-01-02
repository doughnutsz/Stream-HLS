opts=(opt1 opt2 opt3 opt4 opt5)
for opt in ${opts[@]}; do
    echo "Running $opt"
    rm $opt/results* -rf
done
rm *.csv