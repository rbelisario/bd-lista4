-- Exercicio 4a
-- quando não é explicitado um valor default, é usado como padrão null
-- não faz sentido utilizar default quando o atributo faz parte da chave, pois ela deve ser unica
insert into equipe
values (11, 'exemploFC', null, default, default);
insert into joga
values (5, 10, default);

-- O codigo comentado abaixo não roda pois os ids da equipe devem ser nao nulos
/*
 insert into joga
 values (default, default, default);
 */

insert into partida
values (5, 10, '02/10/2021', default, default, null);

/*inserindo um jogador exemplo sem equipe*/
insert into jogador
values (
        958426157,
        'Jogador Exemplo',
        default,
        default,
        null
    );
insert into posicao_jogador
values (958426157, 'Atacante');
insert into diretor
values (11, 'Diretor', 'Exemplo');
insert into uniforme
values (11, 'Titular', default);

-- Exercicio 4b
delete from equipe where idequipe = 1;
/*
 tabela equipe: linha da equipe removida 
 tabela JOGADOR: idequipe do jogador cuja equipe foi removida modificada pra null,
 tabela UNIFORME: uniformes da equipe que foi removida também são removidos,
 tabela DIRETOR: diretor da equipe removida também foi removido
 tabela JOGA: jogos que a equipe removida tenha participado também são removidos
 tabela PARTIDA: partidas que a equipe removida tenha participado tambpem são removidas
 */

-- Exercicio 4c
ALTER TABLE "UNIFORME" DROP CONSTRAINT "uniforme_fk";
ALTER TABLE "UNIFORME" ADD CONSTRAINT "uniforme_fk" FOREIGN KEY ("IdEquipe")
REFERENCES Equipe ("IdEquipe") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "DIRETOR" DROP CONSTRAINT "diretor_fk";
ALTER TABLE "DIRETOR" ADD CONSTRAINT "diretor_fk" FOREIGN KEY ("IdEquipe")
REFERENCES Equipe ("IdEquipe") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "JOGADOR" DROP CONSTRAINT "jogador_fk";
ALTER TABLE "JOGADOR" ADD CONSTRAINT "jogador_fk" FOREIGN KEY ("IdEquipe")
REFERENCES Equipe ("IdEquipe") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "Partida" DROP CONSTRAINT "partida_fk";
ALTER TABLE "Partida" ADD CONSTRAINT "partida_fk" FOREIGN KEY ("IdEquipe1, IdEquipe2")
REFERENCES Joga ("IdEquipe1, IdEquipe2") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "JOGA" DROP CONSTRAINT "joga_fk1";
ALTER TABLE "JOGA" DROP CONSTRAINT "joga_fk2";
ALTER TABLE "JOGA" ADD CONSTRAINT "joga_fk1" FOREIGN KEY ("IdEquipe")
REFERENCES Equipe ("IdEquipe") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "JOGA" ADD CONSTRAINT "joga_fk2" FOREIGN KEY ("IdEquipe")
REFERENCES Equipe ("IdEquipe") ON DELETE CASCADE ON UPDATE CASCADE;