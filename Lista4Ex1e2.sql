create domain idtype as numeric(4);

create domain rgtype as numeric(9);

create table equipe (
    IdEquipe idtype,
    Nome varchar(30) NOT NULL,
    Estado varchar(2),
    Tipo varchar(20),
    SaldoGols numeric(2),
    constraint equipe_fk primary key (IdEquipe),
    constraint equipe_un unique (Nome)
);

create table joga (
    IdEquipe1 idtype,
    IdEquipe2 idtype,
    Classico boolean,
    constraint joga_pk primary key (IdEquipe1, IdEquipe2),
    constraint joga_fk1 foreign key (IdEquipe1) references equipe (IdEquipe) on delete cascade,
    constraint joga_fk2 foreign key (IdEquipe2) references equipe (IdEquipe) on delete cascade
);

create table partida (
    IdEquipe1 idtype,
    IdEquipe2 idtype,
    Data date,
    GolsEquipe1 integer,
    GolsEquipe2 integer,
    Local varchar(50),
    constraint partida_pk primary key (IdEquipe1, IdEquipe2, Data),
    constraint partida_fk foreign key (IdEquipe1, IdEquipe2) references joga (IdEquipe1, IdEquipe2) on delete cascade
);

create table jogador (
    RG rgtype,
    Nome varchar(30) NOT NULL,
    DataNascimento date,
    Naturalidade varchar(50),
    IdEquipe idtype,
    constraint jogador_pk primary key (RG),
    constraint jogador_un unique (Nome),
    constraint jogador_fk foreign key (IdEquipe) references equipe (IdEquipe) on delete
    set null
);

create table posicao_jogador (
    Jogador rgtype,
    Posicao varchar(30),
    constraint posicao_jogador_pk primary key (Jogador, Posicao)
);

create table diretor (
    Equipe idtype,
    Nome varchar(30),
    Sobrenome varchar(30),
    constraint diretor_pk primary key (Equipe, Nome, Sobrenome),
    constraint diretor_fk foreign key (Equipe) references equipe (IdEquipe) on delete cascade
);

create table uniforme (
    Equipe idtype,
    Tipo varchar(20),
    CorPrincipal varchar(20),
    constraint uniforme_pk primary key (Equipe, Tipo),
    constraint uniforme_fk foreign key (Equipe) references equipe (IdEquipe) on delete cascade 
);

insert into equipe
values (1, 'Palmeiras', 'SP', 'Profissional', 5);
insert into equipe
values (2, 'Flamengo', 'RJ', 'Profissional', 23);
insert into equipe
values (3, 'Atletico-MG', 'MG', 'Profissional', 22);
insert into equipe
values (4, 'Corinthians', 'SP', 'Profissional', 4);
insert into equipe
values (5, 'Internacional', 'RS', 'Profissional', 6);
insert into equipe
values (6, 'Serrano', 'SP', 'Amador', 0);
insert into equipe
values (7, 'Juvestus', 'SP', 'Amador', -2);
insert into equipe
values (8, '15 de Agosto', 'PB', 'Amador', -7);
insert into equipe
values (9, 'Real Esportivo', 'BA', 'Amador', -10);
insert into equipe
values (10, 'Fluminense', 'RJ', 'Profissional', -6);

insert into joga
values (1, 4, true);
insert into joga
values (5, 3, false);
insert into joga
values (6, 2, false);
insert into joga
values (7, 10, false);
insert into joga
values (8, 9, false);
insert into joga
values (1, 6, false);
insert into joga
values (7, 5, false);
insert into joga
values (8, 4, false);
insert into joga
values (9, 3, false);
insert into joga
values (10, 2, true);

insert into partida
values (1, 4, '02/10/2021', 3, 2, 'S??o Paulo - SP');
insert into partida
values (5, 3, '03/10/2021', 0, 0, 'Porto Alegre - RS');
insert into partida
values (6, 2, '09/10/2021', 1, 3, 'Belo Horizonte - MG');
insert into partida
values (7, 10, '10/10/2021', 2, 1, 'Rio de Janeiro - RJ');
insert into partida
values (8, 9, '16/10/2021', 1, 1, 'Assun????o - PB');
insert into partida
values (1, 6, '17/10/2021', 2, 0, 'Santos - SP');
insert into partida
values (7, 5, '23/10/2021', 7, 2, 'S??o Paulo - SP');
insert into partida
values (8, 4, '24/10/2021', 0, 1, 'S??o Paulo - SP');
insert into partida
values (9, 3, '25/10/2021', 1, 4, 'Sim??es Filhos - BA');
insert into partida
values (10, 2, '30/10/2021', 2, 2, 'Rio de Janeiro - RJ');

insert into jogador
values (
        274904287,
        'Marcos Tavares',
        '30/03/1980',
        'Brasileira',
        1
    );
insert into jogador
values (
        140654707,
        'L??o Matos',
        '02/04/1986',
        'Brasileira',
        2
    );
insert into jogador
values (
        475933497,
        'Wendell',
        '20/07/1993',
        'Brasileira',
        3
    );
insert into jogador
values (
        189774976,
        'Matheus Cunha',
        '27/05/1999',
        'Brasileira',
        4
    );
insert into jogador
values (
        367911413,
        'Adryan',
        '10/08/1994',
        'Brasileira',
        5
    );
insert into jogador
values (
        131894341,
        'Miranda',
        '07/07/1980',
        'Brasileira',
        6
    );
insert into jogador
values (
        266058577,
        'Luiz Araujo',
        '02/06/1996',
        'Brasileira',
        7
    );
insert into jogador
values (
        190891294,
        'Malcom',
        '26/02/1997',
        'Brasileira',
        7
    );
insert into jogador
values (
        306613037,
        'Douglas Costa',
        '14/09/1990',
        'Brasileira',
        10
    );
insert into jogador
values (
        364514802,
        'Joelinton',
        '14/08/1996',
        'Brasileira',
        10
    );

insert into posicao_jogador
values (274904287, 'Goleiro');
insert into posicao_jogador
values (140654707, 'Lateral Direito');
insert into posicao_jogador
values (475933497, 'Lateral Esquerdo');
insert into posicao_jogador
values (189774976, 'Zagueiro');
insert into posicao_jogador
values (367911413, 'Volante');
insert into posicao_jogador
values (131894341, 'Meia');
insert into posicao_jogador
values (266058577, 'Atacante');
insert into posicao_jogador
values (190891294, 'Goleiro');
insert into posicao_jogador
values (306613037, 'Zagueiro');
insert into posicao_jogador
values (364514802, 'Volante');

insert into diretor
values (1, 'Kamila', 'Alvarenga');
insert into diretor
values (2, 'Alexandre', 'Neiva');
insert into diretor
values (3, 'Yasmina', 'Cobra');
insert into diretor
values (4, 'Max', 'Furquim');
insert into diretor
values (5, 'Xavier', 'Milheir??o');
insert into diretor
values (6, 'Seerat', 'Adarga');
insert into diretor
values (7, 'Aayush', 'Lemos');
insert into diretor
values (8, 'Tyron', 'Lalanda');
insert into diretor
values (9, 'Lucas', 'Sabala');
insert into diretor
values (10, 'Brian', 'Valgueiro');

insert into uniforme
values (1, 'Titular', 'Verde');
insert into uniforme
values (2, 'Titular', 'Vermelho');
insert into uniforme
values (3, 'Titular', 'Branco');
insert into uniforme
values (4, 'Titular', 'Preto');
insert into uniforme
values (5, 'Titular', 'Azul');
insert into uniforme
values (6, 'Titular', 'Amarelo');
insert into uniforme
values (7, 'Titular', 'Cinza');
insert into uniforme
values (8, 'Titular', 'Branco');
insert into uniforme
values (9, 'Titular', 'Azul');
insert into uniforme
values (10, 'Titular', 'Rosa');