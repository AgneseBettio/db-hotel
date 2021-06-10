-- 1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
SELECT `prenotazioni_has_ospiti`.`ospite_id`, `prenotazioni_has_ospiti`.`prenotazione_id`,
        CONCAT(`ospiti`.`name`, " ", `ospiti`.`lastname`) AS `full_name`
FROM `prenotazioni_has_ospiti` 
LEFT JOIN `ospiti` ON `ospiti`.`id` = `prenotazioni_has_ospiti`.`ospite_id`
LEFT JOIN `prenotazioni` ON `prenotazioni`.`id` = `prenotazioni_has_ospiti`.`prenotazione_id`

-- GROUP BY `prenotazioni_has_ospiti`.`ospite_id`
-- HAVING COUNT(`prenotazioni_has_ospiti`.`ospite_id`) > 2
-- non riesco ad aggiungere il count - chiedo confronto in classe

-- 2. Stampare tutti gli ospiti per ogni prenotazione
SELECT `prenotazioni_has_ospiti`.`ospite_id`, 
`prenotazioni_has_ospiti`.`prenotazione_id`, 
CONCAT(`ospiti`.`name`, " ", `ospiti`.`lastname`) AS `full_name` 
FROM `prenotazioni_has_ospiti` 
LEFT JOIN `ospiti` ON `ospiti`.`id` = `prenotazioni_has_ospiti`.`ospite_id` 
LEFT JOIN `prenotazioni` ON `prenotazioni`.`id` = `prenotazioni_has_ospiti`.`prenotazione_id`

-- 3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
SELECT  CONCAT(`paganti`.`name`, " ", `paganti`.`lastname`) AS `full_name_pagamento`,
        `pagamenti`.`price`,
	    EXTRACT(YEAR_MONTH FROM `prenotazioni`.`created_at`) AS `maggio_2018`
FROM `pagamenti` 
LEFT OUTER JOIN `prenotazioni` ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
LEFT OUTER JOIN `paganti` ON `paganti`.`id` = `pagamenti`.`pagante_id`
WHERE EXTRACT(YEAR_MONTH FROM `prenotazioni`.`created_at`) = '201805'
