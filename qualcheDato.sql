INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`) VALUES
('1', 'Alessio', 'Morselli', 'detective.goro@giappo.it', 'conan', '1', '0', 'S', CURRENT_TIMESTAMP);

INSERT INTO genre VALUES 
("1", "giallo", "S"),
("2", "thriller", "S"),
("3", "horror", "S"),
("4", "fantasy", "S"),
("5", "fantascienza", "S"),
("6", "bambini", "S"),
("7", "ragazzi", "S"),
("8", "societa", "S"),
("9", "politica", "S"),
("10", "storia", "S"),
("11", "economia", "S"),
("12", "diritto", "S"),
("13", "cucina", "S"),
("14", "fumetto", "S"),
("15", "turismo", "S");

INSERT INTO `publisher` (`id`, `name`, `fl_active`) VALUES
(1, 'Mondadori', 'S'),
(2, 'Treccani', 'S');

INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES
(1, 'George Martin', 'S'),
(2, 'Robert Jordan', 'S'),
(3, 'Gianni Verdura', 'S');

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `stock`, `timestamp`, `coverURI`, `fl_active`, `publisher_id`) VALUES
('1111111111111', 'Il Trono di Spade', 'Eddard Strak muore. FINE', -1, '19.99', '2012-02-15', 'Italiano', 15, '2017-06-22 15:13:38', '-', 'S', 1),
('1234567890123', 'Ciaone', NULL, 100, '19.99', '1990-02-15', 'Italiano', 15, '2017-06-21 16:22:10', NULL, 'S', 1),
('2222222222222', 'La Ruota del Tempo', '-', -1, '19.99', NULL, 'Italiano', 15, '2017-06-22 15:16:38', '-', 'S', 1),
('3333333333333', 'Pomodori e Peperoni', '-', -1, '19.99', NULL, 'Italiano', 15, '2017-06-23 15:14:51', '-', 'S', 2),
('4444444444444', 'Ehilà', NULL, 550, '19.99', NULL, 'Italiano', 15, '2017-06-23 15:12:09', NULL, 'S', 1);

INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES
('1111111111111', 1),
('2222222222222', 2),
('3333333333333', 3);

INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES
('1111111111111', 4),
('2222222222222', 4),
('3333333333333', 13),
('3333333333333', 15);

INSERT INTO `coupon` (`code`, `valid`, `discount`, `timestamp_c`, `fl_active`) VALUES
('111111111111111', 1, 15, '2017-06-23 15:37:03', 'N'),
('222222222222222', 1, 20, '2017-06-23 15:52:40', 'N'),
('aaaaaaaaaaaaaaa', 1, 20, '2017-06-23 15:37:13', 'S'),
('bbbbbbbbbbbbbbb', 1, 20, '2017-06-23 15:52:48', 'S'),
('ccccccccccccccc', 1, 21, '2017-06-23 15:56:12', 'S'),
('ddddddddddddddd', 1, 21, '2017-06-23 15:56:17', 'S'),
('eeeeeeeeeeeeeee', 1, 21, '2017-06-23 15:56:22', 'N');