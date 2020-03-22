library(readxl) # Чтение excel файлов
library(tidyverse) # 

# Считываем файл данных
data_base = read_xlsx("https://github.com/abdild/lifehacks/blob/master/%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%BF%D0%BE%D0%BB%D0%B0/fio.xlsx")
data_base = import("ФИО.xlsx", sheet = 2)

# Добавляем столбец с полом (gender)
ds =  mutate(
  data_base,
  gender = case_when(
    str_sub(data_base$Сотрудник, -4, -1) == "ович" ~ "м",
    str_sub(data_base$Сотрудник, -4, -1) == "евич" ~ "м",
    str_sub(data_base$Сотрудник, -4, -1) == "оглы" ~ "м",
    str_sub(data_base$Сотрудник, -4, -1) == "овна" ~ "ж",
    str_sub(data_base$Сотрудник, -4, -1) == "евна" ~ "ж",
    str_sub(data_base$Сотрудник, -4, -1) == "кызы" ~ "ж",
    str_sub(data_base$Сотрудник, -4, -1) == "ична" ~ "ж",
    TRUE ~ "!"
    )
  )

# Проверка все ли строки обработались
 ds %>% filter(ds$gender == "!")

# Группировка по полу
 ds %>%
   group_by(gender) %>%
   summarise(total = n())
 