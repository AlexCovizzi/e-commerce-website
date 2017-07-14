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

-- Recupero gli id dei generi e li inserisco nella tabella che rappresenta (una volta per ogni genere selezionato) --
SELECT *
FROM genre
WHERE (fl_active='S') AND ( name = 'nomeGenere'  );

INSERT INTO Book_has_genre (book_isbn, genre_id)
VALUES ('bookIsbn', idGenere);