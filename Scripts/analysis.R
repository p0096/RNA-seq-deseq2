# =========================
# RNA-seq Differential Expression Analysis
# Using DESeq2 with airway dataset
# =========================

# # Load required libraries

library(DESeq2)
library(airway)
library(ggplot2)

# -------------------------
# 1. Load dataset
# -------------------------

data("airway")

# -------------------------
# 2. Create DESeq2 object
# -------------------------
# design ~ dex compares treatment vs control conditions


dds <- DESeqDataSet(airway, design = ~ dex)

# -------------------------
# 3. Run differential expression analysis
# -------------------------

dds <- DESeq(dds)
res <- results(dds)

# -------------------------
# 4. Filter significant genes
# -------------------------
# padj < 0.05 = statistically significant genes

sig <- res[which(res$padj < 0.05), ]

# -------------------------
# 5. Sort results by significance
# -------------------------
# Most significant genes first (lowest padj)

res <- res[order(res$padj), ]

# Extract top 10 most significant genes

top_genes <- head(res, 10)

# -------------------------
# 6. Quick inspection
# -------------------------

head(res)
head(sig)

# -------------------------
# 7. Prepare data for plotting
# -------------------------

res$gene <- rownames(res)

# Create significance label for visualization

res$significant <- res$padj < 0.05

# -------------------------
# 8. Volcano plot
# -------------------------

ggplot(res, aes(x = log2FoldChange, y = -log10(pvalue), color = significant)) +
  geom_point(alpha = 0.6) +
  scale_color_manual(values = c("grey", "red")) +
  theme_minimal() +
  ggtitle("Volcano plot - Differential Expression (airway)") +
  xlab("Log2 Fold Change") +
  ylab("-log10(p-value)") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed")

# -------------------------
# 9. Export results
# -------------------------

write.csv(as.data.frame(res), "results_all_genes.csv")
write.csv(as.data.frame(sig), "results_significant_genes.csv")

# Save plot

ggsave("volcano_plot.png", width = 7, height = 6, dpi = 300)
