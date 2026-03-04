# Data

The datasets used in this repository are not included in the repo to keep it lightweight and respect licensing terms. All datasets are publicly available — download them and place the files in this `data/` folder before running any script.

Each MATLAB script loads data with a relative path, e.g. `load('../data/IrisData.mat')`. If your folder structure differs, update the `load()` call at the top of the relevant script accordingly.

---

## Datasets

### IrisData / IrisDataAnnotated
**Used in:** Assignment 1 (PCA), Assignment 2 (clustering), Assignment 3 (LDA)  
**Format:** `.mat` — matrix `X` (4×150), label vector `I` (1=Setosa, 2=Versicolor, 3=Virginica)  
**Source:** [UCI Machine Learning Repository — Iris Dataset](https://archive.ics.uci.edu/dataset/53/iris)  
**Expected filename:** `IrisData.mat` / `IrisDataAnnotated.mat`

---

### WineData
**Used in:** Assignment 2 (clustering), Assignment 3 (LDA, PCA)  
**Format:** `.mat` — matrix `X` (13×178), label vector `I` (1, 2, or 3 for cultivar)  
**Source:** [UCI Machine Learning Repository — Wine Dataset](https://archive.ics.uci.edu/dataset/109/wine)  
**Expected filename:** `WineData.mat`

---

### HandwrittenDigits
**Used in:** Assignment 1 (PCA), Assignment 3 (LDA, NMF)  
**Format:** `.mat` — matrix `X` (256×1707), label vector `I` (digits 0–9); each column is a flattened 16×16 grayscale image  
**Source:** Derived from the [USPS Handwritten Digits Dataset](https://www.kaggle.com/datasets/bistaumanga/usps-dataset)  
**Expected filename:** `HandwrittenDigits.mat`

---

### ModelReductionData
**Used in:** Assignment 1 (PCA)  
**Format:** `.mat` — matrix `X` (6×4000)  
**Source:** Provided as course material by Prof.ssa Rosanna Campagna — not publicly available. Contact the course instructor or adapt the script to a dataset of similar dimensions.  
**Expected filename:** `ModelReductionData.mat`

---

### Yale Face Database
**Used in:** Yale Face Database Project  
**Format:** `.mat` — matrix `fea` (4096×165); each column is a flattened 64×64 grayscale image of one of 15 individuals under 11 conditions  
**Source:** [Yale Face Database B — Carnegie Mellon / Yale](http://cvc.cs.yale.edu/cvc/projects/yalefaces/yalefaces.html) · also available via [Kaggle](https://www.kaggle.com/datasets/olgabelitskaya/yale-face-database)  
**Expected filename:** `YaleFaces.mat`

---

### CardiacSPECT
**Used in:** Assignment 2 (K-medoids with Jaccard)  
**Format:** `.mat` — binary matrix `X` (22×187), label vector `I`  
**Source:** [UCI Machine Learning Repository — SPECT Heart Dataset](https://archive.ics.uci.edu/dataset/95/spect+heart)  
**Expected filename:** `CardiacSPECT.mat`

---

### Congressional Vote
**Used in:** Assignment 2 (K-medoids with custom categorical distance)  
**Format:** `.mat` — matrix `X` (16×435), label vector `I` (1=Republican, 2=Democrat)  
**Source:** [UCI Machine Learning Repository — Congressional Voting Records](https://archive.ics.uci.edu/dataset/105/congressional+voting+records)  
**Expected filename:** `CongressionalVote.mat`

---

### Biopsy
**Used in:** Assignment 2 (K-medoids, NaN handling)  
**Format:** `.mat` — matrix `X` (9×699), label vector `I` (1=benign, 2=malignant); contains missing values  
**Source:** [UCI Machine Learning Repository — Breast Cancer Wisconsin](https://archive.ics.uci.edu/dataset/15/breast+cancer+wisconsin+original)  
**Expected filename:** `Biopsy.mat`
