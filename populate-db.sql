-- -----------------------------------------------------
-- Aggiungo utenti a User
-- -----------------------------------------------------
INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('1', 'alex', 'covizzi', 'email@email.com', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('2', 'alessio', 'morselli', 'email2', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('3', 'utente3', 'cognome3', 'email2@email.com', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('4', 'utente4', 'cognome4', 'email4', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('5', 'utente5', 'cognome5', 'email5', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('6', 'utente6', 'cognome6', 'email6', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('7', 'utente7', 'cognome7', 'email7', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('8', 'utente8', 'cognome8', 'email8', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('9', 'utente9', 'cognome9', 'email9', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('10', 'utente10', 'cognome10', 'email10', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('11', 'utente11', 'cognome11', 'email11', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`)
VALUES ('12', 'utente12', 'cognome12', 'email12', 'password', '0', '0', 'S', CURRENT_TIMESTAMP);


-- -----------------------------------------------------
-- Aggiungo editori a Publisher
-- -----------------------------------------------------

INSERT INTO `publisher` (`id`, `name`, `fl_active`) VALUES ('1', 'Mondadori', 'S');
INSERT INTO `publisher` (`id`, `name`, `fl_active`) VALUES ('2', 'DeAgostini', 'S');
INSERT INTO `publisher` (`id`, `name`, `fl_active`) VALUES ('3', 'Adelphi', 'S');
INSERT INTO `publisher` (`id`, `name`, `fl_active`) VALUES ('4', 'Ediesse', 'S');


-- -----------------------------------------------------
-- Aggiungo libri a Book
-- -----------------------------------------------------

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000000', 'titolo 0', 'descrizione 0', '21', '12.89', '2015-12-09', 'italiano', 1, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000001', 'titolo 1', 'descrizione 1', '34', '5.89', '2016-12-09', 'italiano', 2, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000002', 'titolo 2', 'descrizione 2', '67', '121.89', '2005-12-09', 'italiano', 3, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000003', 'titolo 3', 'descrizione 3', '86', '9.89', '2012-12-09', 'italiano', 4, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000004', 'titolo 4', 'descrizione 4', '45', '4.89', '2017-12-09', 'italiano', 1, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000005', 'titolo 5', 'descrizione 5', '32', '3.89', '2009-12-09', 'italiano', 4, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000006', 'titolo 6', 'descrizione 6', '25', '2.89', '1996-12-09', 'italiano', 2, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000007', 'titolo 7', 'descrizione 7', '2', '78.89', '2013-12-09', 'italiano', 3, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000008', 'titolo 8', 'descrizione 8', '78', '34.89', '2011-12-09', 'italiano', 1, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000009', 'titolo 9', 'descrizione 9', '90', '16.89', '2014-12-09', 'italiano', 4, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000010', 'titolo 10', 'descrizione 10', '121', '19.89', '2005-12-09', 'italiano', 3, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000011', 'titolo 11', 'descrizione 11', '231', '57.89', '2008-12-09', 'italiano', 2, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000012', 'titolo 12', 'descrizione 12', '36', '80.89', '2009-12-09', 'italiano', 4, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000013', 'titolo 13', 'descrizione 13', '72', '13.89', '2012-12-09', 'italiano', 2, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000014', 'titolo 14', 'descrizione 14', '189', '14.89', '2009-12-09', 'italiano', 1, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000015', 'titolo 15', 'descrizione 15', '1234', '12.89', '2005-12-09', 'italiano', 1, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000016', 'titolo 16', 'descrizione 16', '56', '13.89', '2011-12-09', 'italiano', 3, '3', CURRENT_TIMESTAMP, 'uri', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `publisher_id`, `stock`, `timestamp`, `coverURI`, `fl_active`)
VALUES ('0000000000017', 'titolo 17', 'descrizione 17', '91', '7.89', '2010-12-09', 'italiano', 2, '3', CURRENT_TIMESTAMP, 'uri', 'S');


-- -----------------------------------------------------
-- Aggiungo generi a Genre
-- -----------------------------------------------------

INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('1', 'avventura', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('2', 'horror', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('3', 'romanzo', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('4', 'biografia', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('5', 'futuristico', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('6', 'commedia', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('7', 'giallo', 'S');
INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES ('8', 'fantasy', 'S');

-- -----------------------------------------------------
-- Aggiungo autori a Author
-- -----------------------------------------------------

INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('1', 'autore1', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('2', 'autore2', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('3', 'autore3', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('4', 'autore4', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('5', 'autore5', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('6', 'autore6', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('7', 'autore7', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('8', 'autore8', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('9', 'autore9', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('10', 'autore10', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('11', 'autore11', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('12', 'autore12', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('13', 'autore13', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('14', 'autore14', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('15', 'autore15', 'S');
INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES ('16', 'autore16', 'S');

-- -----------------------------------------------------
-- Aggiungo a Book_has_Genre
-- -----------------------------------------------------

INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000000', '1');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000000', '3');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000001', '1');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000002', '5');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000002', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000003', '3');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000004', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000004', '8');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000005', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000006', '3');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000007', '5');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000007', '6');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000008', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000008', '3');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000009', '1');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000009', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000009', '4');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000010', '4');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000011', '7');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000012', '8');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000012', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000012', '1');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000013', '5');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000014', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000014', '7');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000015', '8');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000016', '7');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000016', '2');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000016', '1');
INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES ('0000000000017', '5');

-- -----------------------------------------------------
-- Aggiungo a Book_has_Author
-- -----------------------------------------------------

INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000000', '1');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000001', '5');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000002', '9');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000003', '10');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000004', '13');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000005', '1');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000006', '2');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000006', '3');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000007', '16');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000008', '15');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000009', '6');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000010', '8');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000011', '9');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000012', '3');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000013', '4');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000014', '6');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000014', '5');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000015', '10');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000016', '3');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000016', '1');
INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES ('0000000000017', '2');

-- -----------------------------------------------------
-- Aggiungo a Vote
-- -----------------------------------------------------

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000001', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000001', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000001', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('5', '0000000000001', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000001', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000001', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000001', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000002', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000002', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('12', '0000000000002', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000002', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('7', '0000000000002', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000003', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('9', '0000000000003', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000003', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000003', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000003', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000004', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000004', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000004', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000004', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('5', '0000000000004', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000005', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('10', '0000000000005', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000005', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000005', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000005', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('12', '0000000000005', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('7', '0000000000005', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000005', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('10', '0000000000006', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000006', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000007', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000007', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000007', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000007', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('5', '0000000000008', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000008', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000008', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000008', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('10', '0000000000009', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000009', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000009', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000010', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000010', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000010', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('5', '0000000000010', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000010', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000010', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000010', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('10', '0000000000011', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000011', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000012', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000013', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('2', '0000000000014', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000014', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('5', '0000000000014', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('4', '0000000000015', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000015', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000016', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('8', '0000000000016', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('1', '0000000000016', '0', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('3', '0000000000016', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`)
VALUES ('11', '0000000000017', '1', 'commento 1', CURRENT_TIMESTAMP, 'S');