# Credit
The Credit folder contains Jupyter Notebooks for Credit Assessment Analysis.  

[PreProcess.ipynb](https://github.com/mh2t/ML/blob/main/Credit/PreProcess.ipynb). 
- pre-processing step on the input data. 

[EDA.ipynb](https://github.com/mh2t/ML/blob/main/Credit/EDA.ipynb).  
- Exploratory Data Analysis (EDA) on features.  

[XGBoost_What_IF.ipynb](https://github.com/mh2t/ML/blob/main/Credit/XGBoost_What_IF.ipynb).  
- Training XGBoost on the pre-processed data and applying What-If tool on the trained XGBoost model for fairness evaluation.  

[Logistic Regression.R](https://github.com/mh2t/ML/blob/main/Credit/Logistic%20Regression.R).  
- Training Lasso Logistic Regression on the pre-processed data.  

[SHAP.ipynb](https://github.com/mh2t/ML/blob/main/Credit/SHAP.ipynb).
- SHAP explanation on the trained XGBoost model.  

[credit.pdf](https://github.com/mh2t/ML/blob/main/Credit/credit.pdf).  
- Presentation slides. 


# Production
The Production folder contains a machine learning API ([API.ipynb](https://github.com/mh2t/ML/blob/main/Credit/API.ipynb)) in Python that takes a saved model ([model.pkl](https://github.com/mh2t/ML/blob/main/Credit/model.pkl)) and an input file ([test.csv](https://github.com/mh2t/ML/blob/main/Credit/test.csv)) and after doing pre-processing and feature engineering, it returns the prediction of class **1** in probability.  
