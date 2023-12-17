# Automatic Pipeline for Classification (using Swin Transformer) and Detection (using RT-DETR) of Bleeding and Non-Bleeding frames in Wireless Capsule Endoscopy
## About
  - Team name: failed wizards
  - Team member names:
    - Sasidhar Alavala (MS(R), IIT Tirupati)
    - Vaishnavi Ravi (PhD, IIT Tirupati)
    - Dr. Subrahmanyam Gorthi (Asst. Professor, IIT Tirupati)
    - Dr. Rama Krishna Gorthi (Assoc. Professor, IIT Tirupati)
  - Abstract:
    - This pipeline leverages two state-of-the-art models: Swin Transformer for classification and RT-DETR for detection. The pipeline begins with a series of image preprocessing steps, including colour space conversion to LAB, CLAHE (Contrast Limited Adaptive Histogram Equalization), and Gaussian blur to enhance image features. These preprocessing steps are applied to both training and validation data.
    - For training data, various data augmentations are incorporated to improve model robustness and generalization. These augmentations include random horizontal and vertical flips, random rotations, Gaussian blurring, random affine transformations, random perspective distortions, and MixUp.
  - Model Weights & Predictions in Excel
    - Classification: [Weights](https://drive.google.com/file/d/1Ji8_o8Fku4_ECZyjj-iH4-ZjhH-pwGIT/view?usp=sharing)
    - Detection: [Weights](https://drive.google.com/file/d/1gQCrQ94iYPP1EsRH7-n_oORiEWiTp-jH/view?usp=sharing)
    - Predictions: [Excel Sheet](https://github.com/failed-wizard/SAFE/blob/main/predictions_classify.xlsx)


## Table of contents
- [Validation Dataset Results](#Validation-Dataset-Results)
  - [Classification Metrics](#Classification-Metrics)
  - [Detection Metrics](#Detection-Metrics)
  - [10 Best Predictions](#10-Best-Predictions)
  - [10 Best Interpretability Plots](#10-Best-Interpretability-Plots)
- [Test Dataset 1 Results](#Test-Dataset-1-Results)
  - [5 Best Predictions](#5-Best-Predictions-Test-1)
  - [5 Best Interpretability Plots](#5-Best-Interpretability-Plots-Test-1)
- [Test Dataset 2 Results](#Test-Dataset-2-Results)
  - [5 Best Predictions](#5-Best-Predictions-Test-2)
  - [5 Best Interpretability Plots](#5-Best-Interpretability-Plots-Test-2)
     

## Validation Dataset Results
- ### Classification Metrics
  | No. of Samples | Accuracy | Recall | F1 Score |
  | :-: | :-: | :-: | :-: |
  | 524 | 0.98 | 0.97 | 0.98 |
- ### Detection Metrics
  | No. of Samples | Average Precision (of bleeding class) (AP)<sup>1</sup> | Mean Average Precision (mAP)<sup>1,2</sup> | Intersection over Union (IoU)<sup>1</sup>|
  | :---: | :---: | :---: | :---: | 
  |262| 65.0 | 65.0 | 50.0 |
  
  1 : AP & mAP are calculated at an IoU threshold of 50.0 \
  2 : AP & mAP are equal since there is only one class (bleeding class)
- ### 10 Best Predictions
  ![1](save/Preds_val.png)
- ### 10 Best Interpretability Plots
  ![2](save/CAMs_val.png)
  The colour red signifies regions of significance or high activation (for predicting that class), while blue is used to indicate less or no activation significance.
  
  
## Test Dataset 1 Results
- ### 5 Best Predictions (Test 1)
  ![3](save/Preds_test1.png)
- ### 5 Best Interpretability Plots (Test 1)
  ![4](save/CAMs_test1.png)
  The colour red signifies regions of significance or high activation (for predicting that class), while blue is used to indicate less or no activation significance.


## Test Dataset 2 Results
- ### 5 Best Predictions (Test 2)
  ![5](save/Preds_test2.png)
- ### 5 Best Interpretability Plots (Test 2)
  ![6](save/CAMs_test2.png)
  The colour red signifies regions of significance or high activation (for predicting that class), while blue is used to indicate less or no activation significance.

## References
- Liu, Ze, Yutong Lin, Yue Cao, Han Hu, Yixuan Wei, Zheng Zhang, Stephen Lin, and Baining Guo. "Swin transformer: Hierarchical vision transformer using shifted windows." In Proceedings of the IEEE/CVF international conference on computer vision, pp. 10012-10022. 2021.
- Lv, Wenyu, Shangliang Xu, Yian Zhao, Guanzhong Wang, Jinman Wei, Cheng Cui, Yuning Du, Qingqing Dang, and Yi Liu. "Detrs beat yolos on real-time object detection." arXiv preprint arXiv:2304.08069 (2023).



