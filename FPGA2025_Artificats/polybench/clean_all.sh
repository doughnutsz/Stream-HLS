frameworks=(allo heterocl hida pom scalehls streamhls vitis)
for framework in ${frameworks[@]}; do
    echo "clearning $framework"
    cd $framework
    ./clean.sh
    cd ..
done
rm *.csv