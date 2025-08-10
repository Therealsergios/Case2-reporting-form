SELECT
 t1.nko_id, --[0]id объекта
 t1.dept_num, -- [1] Номер подразделения
 t1.plant_name, -- [2] Участок
 t1.nko_t_ind, -- [3] Индекс объекта
 t7.fond_num, -- [4] Инвентарный номер
 t3.full_name AS nko_type, -- [5] Класс объекта
 t2.fact_num, -- [6] Заводской номер
 t4.pname AS nko_mark, -- [7] Марка объекта
 t4.pmp_id,		-- [8] id марки объекта
 t1.spare_type_V, AS Vid, -- [9] Вид ЗИП 
 t1.spare_type_P, AS Podvid, -- [10] Подвид ЗИП
 t1.spare_type_T, AS Tip, -- [11] Тип ЗИП
 t5.mat_name, -- [12] Наименование материала в справочнике
 t1.mname_id, -- [13] Код материала в справочнике
 t6.description AS mat_status, -- [14] Статус материала в справочнике
 CASE 
 	WHEN t5.mc_id <> 5121 THEN TRIM(NVL(manu_fact), '') || ' ' || NVL(standart_manufact), ''))::NCHAR(510) 
      	ELSE '' 
 END AS manufact, -- [15] Производитель
 t1.obj_count, -- [16] Кол-во ЗИП
 t1.sdate, -- [17] Дата установки ЗИП
 CASE 
 	WHEN EXISTS ( 
 	SELECT 1 
 	FROM spr_norma_nko_item x2, 
	     spr_norma_nko_item_mark x3, 
 	     spr_norma_nko x4, 
	     spr_norma_nko_dept_link x5 
	WHERE t1.spare_type_id = x2.spare_type_id AND x2.kati_id = x3.kati_id 
						  AND x3.pmp_id = t1.pmp_id 
 						  AND x2.kat_id = x4.kat_id 
						  AND x4.kat_id = x5.kat_id 
 						  AND x5.dlv_id = t1.dlv_id 
						  AND x4.zp_category = 'MARK'
 		) THEN 'yes' 
         ELSE 'no'
 END AS is_norm, -- [18] Имеется норма хранения(да/нет)
 ---------добавлены категории------------
 k.kat_id, -- [19] id категории нормы
 k.kat_name AS Kategoriya,  -- [20] наименование категории
 k.rem_norma AS Norma_Remonta, -- [21] норма на ремонт
 CASE WHEN k.meas_id = '35' THEN "компл" 
      ELSE "шт" 
 END as Ed_izmer,  -- [22]  единицы измерения (компл/шт)
 k.rem_status_cur AS t,  -- [23] статус нормы на текущий ремонт
 k.rem_status_mid AS s,  -- [24] статус нормы на средний ремонт
 k.rem_status_kap AS k,  --[25] статус нормы на капитальный ремонт
 k.norma_stor,  -- [26] расходуемое количество ЗИП по норме
 k.norma,  -- [27] распространение нормы в рамках марки объекта (группа/единица/все)
 k.calc_id AS TipRasheta,  -- [28]  тип применяемого расчета
 ------------------------
FROM v_nko_part t1, 
     v_nko t2, 
     OUTER nko_types t3, 
     OUTER nko_mark t4, 
     material_names t5, 
     material_statuses t6, 
     OUTER bux_fondobj t7, 
     OUTER (spr_norma_nko_item s, --тип з/ч в категории
 	    spr_norma_nko k, --категории
 	    spr_norma_nko_item_mark m) --марки в типах з/ч
-----------------------
WHERE t1.ch_ar IS NULL AND t1.nko_id = t2.objt_id 
		       AND t2.ch_ar IS NULL -- не архивные
		       AND t2.date_out IS NULL  -- не выше срока эксплуатации
		       AND t1.type_id = t3.type_id
		       AND t2.pmp_id = t4.pmp_id 
		       AND t1.mname_id = t5.mname_id 
		       AND t5.status = t6.status_char
		       AND t2.fondobj_id = t7.fobj_id
		       AND t1.pmp_id = m.pmp_id	 --категории
		       AND m.kati_id=s.kati_id	--категории
        	       AND s.kat_id=k.kat_id  --категории