# Подключаем библиотеки
library(readxl) # Чтение файла *.xlsx
library(tidyverse)
library(writexl) # Запись файла *.xlsx

# Считываем файл данных
data_base = read_xlsx("fio_base.xlsx")

# Добавляем столбец с полом
ds =  mutate(
  data_base,
  `Пол` = case_when(
    str_sub(data_base$ФИО, -3, -1) == "вич" ~ "м",
    str_sub(data_base$ФИО, -3, -1) == "вна" ~ "ж",
    TRUE ~ "!"
    )
  )

# Записываем файл
write_xlsx(ds, "fio_result_R.xlsx")
