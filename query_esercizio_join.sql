-- 1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
SELECT COUNT(`prenotazioni_has_ospiti`.`prenotazione_id`) AS `prenotazioni_per_ospite`,
        CONCAT(`ospiti`.`name`, " ", `ospiti`.`lastname`) AS `full_name`
FROM `prenotazioni_has_ospiti` 
LEFT OUTER JOIN `ospiti` ON `ospiti`.`id` = `prenotazioni_has_ospiti`.`ospite_id`
LEFT OUTER JOIN `prenotazioni` ON `prenotazioni`.`id` = `prenotazioni_has_ospiti`.`prenotazione_id`

GROUP BY `prenotazioni_has_ospiti`.`ospite_id`
HAVING COUNT(`prenotazioni_has_ospiti`.`ospite_id`) > '2';

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
WHERE EXTRACT(YEAR_MONTH FROM `prenotazioni`.`created_at`) = '201805';

-- 4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano

SELECT SUM(`pagamenti`.`price`) AS `earnings_1_floor`,
       `stanze`.`floor`
FROM `prenotazioni` 
INNER JOIN `stanze` ON `stanze`.`id`= `prenotazioni`.`stanza_id` 
RIGHT JOIN `pagamenti` ON `pagamenti`.`prenotazione_id`= `prenotazioni`.`id`
WHERE `stanze`.`floor` = '1';

-- 5. Prendi i dati di fatturazione per la prenotazione con id=7

-- ho lasciato tutto, filtrare in select dati, come selezionarli? voglio confrontarmi con florian.
SELECT *
FROM `pagamenti` 
INNER JOIN `prenotazioni` ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
INNER JOIN `paganti` ON `paganti`.`id`= `pagamenti`.`pagante_id`
WHERE `prenotazione_id` = '7';