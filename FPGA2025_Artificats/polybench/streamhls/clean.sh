dsps=(220 2560 9024)
opts=(opt1 opt2 opt3 opt4 opt5)

for dsp in ${dsps[@]}; do
    for opt in ${opts[@]}; do
        # for dsp 220 and 9024, only check opt5
        if [ $dsp -eq 220 ] || [ $dsp -eq 9024 ]; then
            if [ $opt == "opt5" ]; then
                echo "Running $opt"
                rm ${dsp}_DSPs/$opt/results* -rf
            fi
        else
            echo "Running $opt"
            rm ${dsp}_DSPs/$opt/results* -rf
        fi
    done
done