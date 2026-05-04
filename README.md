# RNA-seq Differential Expression Analysis (DESeq2)

This project performs a basic RNA-seq differential gene expression analysis using the DESeq2 package in R. The analysis uses the airway dataset from Bioconductor.

---

## Objectives

- Perform differential gene expression analysis
- Identify significantly expressed genes
- Visualize results using a volcano plot
- Export results for downstream analysis

---

## Dataset

The analysis uses the `airway` dataset, which contains RNA-seq count data from airway smooth muscle cells under different experimental conditions (treated vs untreated).

---

## Tools and Technologies

- R
- DESeq2
- ggplot2
- Bioconductor

---

## Workflow

1. Load dataset
2. Create DESeq2 object
3. Run differential expression analysis
4. Filter significant genes (padj < 0.05)
5. Generate volcano plot
6. Export results as CSV files

---

## Project structure

Scripts/ → analysis code
Results/ → output files

---

## Results

### Volcano Plot

![Volcano Plot](Results/volcano_plot.png)

---

## Output Files

- `results_significant_genes.csv` → significantly differentially expressed genes  
- `volcano_plot.png` → visualization of gene expression changes  

---

## How to Run

```r
library(DESeq2)
library(airway)
library(ggplot2)

data("airway")

dds <- DESeqDataSet(airway, design = ~ dex)
dds <- DESeq(dds)
res <- results(dds)

```

## Author
Paula
