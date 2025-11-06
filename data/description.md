## Анализ данных и логическая модель данных

### Для подготовки данных в отчёте использовались несколько таблиц-сущностей с определенным набором данных

Сущность v_nko_part t21
<html><body>
<table border='1'>
<tr><td>Атрибут</td><td>nko_id</td></tr>
<tr><td>Атрибут</td><td>dept_num</td></tr>
<tr><td>Атрибут</td><td>nko__t_ind</td></tr>
<tr><td>Атрибут</td><td>spare_type_v</td></tr>
<tr><td>Атрибут</td><td>spare_type_p</td></tr>
<tr><td>Атрибут</td><td>spare_type_t</td></tr>
<tr><td>Атрибут</td><td>mname_id</td></tr>
<tr><td>Атрибут</td><td>obj_count</td></tr>
<tr><td>Атрибут</td><td>sdate</td></tr>
<tr><td>Атрибут</td><td>pmp_id</td></tr>
</table>

Сущность v_nko t2
<table border='1'>
<tr><td>Атрибут</td><td>fact_num</td></tr>
</table>

Сущность nko_types t3
<table border='1'>
<tr><td>Атрибут</td><td>full_name</td></tr>
</table>

Сущность nko_mark t4
<table border='1'>
<tr><td>Атрибут</td><td>pmp_id</td></tr>
<tr><td>Атрибут</td><td>pname</td></tr>
</table>

Сущность material_names t5
<table border='1'>
<tr><td>Атрибут</td><td>mat_name</td></tr>
</table>

Сущность material_statuses t6
<table border='1'>
<tr><td>Атрибут</td><td>description</td></tr>
</table>
Сущность bux_fondobj t7
<table border='1'>
<tr><td>Атрибут</td><td>fond_name</td></tr>
</table>

Сущность spr_norma_nko_item_mark m
<table border='1'>
<tr><td>Атрибут</td><td>kat_id</td></tr>
<tr><td>Атрибут</td><td>pmp_id</td></tr>
</table>

Сущность spr_norma_nko k
<table border='1'>
<tr><td>Атрибут</td><td>kat_id</td></tr>
<tr><td>Атрибут</td><td>kat_name</td></tr>
<tr><td>Атрибут</td><td>rem_norma</td></tr>
<tr><td>Атрибут</td><td>meas_id</td></tr>
<tr><td>Атрибут</td><td>rem_status_cur</td></tr>
<tr><td>Атрибут</td><td>rem_status_mid</td></tr>
<tr><td>Атрибут</td><td>rem_status_kap</td></tr>
<tr><td>Атрибут</td><td>norma_stor</td></tr>
<tr><td>Атрибут</td><td>norma</td></tr>
<tr><td>Атрибут</td><td>calc_id</td></tr>
</table>

Сущность spr_norma_nko_item s
<table border='1'>
<tr><td>Атрибут</td><td>kat_id</td></tr>
<tr><td>Атрибут</td><td>kati_id</td></tr>
</table>

Сущность spr_norma_nko_dept_link x5
<table border='1'>
<tr><td>Атрибут</td><td>dlv_id</td></tr>
</table>
<br>
</body></html>

### В рамках работы с данными были подготовлены SQL запрос для получения данных по объектам и ER диаграмма сущностей для визуализации логической модели данных

- Cформированный [SQL запрос](https://github.com/Therealsergios/Case2-reporting-form/blob/main/data/request.sql)
- Итоговая [Таблица](https://github.com/Therealsergios/Case2-reporting-form/blob/main/data/table.md) с полученными данными в рамках выполненного запроса
- Подготовленная ER диаграмма сущностей

![ER диаграмма](https://github.com/Therealsergios/Case2-reporting-form/blob/main/data/ERD.png)
