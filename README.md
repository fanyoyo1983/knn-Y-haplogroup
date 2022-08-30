Y-haplogroup Prediction With R

This is an example of Y-haplogroup prediction with R using Y-STR database.

The goal of the project is to predict a given Y-STR haplotype belong to which haplogroup.

Packages Required
library(class)

library(ggplot2)

library(lattice)

library(caret)

library(gmodels)

All downloadable from CRAN repositories

Prerequisites

Knowledge of R Programming

R Studio

Dataset Description

The Y-SNP and Y-STR data acquired from seven previous reports.

[1]	C. Yin, Z. He, Y. Wang, X. He, X. Zhang, M. Xia, D. Zhai, K. Chang, X. Chen, X. Chen, F. Chen, L. Jin, S. Li, Improving the regional Y-STR haplotype resolution utilizing haplogroup-determining Y-SNPs and the application of machine learning in Y-SNP haplogroup prediction in a forensic Y-STR database: A pilot study on male Chinese Yunnan Zhaoyang Han population, Forensic science international : genetics 57 (2022) 102659-102659.

[2]	M. Song, Z. Wang, Y. Zhang, C. Zhao, M. Lang, M. Xie, X. Qian, M. Wang, Y. Hou, Forensic characteristics and phylogenetic analysis of both Y-STR and Y-SNP in the Li and Han ethnic groups from Hainan Island of China, Forensic science international : genetics 39 (2019) e14-e20.

[3]	M. Lang, H. Liu, F. Song, X. Qiao, Y. Ye, H. Ren, J. Li, J. Huang, M. Xie, S. Chen, M. Song, Y. Zhang, X. Qian, T. Yuan, Z. Wang, Y. Liu, M. Wang, Y. Liu, J. Liu, Y. Hou, Forensic characteristics and genetic analysis of both 27 Y-STRs and 143 Y-SNPs in Eastern Han Chinese population, Forensic science international : genetics 42 (2019) e13-e20.

[4]	C. Yin, K. Su, Z. He, D. Zhai, K. Guo, X. Chen, L. Jin, S. Li, Genetic Reconstruction and Forensic Analysis of Chinese Shandong and Yunnan Han Populations by Co-Analyzing Y Chromosomal STRs and SNPs, Genes-Basel 11(7) (2020) 743.

[5]	F. Wang, F. Song, M. Song, J. Li, M. Xie, Y. Hou, Genetic reconstruction and phylogenetic analysis by 193 Y‐SNPs and 27 Y‐STRs in a Chinese Yi ethnic group, Electrophoresis 42(14-15) (2021) 1480-1487.

[6]	F. Song, M. Song, H. Luo, M. Xie, X. Wang, H. Dai, Y. Hou, Paternal genetic structure of Kyrgyz ethnic group in China revealed by high‐resolution Y‐chromosome STRs and SNPs, Electrophoresis 42(19) (2021) 1892-1899.

[7]	M. Wang, G. He, X. Zou, J. Liu, Z. Ye, T. Ming, W. Du, Z. Wang, Y. Hou, Genetic insights into the paternal admixture history of Chinese Mongolians via high-resolution customized Y-SNP SNaPshot panels, Forensic science international : genetics 54 (2021) 102565-102565.


Process

Before running the kNN() function in R, the original dataset was divided into the training and test datasets, 
followed by the normalization of allele information from each Y-STR loci. 
Then, the seed was set to be 1234 (changeable) so that the same results can be obtained. 
In the createDataPartition() function, we take 75% or 70%(changeable) of the data in the training set and the rest in the cross-validation set. 
After the prediction with the kNN algorithm, it returned a vector containing the factor of classifications of the testing set. 
The outcome was illustrated in a cross-tabulation via the confusionMatrix() function. 

Description of sample file

Based on 5,574 haplotypes of Han Chinese, the performance of the kNN classifier can be evaluated at different levels, respectively.
The file of "sample-input.csv" is used to test the efficiency of the kNN classifier in predicting nine major haplogroups (C, D, I, IJ, N, O, P, Q, and R)
using cross-validation on a 4,320-observation ground-truth training set. If you want to "Implement predictions at different levels of haplogroup", you can
download the raw data the seven previous reports we mentioned above.
