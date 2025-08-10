## Шаблон FastReport
### Титульная страница
![Титул]()

Данные по подписантам формируются исходя из запросов:
- подписанты / Таблица Positions
```
SELECT
    name
FROM
    Positions
WHERE position_id = 1 - глав мех
--
WHERE position_id = 2 - нач упр
--
WHERE position_id = 3 - нач упр отдела
--
WHERE position_id = 4 - зам нач упр отдела
```
- подписанты / Таблица norma_sector
```
SELECT
    name
FROM
    norma_sector
WHERE position_id = 44 and dlv_id = 132 – начальник сектора
--
WHERE position_id = 45 and dlv_id = 132 – начальник сектора
--
WHERE position_id = 46 and dlv_id = 132 – начальник сектора
```
- цех, установка / Таблица t1
```
SELECT
    dept_num
--    
    plant_name
FROM
    t1
WHERE dept_num = '4' - цех заданный пользователем
--
WHERE plant_name = 'u-kat-rif 1000' - установка заданная пользователем
```
- нормирование элементов
```
'SINH'- dept_num-case when pmp_id between 1 and 940 then 'MO' else EO end as object_kod-EXTRACT(MONTH FROM CURRENT_DATE)-(EXTRACT(YEAR FROM CURRENT_DATE)
```
### Содержание
![Содержание]()

Данные в содержании формируются исходя из запросов:
- наименование
```
SELECT
    nko_t_ind, - все имеющиеся индексы по фильтру
    fond_num - инв номер
FROM
    t1
JOIN
    t2
ON t1.nko_id = t2.objt_id
JOIN
    t7
ON t2.fondobjt_id = t7.fobj_id
WHERE dept_num = '4'
      AND plant_name = 'u-kat-rif 1000'
```
### Норма
![Норма]()

Данные в норме формируются исходя из [запроса]()
<!-- Таблица 1 -->
<table border="1" cellpadding="5" cellspacing="0">
    <thead>
        <tr>
            <th>атрибут</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>t1 dept_num</td>
        </tr>
        <tr>
            <td>t1 plant_name</td>
        </tr>
         <tr>
            <td>t1 nko_t_ind , t7 - fond_num</td>
        </tr>
        <tr>
            <td>t3 full_name</td>
        </tr>
        <tr>
            <td>t4 pname</td>
        </tr>
    </tbody>
</table>

<br>

<!-- Таблица 2 -->
<table border="1" cellpadding="5" cellspacing="0">
    <thead>
        <tr>
            <th>Категория нормирования</th>
            <th>Норма хранения</th>
            <th>Наименование по СМ</th>
            <th>Материал</th>
            <th>Всего единиц</th>
            <th>Величина нормы</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>k kat_name</td>
            <td>k norma_stor</td>
            <td>t5 mat_name</td>
            <td>t5 mname_id</td>
            <td>count(pmp_id) <br><small>where dlv_id = 2 and kat_id is not null</small></td>
            <td>calc_id / sum(pmp_id) <br><small>where dlv_id = 2 and kat_id is not null</small></td>
        </tr>
    </tbody>
</table>

### Обоснование
![Обоснование]()

Данные по нормативно-технической документации формируются из:
- документация
```
SELECT
standart_name
FROM
standarts
WHERE pmp_id is in (SELECT distinct pmp_id FROM table)
```