-- 1. Conta gli ospiti raggruppandoli per anno di nascita
SELECT COUNT(`id`), YEAR(`date_of_birth`)
FROM `ospiti` 
GROUP BY `date_of_birth`
ORDER BY `date_of_birth` DESC;

-- 2. Somma i prezzi dei pagamenti raggruppandoli per status
SELECT SUM(`price`), `status`
FROM `pagamenti`
GROUP BY `status`;

-- 3. Conta quante volte è stata prenotata ogni stanza
SELECT COUNT(`stanza_id`), `stanza_id`
FROM `prenotazioni` 
GROUP BY `stanza_id`;

--4. Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti
SELECT COUNT(`id`), HOUR(`created_at`) AS `orario_prenotazione`
FROM `prenotazioni` 
GROUP BY HOUR(`created_at`)
ORDER BY COUNT(`id`) DESC;

--5. Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!)
SELECT COUNT(`prenotazione_id`) AS `n_prenotazioni`, `ospite_id` AS `nominativo_opsite`
FROM `prenotazioni_has_ospiti` 
GROUP BY `ospite_id`
ORDER by COUNT(`prenotazione_id`) DESC;