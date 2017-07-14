-- Controllo ed inserimento dell'editore --
SELECT id
FROM publisher
WHERE (fl_active='S') AND ( name = 'nomeEditore');

INSERT INTO publisher (id, name)
VALUES (id, 'nomeEditore');

-- Inserimento del libro --
INSERT INTO book (coverURI, title, description, pages, price, publication_date, stock, isbn, language, publisher_id, timestamp)
VALUES ('coverURL', 'titolo', 'descrizione', numeroPAgine, prezzo, 'dataPubblicazione', stock, 'isbn', 'lingua', idEditore, DEFAULT);

-- Controllo ed inserimento degli autori (ognuna delle operazioni viene svolta una volta per ogni autore) --
SELECT id, name
FROM author
WHERE (fl_active='S') AND (name = 'nomeAutore');

INSERT INTO author (id, name)
VALUES (idAutore, 'nomeAutore');

INSERT INTO Book_has_author (book_isbn, author_id)
VALUES ('bookIsbn', idAutore);

----- GenreService: getIds -----
Genere 0: fantasy
SELECT *  FROM genre  WHERE ( fl_active='S'  ) AND ( name = 'fantasy'  ) ;
Select eseguita
Il resultSet ha un elemento: com.mysql.jdbc.JDBC4ResultSet@1af2c628
Generi 0 inserito! Ho trovato l'id = 4
Genere 1: ragazzi
SELECT *  FROM genre  WHERE ( fl_active='S'  ) AND ( name = 'ragazzi'  ) ;
Select eseguita
Il resultSet ha un elemento: com.mysql.jdbc.JDBC4ResultSet@39f9e8d1
Generi 1 inserito! Ho trovato l'id = 7
----- GenreService: getIds - FINE -----
Id del bookGeneri fantasy: 4
Id del bookGeneri ragazzi: 7
Scrittura dei generi del libro...
INSERT INTO Book_has_genre  ( book_isbn, genre_id  ) VALUES ( '9788804646846', 4  ) ;
INSERT INTO Book_has_genre  ( book_isbn, genre_id  ) VALUES ( '9788804646846', 7  ) ;