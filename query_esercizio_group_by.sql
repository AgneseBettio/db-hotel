-- 1. Conta gli ospiti raggruppandoli per anno di nascita
SELECT COUNT(`id`), YEAR(`date_of_birth`)
FROM `ospiti` 
GROUP BY `date_of_birth`
ORDER BY `date_of_birth` DESC

-- 2. Somma i prezzi dei pagamenti raggruppandoli per status
SELECT SUM(`price`), `status`
FROM `pagamenti`
GROUP BY `status`

-- 3. Conta quante volte è stata prenotata ogni stanza

--4. Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti

--5. Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!)