// ------------------------------------------------------------------
// 1. CRIANDO AS CONSTRAINTS (Garantindo que IDs não se repitam)
// ------------------------------------------------------------------
CREATE CONSTRAINT user_id_unique FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT movie_id_unique FOR (m:Movie) REQUIRE m.id IS UNIQUE;
CREATE CONSTRAINT series_id_unique FOR (s:Series) REQUIRE s.id IS UNIQUE;
CREATE CONSTRAINT actor_id_unique FOR (a:Actor) REQUIRE a.id IS UNIQUE;
CREATE CONSTRAINT director_id_unique FOR (d:Director) REQUIRE d.id IS UNIQUE;
CREATE CONSTRAINT genre_name_unique FOR (g:Genre) REQUIRE g.name IS UNIQUE;

// ------------------------------------------------------------------
// 2. POPULANDO O BANCO DE DADOS (Nós e Relacionamentos)
// ------------------------------------------------------------------
CREATE 
  // --- CRIANDO 10 USUÁRIOS ---
  (u1:User {id: 'u1', name: 'Renan'}),
  (u2:User {id: 'u2', name: 'Bruno'}),
  (u3:User {id: 'u3', name: 'Carlos'}),
  (u4:User {id: 'u4', name: 'Daniela'}),
  (u5:User {id: 'u5', name: 'Eduardo'}),
  (u6:User {id: 'u6', name: 'Fernanda'}),
  (u7:User {id: 'u7', name: 'Gabriel'}),
  (u8:User {id: 'u8', name: 'Helena'}),
  (u9:User {id: 'u9', name: 'Igor'}),
  (u10:User {id: 'u10', name: 'Julia'}),

  // --- CRIANDO 5 FILMES E 5 SÉRIES (Total 10) ---
  (m1:Movie {id: 'm1', title: 'Skyfall', releaseYear: 2012}),
  (m2:Movie {id: 'm2', title: 'Interstellar', releaseYear: 2014}),
  (m3:Movie {id: 'm3', title: 'The Dark Knight', releaseYear: 2008}),
  (m4:Movie {id: 'm4', title: 'Pulp Fiction', releaseYear: 1994}),
  (m5:Movie {id: 'm5', title: 'Gladiator', releaseYear: 2000}),

  (s1:Series {id: 's1', title: 'Breaking Bad', seasons: 5}),
  (s2:Series {id: 's2', title: 'Game of Thrones', seasons: 8}),
  (s3:Series {id: 's3', title: 'Stranger Things', seasons: 4}),
  (s4:Series {id: 's4', title: 'The Office', seasons: 9}),
  (s5:Series {id: 's5', title: 'Dark', seasons: 3}),

  // --- CRIANDO GÊNEROS, ATORES E DIRETORES ---
  (g1:Genre {name: 'Action'}),
  (g2:Genre {name: 'Sci-Fi'}),
  (g3:Genre {name: 'Drama'}),
  (g4:Genre {name: 'Comedy'}),

  (a1:Actor {id: 'a1', name: 'Daniel Craig'}),
  (a2:Actor {id: 'a2', name: 'Matthew McConaughey'}),
  (a3:Actor {id: 'a3', name: 'Bryan Cranston'}),
  (a4:Actor {id: 'a4', name: 'Emilia Clarke'}),
  
  (d1:Director {id: 'd1', name: 'Sam Mendes'}),
  (d2:Director {id: 'd2', name: 'Christopher Nolan'}),

  // --- CRIANDO OS RELACIONAMENTOS ---
  
  // Usuários -> Filmes/Séries (WATCHED)
  (u1)-[:WATCHED {rating: 5}]->(m1),
  (u1)-[:WATCHED {rating: 4}]->(s1),
  (u2)-[:WATCHED {rating: 5}]->(m2),
  (u3)-[:WATCHED {rating: 5}]->(m3),
  (u4)-[:WATCHED {rating: 5}]->(s2),
  (u5)-[:WATCHED {rating: 4}]->(m4),
  (u6)-[:WATCHED {rating: 5}]->(s3),
  (u7)-[:WATCHED {rating: 5}]->(s4),
  (u8)-[:WATCHED {rating: 4}]->(m5),
  (u9)-[:WATCHED {rating: 5}]->(s5),
  (u10)-[:WATCHED {rating: 4}]->(m1),
  (u10)-[:WATCHED {rating: 5}]->(m2),

  // Filmes/Séries -> Gêneros (IN_GENRE)
  (m1)-[:IN_GENRE]->(g1),
  (m2)-[:IN_GENRE]->(g2),
  (m3)-[:IN_GENRE]->(g1),
  (s1)-[:IN_GENRE]->(g3),
  (s4)-[:IN_GENRE]->(g4),

  // Atores -> Filmes/Séries (ACTED_IN)
  (a1)-[:ACTED_IN {role: 'James Bond'}]->(m1),
  (a2)-[:ACTED_IN {role: 'Cooper'}]->(m2),
  (a3)-[:ACTED_IN {role: 'Walter White'}]->(s1),
  (a4)-[:ACTED_IN {role: 'Daenerys'}]->(s2),

  // Diretores -> Filmes/Séries (DIRECTED)
  (d1)-[:DIRECTED]->(m1),
  (d2)-[:DIRECTED]->(m2),
  (d2)-[:DIRECTED]->(m3);