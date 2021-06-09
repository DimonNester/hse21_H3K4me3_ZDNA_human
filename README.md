# hse21_H3K4me3_ZDNA_human

Сохраненная сессия в UCSC GenomeBrowser:  http://genome.ucsc.edu/s/antonov/hse21_H3K4me3_ZDNA_human

## Конвертируем координаты с версии генома hg38 на hg19
```
wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/liftOver/hg38ToHg19.over.chain.gz
liftOver   H3K4me3_A549.ENCFF832EOL.hg38.bed   hg38ToHg19.over.chain.gz   H3K4me3_A549.ENCFF832EOL.hg19.bed   H3K4me3_A549.ENCFF832EOL.unmapped.bed
```

## Расположение пиков гистоновой метки относительно аннотированных генов
![alt text](https://github.com/vanya-antonov/hse21_H3K4me3_ZDNA_human/raw/main/images/chip_seeker.H3K4me3_A549.ENCFF573MUH.hg19.filtered.plotAnnoPie.png)
![alt text](https://github.com/vanya-antonov/hse21_H3K4me3_ZDNA_human/raw/main/images/chip_seeker.H3K4me3_A549.ENCFF832EOL.hg19.filtered.plotAnnoPie.png)

## Расположение участков стр-ры ДНК относительно аннотированных генов
![alt text](https://github.com/vanya-antonov/hse21_H3K4me3_ZDNA_human/raw/main/images/chip_seeker.DeepZ.plotAnnoPie.png)

## Расположение пересечения гистоновой метки и участков стр-ры ДНК
![alt text](https://raw.githubusercontent.com/vanya-antonov/hse21_H3K4me3_ZDNA_human/main/images/chip_seeker.H3K4me3_A549.intersect_with_DeepZ.plotAnnoPie.png)
