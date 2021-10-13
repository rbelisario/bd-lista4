--Q1
select *
from equipe
   left join jogador on equipe.idequipe = jogador.idequipe
order by equipe.idequipe;

--Q2
select *
from uniforme,
   equipe
where uniforme.tipo = 'Titular'
   and uniforme.equipe = equipe.idequipe
   and equipe.tipo = 'Profissional'
   and equipe.estado = 'MG';

--Q3
select jogador.nome,
   naturalidade,
   equipe.nome,
   equipe.estado,
   posicao_jogador.posicao
from jogador
   left join equipe on equipe.idequipe = jogador.idequipe
   left join posicao_jogador on posicao_jogador.jogador = jogador.rg 
   
--Q4
select estado,
   avg(saldogols)
from equipe
group by estado
order by estado 

--Q5
SELECT avg(saldo_gols),
   Estado,
   Tipo
FROM equipe
GROUP BY Estado,
   Tipo;

--Q6
SELECT avg(saldo_gols),
   Estado,
   Tipo
FROM equipe
Where Tipo = "Profissional"
   AND avg(saldo_gols) BETWEEN 3 AND 10;
GROUP BY Estado;

--Q7
SELECT avg(saldo_gols),
   Estado,
   Tipo
FROM equipe
Where Tipo = "Profissional"
   AND saldo_gols > 0;
GROUP BY Estado;
-- difere na clausula de where onde ao invés de consultamos estados com média dentro de um intervalo consultamos apenas os times com saldo maior que zero de gols

--Q8
select j.rg,
   j.nome,
   j.naturalidade
from jogador j
where (
      select extract(
            year
            from j.datanascimento
         ) = '1980'
   );

--Q9
select j.rg,
   j.nome,
   j.naturalidade,
   j.datanascimento
from jogador j
where (
      select date_part('year', age(current_date, j.datanascimento)) > 30
   );

--Q10
-- Suponha que a Equipe que queremos os dados da partida seja a equipe de nome Fluminense, então temos:
select *
from partida p
where (
      select idequipe
      from equipe
      where nome in ('Fluminense')
   ) in (idequipe1, idequipe2);