
source("lib.R")

###
NAME <- 'zhunt'
#NAME <- 'H3K4me3_H1.ENCFF408FCY.hg19'
#NAME <- 'H3K4me3_H1.ENCFF408FCY.hg38'
#NAME <- 'H3K4me3_H1.ENCFF668YOE.hg19'
#NAME <- 'H3K4me3_H1.ENCFF668YOE.hg38'

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

# hist(bed_df$len)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)

###########
# NAME <- 'H3K4me3_H1.ENCFF408FCY.hg19'
NAME <- 'H3K4me3_H1.ENCFF408FCY.hg38'
# NAME <- 'H3K4me3_H1.ENCFF668YOE.hg19'
# NAME <- 'H3K4me3_H1.ENCFF668YOE.hg38'
OUT_DIR <- 'Results/'

###

bed_df <- read.delim(paste0('data/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 5000)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.filtered.pdf'), path = OUT_DIR)

bed_df %>%
  select(-len) %>%
  write.table(file='data/H3K4me3_H1.ENCFF408FCY.hg38.filtered.bed',
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)


