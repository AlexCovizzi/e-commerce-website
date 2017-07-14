/* Parametri: 
String search, 
String[] autori, 
String[] generi, 
String[] editori,
float prezzoMin, float PrezzoMax, 
int votoMin, 
String lang = 'it',
boolean disp = true,
int pagina, 
int libriPerPagina */

SELECT DISTINCT isbn, title, price, publisher_name, publication_date, stock, vote, n_votes, coverUri 
FROM BookView  
JOIN BookAuthor  AS B_A  ON ( B_A.book_isbn = isbn  )
JOIN BookGenre  AS B_G  ON ( B_G.book_isbn = isbn  )
WHERE ( title LIKE '%search%' OR isbn = 'search'  )
	AND (  a_name = 'autori[0]' OR a_name = 'autori[1]' OR [...] )
	AND (  publisher_name = 'editori[0]' OR publisher_name = 'editori[1]' OR [...] )
	AND (  g_name = 'generi[0]' OR g_name = 'generi[1]' OR [...] )
	AND (  price BETWEEN prezzoMin AND prezzoMax )
	AND (  vote >= votoMin  )
	AND ( language = 'italiano' )
	AND ( stock > 0 )

ORDER BY publication_date DESC
LIMIT libriPerPagina OFFSET libriPerPagina*pagina-libriPerPagina

-- -----------------------------------------------------
-- View `mydb`.`BookView`
-- -----------------------------------------------------
SELECT B.isbn, B.title, B.description, B.pages, B.price, B.publication_date, B.language, P.name as publisher_name, B.stock, BV.vote, BV.total as n_votes, B.coverUri, B.timestamp
FROM Book as B
LEFT JOIN BookVote as BV ON BV.book_isbn = B.isbn 
JOIN Publisher as P ON B.publisher_id = P.id
WHERE B.fl_active = 'S' AND P.fl_active = 'S';

-- -----------------------------------------------------
-- View `mydb`.`BookVote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BookVote`;
USE `mydb`;
CREATE  OR REPLACE VIEW `BookVote` AS
SELECT book_isbn, SUM(thumb_up = 1) as thumbs_up, SUM(thumb_up = 0) as thumbs_down, COUNT(*) as total, AVG(thumb_up=1) as vote
FROM Vote
GROUP BY book_isbn;