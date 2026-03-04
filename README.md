# Numerical Methods for Data Analysis — MATLAB

![MATLAB](https://img.shields.io/badge/MATLAB-R2023b-0076A8?style=flat&logo=mathworks&logoColor=white)
![LaTeX](https://img.shields.io/badge/LaTeX-Reports-008080?style=flat&logo=latex&logoColor=white)
![Grade](https://img.shields.io/badge/Grade-30%2F30_cum_laude-brightgreen?style=flat)
![University](https://img.shields.io/badge/Università_Vanvitelli-BSc_Data_Analytics-darkred?style=flat)

**Course:** Numerical Methods for Data Analysis · Prof.ssa Rosanna Campagna  
**Institution:** Università degli Studi della Campania 'Luigi Vanvitelli'  
**Degree:** BSc in Data Analytics · 2023–2024  
**Grade:** 30/30 cum laude

---

## Overview

This repository collects three assignments and one project developed for the course *Numerical Methods for Data Analysis*. All algorithms are implemented **from scratch in MATLAB**, with no reliance on built-in black-box routines for the core methods. Each assignment is accompanied by a **LaTeX report** with full mathematical derivations. The work covers dimensionality reduction via SVD-based techniques, unsupervised clustering, supervised linear discriminant analysis, and non-negative matrix factorisation, applied throughout to real-world datasets.

---

## Assignment 1 — PCA & Dimensionality Reduction

Principal Component Analysis implemented via the economy SVD decomposition `X_c = UDV'`. Three datasets of increasing complexity are analysed.

**Exercise 1 — ModelReductionData** `(6 × 4000)`  
Scatter-plots of all C(6,2) = 15 pairwise component combinations, data centring, full SVD, singular value spectrum on a logarithmic scale, and low-rank approximation with k = 4 principal components.

**Exercise 2 — HandWrittenDigits** `(256 × 1707, digits 0–9)`  
PCA-based image approximation with k = 5, 10, 15, 20, 25 feature vectors. Visualisation of original images, k-rank approximations, and residuals. Residual norm plotted as a function of k.

**Exercise 3 — IrisData** `(4 × 150, three species)`  
PCA applied to centred data for cluster visualisation. Scatter-plots of the first three principal components.

---

## Project — Yale Face Database (Eigenfaces)

165 grayscale images (64×64 px) of 15 individuals under 11 lighting/expression conditions.

- Full `fea` matrix visualisation and construction of a representative sub-matrix F (6 faces × 5 individuals)
- Thin SVD computed for k = 30 (rank of F)
- Singular value decay analysis: elbow identified at k ≈ 7
- First 5 eigenfaces plotted as 64×64 grayscale images — capturing eyes, nose, and facial outline
- Image approximation with k = 4, 8, 15 feature vectors with residual visualisation

---

## Assignment 2 — Clustering: K-means & K-medoids

From-scratch implementation of two clustering algorithms, with PCA used for visualisation throughout.

**K-means (Lloyd's algorithm)** — Euclidean distance, centroid update rule, convergence tracked via overall coherence Q, Voronoi tessellation visualisation.

**K-medoids (PAM — Partitioning Around Medoids)** — Medoids are constrained to actual data points; supports any dissimilarity measure. Tested with L1-norm, L2-norm, and Jaccard dissimilarity index.

| Dataset | n | p | k | Distance | Notes |
|---|---|---|---|---|---|
| Iris | 150 | 4 | 3 | L1 / L2 | K-means + K-medoids comparison |
| CardiacSPECT | 187 | 22 | 2 | Jaccard | Binary features |
| Wine | 178 | 13 | 3 | L2 | K-means + K-medoids |
| Congressional Vote | 435 | 16 | 2 | Custom | Republican vs Democrat |
| Biopsy | 699 | 9 | 2 | L2 | Benign vs malignant, NaN handling |

Results evaluated via confusion matrices and overall coherence convergence plots.

---

## Assignment 3 — LDA & NMF

Applied to the **Wine** dataset (3 cultivars, 13 features) and **HandWrittenDigits** dataset (digits 0 and 4).

**Linear Discriminant Analysis (LDA)**  
Fisher's criterion maximised via a generalised eigenvalue problem. Within-class and between-class scatter matrices `Sw` and `Sb` are computed explicitly. The system is solved through Cholesky factorisation of `Sw` (with Tikhonov regularisation `ε = 1e-10` where `det(Sw) ≤ 1e-14`) to avoid numerical instability in near-singular cases. Data projected onto the top discriminant directions and visualised with joint scatter/histogram panels.

**Non-negative Matrix Factorisation (NMF — ANLS)**  
Alternating Non-negative Least Squares: `X ≈ WH`, with `W, H ≥ 0`. Each column of W and H updated via `lsqnonneg`. Stopping criterion: relative change `‖ΔW‖_F/‖W‖_F + ‖ΔH‖_F/‖H‖_F < τ = 0.01`. Experiments run for k = 5, 10, 20 basis vectors; convergence diagnostics and basis images plotted. Basis vectors interpreted by analysing coefficient magnitudes in H — identifying which digit class each feature vector predominantly encodes.

---

## Key Concepts

**PCA via SVD**
$$X_c = U \Sigma V^\top \quad \Rightarrow \quad Z = U_k^\top X_c$$
The centred data matrix is decomposed via economy SVD; the top $k$ left singular vectors form the principal directions. Projection onto the $k$-dimensional subspace gives the reduced representation $Z$.

**LDA — Fisher's Criterion**
$$\max_w \frac{w^\top S_B w}{w^\top S_W w}$$
where $S_W = \sum_c (X_c - \mu_c)(X_c - \mu_c)^\top$ is the within-class scatter matrix and $S_B = \sum_c n_c (\mu_c - \mu)(\mu_c - \mu)^\top$ is the between-class scatter matrix. Solved as a generalised eigenvalue problem via Cholesky factorisation of $S_W$, with Tikhonov regularisation $S_W \leftarrow S_W + \varepsilon I$ where numerical singularity is detected ($\det(S_W) \leq 10^{-14}$).

**NMF — Alternating Non-negative Least Squares (ANLS)**
$$X \approx WH, \quad W \geq 0,\; H \geq 0$$
At each iteration, $H$ and $W$ are updated by solving a non-negative least squares problem column-by-column via `lsqnonneg`. Convergence is declared when:
$$\frac{\|W^{(t)} - W^{(t-1)}\|_F}{\|W^{(t-1)}\|_F} + \frac{\|H^{(t)} - H^{(t-1)}\|_F}{\|H^{(t-1)}\|_F} < \tau = 0.01$$

**K-medoids — PAM**
$$\text{medoid}_c = \arg\min_{x_i \in C_c} \sum_{x_j \in C_c} d(x_i, x_j)$$
Unlike K-means centroids, medoids are always actual data points, making PAM robust to non-Euclidean dissimilarity measures (L1, L2, Jaccard).

---

## Repository Structure

```
numerical-methods-matlab/
├── assignment1-pca/
│   ├── Assignment1.m
│   └── Assignment1.pdf
├── yale-project/
│   ├── PCA_project_YaleData.m
│   └── Yale.pdf
├── assignment2-clustering/
│   ├── Assignment_2.m
│   ├── Projects_.m
│   ├── my_k_medoids.m           # K-medoids (PAM)
│   ├── mykm.m                   # K-means (Lloyd's algorithm)
│   └── Assignment2.pdf
├── assignment3-lda-nmf/
│   ├── Assignment3.m
│   └── Assignment_3.pdf
├── data/
│   └── README.md
└── README.md
```

---

## Stack

| Tool | Purpose |
|---|---|
| MATLAB | All numerical implementations |
| LaTeX | Written reports with full mathematical derivations |
