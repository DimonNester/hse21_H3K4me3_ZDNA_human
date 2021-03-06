# hse21_H3K4me3_ZDNA_human

Сохраненная сессия в UCSC GenomeBrowser:  https://genome.ucsc.edu/s/danesterov/Project
![alt_text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/USCS_session.png)

## Исходные пики до фильтрации (с конвертированными координатами)
![alt_text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/raw/master/images/len_hist.H3K4me3_H1.ENCFF668YOE.hg19.png)
![alt_text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/raw/master/images/len_hist.H3K4me3_H1.ENCFF408FCY.hg19.png)
## Пики после фильтрации
![alt_text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/filter_peaks.H3K4me3_H1.ENCFF668YOE.hg19.filtered.hist.png)
![alt_text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/filter_peaks.H3K4me3_H1.ENCFF408FCY.hg19.filtered.hist.png)

## Расположение пиков гистоновой метки относительно аннотированных генов
![alt text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/chip_seeker.H3K4me3_H1.ENCFF668YOE.hg19.filtered.plotAnnoPie.png)
![alt text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/chip_seeker.H3K4me3_H1.ENCFF408FCY.hg19.filtered.plotAnnoPie.png)

## Гистограмма пиков вторичной структуры ДНК 
![alt text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/len_hist.zhunt.png)

## Расположение участков стр-ры ДНК относительно аннотированных генов 
![alt text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/chip_seeker.zhunt.plotAnnoPie.png)

## Гистограмма пиков пересечения аннотированных генов со вторичной структурой ДНК
![alt text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/len_hist.H3K4me3_H1.intersect_with_zhunt.png)

## Расположение пересечения гистоновой метки и участков стр-ры ДНК
![alt text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/chip_seeker.H3K4me3_H1.intersect_with_zhunt.plotAnnoPie.png)

## GO-анализ
### Количество уникальных генов – 4027
### С пикамии удалось проассоциировать 5847
![alt_text](https://github.com/DimonNester/hse21_H3K4me3_ZDNA_human/blob/master/images/GO_analysis.png)

## Использованные команды
### wget [link] – скачивание файлов;
### zcat [file]  |  cut -f1-5 > [file] - обрезаниие первых пяти столбцов в архииве
### liftOver [oldFile][map.chain][newFile][unMapped] - конвертация координат 
### git clone [link] - скачивание репозитория с гитхаба
### git pull - pull-request
### git add . - добавление файла на сервер
### git commit -m 'messgae' - commit с собщением
### git push
### cat  \*.filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H3K4me3_H1.merge.hg19.bed - объединение файлов и их сортировка
### bedtoold intersect -a [file] -b [file] - пересечение генов
