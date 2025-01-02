cd cnns         && python report.py && cd ..
cd mlps         && python report.py && cd ..
cd polybench    && python report_ablation.py && python report_compare.py && cd ..
cd synthetic    && python report.py && cd ..
cd transformers && python report.py && cd ..