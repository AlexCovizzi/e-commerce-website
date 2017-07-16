-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 16, 2017 alle 16:27
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `fl_active` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `author`
--

INSERT INTO `author` (`id`, `name`, `fl_active`) VALUES
(1, 'George Martin', 'S'),
(2, 'Robert Jordan', 'S'),
(3, 'Gianni Verdura', 'S'),
(4, 'Roberto Giacobbo', 'S'),
(5, 'Hiro Mashima', 'S'),
(6, 'Licia Troisi', 'S'),
(7, 'Hajime Isayama', 'S'),
(8, 'Clive S. Lewis', 'S'),
(9, 'Giorgio Sapiente', 'S'),
(10, 'Matteo Renzi', 'S'),
(11, 'Michael Crichton', 'S'),
(12, 'Carlo Rovelli', 'S'),
(13, 'Roberto Emanuelli', 'S'),
(14, 'Arundhati Roy', 'S'),
(15, 'Nicholas Sparks', 'S'),
(16, 'Don Winslow', 'S'),
(17, 'John Grisham', 'S'),
(18, 'J. K. Rowling', 'S'),
(19, 'Jeffery Deaver', 'S'),
(20, 'Vittorio Sgarbi', 'S'),
(21, 'Gianrico Carofiglio', 'S'),
(22, 'Douglas Adams', 'S'),
(23, 'Arthur Conan Doyle', 'S');

-- --------------------------------------------------------

--
-- Struttura della tabella `book`
--

CREATE TABLE `book` (
  `isbn` varchar(13) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `pages` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(6,2) UNSIGNED NOT NULL,
  `publication_date` date DEFAULT NULL,
  `language` varchar(45) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  `coverURI` varchar(100) DEFAULT NULL,
  `fl_active` varchar(1) NOT NULL DEFAULT 'S',
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `book`
--

INSERT INTO `book` (`isbn`, `title`, `description`, `pages`, `price`, `publication_date`, `language`, `stock`, `timestamp`, `coverURI`, `fl_active`, `publisher_id`) VALUES
('1111111111111', 'Il Trono di Spade', 'Eddard Strak muore. FINE', 0, '19.99', '2012-02-15', 'Italiano', 10, '2017-06-22 13:13:38', 'https://images-na.ssl-images-amazon.com/images/I/81drW6mu1AL.jpg', 'S', 1),
('2222222222222', 'La Ruota del Tempo', '-', 0, '19.99', NULL, 'Italiano', 11, '2017-06-22 13:16:38', 'http://www.fantasymagazine.it/imgbank/splash/ARTICOLI/l_occhio_del_mondo_nuova_edizione.jpg', 'S', 1),
('3333333333333', '\0Pomodori e Peperoni', '-', 0, '19.99', NULL, 'Italiano', 13, '2017-06-23 13:14:51', '-', 'S', 2),
('9780241303986', 'The Ministry of Utmost Happiness', 'The Ministry of Utmost Happiness takes us on a journey of many years-the story spooling outwards from the cramped neighbourhoods of Old Delhi into the burgeoning new metropolis and beyond, to the Valley of Kashmir and the forests of Central India, where war is peace and peace is war, and where, from time to time, `normalcy` is declared.', 464, '17.00', '2017-01-01', 'Inglese', 6, '2017-07-15 15:16:43', 'https://img.ibs.it/images/9780241303986_0_0_400_75.jpg', 'S', 15),
('9780751565355', 'Harry Potter and the Cursed Child - Parts One and Two', 'Based on an original new story by J.K. Rowling, John Tiffany and Jack Thorne, a new play by Jack Thorne, Harry Potter and the Cursed Child is the eighth story in the Harry Potter series and the first official Harry Potter story to be presented on stage. The play will receive its world premiere in London`s West End on 30th July 2016.', 352, '22.68', '2016-01-01', 'Inglese', 24, '2017-07-15 15:22:03', 'https://img.ibs.it/images/9780751565355_0_0_200_75.jpg', 'S', 16),
('9781408708989', 'Fantastic Beasts and Where to Find Them: The Original Screenplay', 'When Magizoologist Newt Scamander arrives in New York, he intends his stay to be just a brief stopover. However, when his magical case is misplaced and some of Newt`s fantastic beasts escape, it spells trouble for everyone . . .Inspired by the original Hogwart`s textbook by Newt Scamander, Fantastic Beasts and Where to Find Them: The Original screenplay marks the screenwriting debut of J.K. Rowling, author of the beloved and internationally bestselling Harry Potter books.', 304, '19.27', '2016-01-01', 'Inglese', 26, '2017-07-15 15:21:50', 'https://img.ibs.it/images/9781408708989_0_0_200_75.jpg', 'S', 16),
('9781473663725', 'Camino Island', 'The Sunday Times `Thriller of the Month`, Mail on Sunday `Thriller of the Week` and Sun `Best for Mystery-Lovers`.John Grisham`s novels have sold over 300 million copies worldwide. CAMINO ISLAND is both an unputdownable beach read and a thriller for book lovers, beginning with a literary heist and finishing with a cat and mouse duel between a beguiling criminal and the woman set to uncover his guilt.The most daring and devastating heist in literary history targets a high security vault located deep beneath Princeton University.Valued at $25 million (though some would say priceless) the five manuscripts of F Scott Fitzgerald`s only novels are amongst the most valuable in the world.', 304, '22.68', '2017-01-01', 'Inglese', 35, '2017-07-15 15:13:25', 'https://img.ibs.it/images/9781473663725_0_0_400_75.jpg', 'S', 14),
('9788804507949', 'Ristorante al termine dell`Universo', '-', 244, '9.50', '2002-10-26', 'Italiano', 30, '2017-07-16 08:41:03', '-', 'S', 1),
('9788804646846', 'Le cronache di Narnia', 'Viaggi fino alla fine del mondo, creature fantastiche, epiche battaglie tra il bene e il male: cosa avrebbe potuto aspettarsi di più un lettore? Scritto nel 1949 da C.S. Lewis, Il leone, la strega e l`armadio inaugurò la serie dei sette volumi che sarebbero divenuti celebri come Le Cronache di Narnia. Un capolavoro che trascende il genere fantasy, ormai riconosciuto tra i classici della letteratura inglese del Novecento. C.S. Lewis lo scrisse con la dichiarata intenzione di rivolgersi ai bambini, ma non solo a loro. Era convinto, infatti, che un libro non merita di essere letto a dieci anni se non merita di essere letto anche a cinquanta. ', 842, '19.99', '2014-11-06', 'Italiano', 50, '2017-07-14 09:41:23', 'https://images-na.ssl-images-amazon.com/images/I/81iIYPAnWwL.jpg', 'S', 6),
('9788804669920', 'Cronache del mondo emerso. La saga completa', 'La speranza di pace di un intero mondo è legata al suo destino, ma Nihal della Torre di Salazar non l`avrebbe mai immaginato. Grandi occhi viola, orecchie appuntite, capelli blu e un`incredibile forza e agilità , Nihal sceglie di diventare un guerriero quando il feroce Tiranno e le sue armate di mostri e spiriti attaccano la Terra del Vento.', 990, '21.25', NULL, 'Italiano', 45, '2017-07-07 14:46:10', 'https://images-na.ssl-images-amazon.com/images/I/81A-YSQPeoL.jpg', 'S', 1),
('9788806230623', 'Corruzione', 'Dopo Il potere del cane e Il cartello un altro stupefacente affresco dell`America contemporanea. Uno squarcio epico, impareggiabile su New York e le sue profonde lacerazioni. A New York potevi aspettarti che finisse in galera chiunque. Il sindaco, il presidente degli Stati Uniti, persino il papa. Chiunque ma non il poliziotto eroe Dennis Malone. Lo sbirro che aveva messo in piedi la migliore unità dell`NYPD. Che sapeva in quali armadi erano nascosti tutti gli scheletri. Perché molti li aveva nascosti lui.', 552, '21.00', '2017-01-01', 'Italiano', 25, '2017-07-15 15:11:11', 'https://img.ibs.it/images/9788806230623_0_0_0_75.jpg', 'S', 13),
('9788807173134', 'Avanti. Perché l`Italia non si ferma', 'In questo libro Renzi parla della difficoltà di cambiare le cose ma anche dell’orgoglio di provarci. Degli errori e dei passi falsi ma anche dei risultati ottenuti e delle sfide aperte. “Questo libro non è solo un diario personale, una riflessione sulla sinistra o il programma del governo che verrà. Più di tutto, è la condivisione di idee, emozioni e speranze che spesso si sono perse nel racconto della comunicazione quotidiana. I risultati ottenuti e gli errori commessi. Il viaggio tra passato e futuro di un’Italia che non si ferma. Che vuole andare avanti.”', 240, '16.00', '2017-07-10', 'Italiano', 30, '2017-07-15 14:35:57', 'https://img.ibs.it/images/9788807173134_0_0_300_75.jpg', 'S', 7),
('9788811688235', 'La vendetta del deserto', 'Una incontrollabile sete di ricchezza. Una scoperta sepolta nella polvere. Un gioiello dal fascino letale. Harold Barnaby è un brillante egittologo, ma non avrebbe mai immaginato di poter fare una scoperta così importante. Nel decifrare un testo in geroglifici, viene a sapere di una tomba regale finora sconosciuta. Solo lui ne è al corrente, e ora è determinato a trovarla: sarà la sua fortuna. C`è un unico problema: compiere lo scavo all`insaputa delle autorità. Con l`aiuto di uno scrittore dalle molte conoscenze, di un ricco finanziatore, di un contrabbandiere e di un noto ladro internazionale, la ricerca del tesoro ha inizio.', 258, '17.60', '2017-01-01', 'Italiano', 55, '2017-07-15 14:50:02', '-', 'S', 8),
('9788817043700', 'La figlia sbagliata', 'Megan Collier è una ragazzina difficile: timida, solitaria, piena di rabbia. Rabbia soprattutto nei confronti dei genitori, Bett e Tate, divorziati da poco e troppo presi da se stessi per accorgersi di lei. Fortuna che ora c`è il dottor Peters, il suo nuovo psicanalista. Gli sono bastate poche sedute per stregare Megan: con il suo sguardo magnetico e la voce ferma e suadente, è il solo che riesca a far crollare le barriere della ragazza. Finché un giorno, all`improvviso, Megan scompare. Adesso i suoi genitori dovranno per forza accorgersi di quella figlia che non si erano mai preoccupati di conoscere, e che forse ha voluto fuggire proprio da loro.', 358, '18.50', '2010-01-01', 'Italiano', 44, '2017-07-16 08:36:44', 'https://img.ibs.it/images/9788817043700_0_0_319_75.jpg', 'S', 10),
('9788817064385', 'L` uomo del sole', 'In una cittadina del Midwest viene ritrovato il cadavere di una studentessa violentata, Jennie. Mentre si diffonde la paura di un serial killer che colpisce con la luna piena, il poliziotto incaricato dell`indagine, Bill Corde, scopre i segreti della vita sessuale della vittima, che aveva avuto relazioni con molti studenti e alcuni insegnanti dell`università. Ben presto l`indagine di Corde si intreccia alle angosce della sua vita privata: qualcuno che si firma l`uomo del sole lascia teneri biglietti a sua figlia di nove anni - che ha gravi problemi di apprendimento e vive in un mondo tutto suo - e minacce che terrorizzano sia lui sia la moglie.', 556, '19.00', '2013-12-25', 'Italiano', 28, '2017-07-16 08:43:56', 'https://img.ibs.it/images/9788817064385_0_0_788_75.jpg', 'S', 10),
('9788817068581', 'Il bordo vertiginoso delle cose', 'Un caffè al bar, una notizia di cronaca nera sul giornale, un nome che riaffiora dal passato e toglie il respiro. Enrico Vallesi è un uomo tradito dal successo del suo primo romanzo, intrappolato in un destino paradossale, che ha il sapore amaro delle occasioni mancate. Arriva però il giorno in cui sottrarsi al confronto con la memoria non è più possibile. Enrico decide allora di salire su un treno e tornare nella città dove è cresciuto, e dalla quale è scappato molti anni prima. Comincia in questo modo un avvincente viaggio di riscoperta attraverso i ricordi di un`adolescenza inquieta, in bilico fra rabbia e tenerezza.', 315, '18.50', '2013-02-19', 'Italiano', 15, '2017-07-16 08:39:54', 'https://img.ibs.it/images/9788817068581_0_0_748_75.jpg', 'S', 10),
('9788817093521', 'E allora baciami', 'L’amore, quello vero, quando arriva te ne accorgi. Ti prende dritto al cuore e alla testa, e a quel punto è già troppo tardi: il tempo, la distanza, le tempeste piccole e grandi, non c’è più niente che possa fermarlo. Ed è impossibile da dimenticare. Lo sa bene Leonardo, che l’ha sentito bruciare sulla pelle e ancora non riesce a liberarsi dai ricordi. Da quando Angela se n’è andata ha avuto tante donne, ma nessuna può sperare di prendere il suo posto. L’amore, adesso, Leonardo lo cerca nelle cose semplici: nei sorrisi soddisfatti dei clienti quando ripara le loro auto; nella musica che ascolta sulla sua Duetto d’epoca o nelle serate con gli amici di una vita.', 308, '17.50', '2017-01-01', 'Italiano', 25, '2017-07-15 15:04:53', 'https://img.ibs.it/images/9788817093521_0_0_0_75.jpg', 'S', 10),
('9788820061845', 'La vita in due', 'Come il suo protagonista, anche Nicholas Sparks si è messo in gioco e ha vinto la partita. Perché, nel romanzo La vita in due , ha saputo raccontare non solo la storia d`amore tra un uomo e una donna, ma la verità di un sentimento tanto delicato e profondo quanto l`affetto che lega un padre e una figlia.', 504, '19.90', '2017-01-01', 'Italiano', 7, '2017-07-15 15:09:24', 'https://img.ibs.it/images/9788820061845_0_0_0_75.jpg', 'S', 12),
('9788823518148', 'Il ministero della suprema felicità', '«Bellissimo romanzo. La potenza della narrativa, la grande scrittura vera. Se avete letto Il Dio delle piccole cose, questo a me è piaciuto anche di più.» Jovanotti su Instagram. «Siamo solo a metà del 2017, ma so per certo che Il ministero della suprema felicità sarà il mio libro dell’anno, e degli anni a venire.» Catherine Dunne per Vanity Fair. Il ministero della suprema felicità ci accompagna in un lungo viaggio nel vasto mondo dell’India: dagli angusti quartieri della vecchia Delhi agli scintillanti centri commerciali della nuova metropoli, fino alle valli e alle cime innevate del Kashmir dove la guerra è pace, la pace è guerra e occasionalmente viene dichiarato lo «stato di normalità». ', 496, '20.00', '2017-01-01', 'Italiano', 15, '2017-07-15 15:06:58', 'https://img.ibs.it/images/9788823518148_0_0_0_75.jpg', 'S', 11),
('9788839717078', 'L`uomo che fermò l`apocalisse', 'Chi è Stanislav Evgrafovich Petrov? Una persona anziana che vive in indigenza nella degradata periferia di Mosca. Ma anche l`uomo che ha salvato il mondo dall`annientamento: il militare russo che, all`alba del 23 settembre 1983, di fronte al segnale inequivocabile di un attacco di missili nucleari americani, decise di non fare la telefonata che avrebbe allertato i vertici, e che avrebbe dato inizio alla risposta sovietica scatenando la Terza guerra mondiale.', 238, '15.30', '2017-04-18', 'Italiano', 50, '2017-07-07 14:38:50', 'https://images-na.ssl-images-amazon.com/images/I/81Y-p%2BRSF7L.jpg', 'S', 3),
('9788845265914', 'Viaggio sentimentale nell`Italia dei desideri', 'Non leggerete in questo libro di particolari teorie sulla tutela dell`arte, ma della consapevolezza piena dei nostri tesori che troppo spesso sono guardati con insufficiente importanza, anche nei luoghi più piccoli. Quasi ogni due chilometri, infatti, girando l`Italia, è possibile ammirare, perfino nei luoghi apparentemente più degradati, spettacoli meravigliosi. Ed è questa quantità di cose misconosciute che rappresenta il percorso dell`Italia dei desideri che è proprio, come dice il concetto, il paese che uno vorrebbe sperare ci fosse. E che c`è, se hai la pazienza di scoprirlo.', 341, '20.00', '2010-05-15', 'Italiano', 16, '2017-07-16 08:38:31', 'https://img.ibs.it/images/9788845265914_0_0_282_75.jpg', 'S', 17),
('9788845931925', 'L` ordine del tempo', 'Come le Sette brevi lezioni di fisica, che ha raggiunto un pubblico immenso in ogni parte del mondo, questo libro tratta di qualcosa della fisica che parla a chiunque e lo coinvolge, semplicemente perché è un mistero di cui ciascuno ha esperienza in ogni istante: il tempo. «Pensiamo comunemente il tempo come qualcosa di semplice, fondamentale, che scorre uniforme, incurante di tutto, dal passato verso il futuro, misurato dagli orologi. Nel corso del tempo si succedono in ordine gli avvenimenti dell`universo: passati, presenti, futuri; il passato è fissato, il futuro aperto... Bene, tutto questo si è rivelato falso»', 207, '14.00', '2017-01-01', 'Italiano', 25, '2017-07-15 15:00:27', 'https://img.ibs.it/images/9788845931925_0_0_0_75.jpg', 'S', 9),
('9788864202822', 'Fairy Tail: 1', 'Natsu e il suo gatto Happy giungono nella città di Harujion, dove si dice sia arrivato un famoso mago di nome Salamander. Per qualche motivo, tuttavia, la sua ottima reputazione sembra non corrispondere alla realtà  dei fatti, dato che silenziosamente inizia ad adescare ragazze e renderle sue schiave. Nella rete finisce anche Lucy, giovane aspirante maga che sogna di entrare a far parte della mitica congregazione denominata Fairy Tail: insospettito, Natsu decide di intervenire, e scopre qualcosa di incredibile... Iniziano le fantastiche avventure di Fairy Tail, la nuova serie fantasy di Hiro Mashima!', 192, '3.66', '2014-01-20', 'Italiano', 23, '2017-07-07 14:41:08', 'https://images-na.ssl-images-amazon.com/images/I/818i0pogg4L.jpg', 'S', 4),
('9788878992559', 'Il mastino dei Baskerville', 'La prematura e improvvisa scomparsa di Sir Charles Baskerville, ultimo occupante di Baskerville Hall, induce il dottore James Mortimer a ricorrere ai servigi del più grande investigatore d`Inghilterra: Sherlock Holmes. Ma non si tratta di un semplice omicidio, questa volta c`è qualcosa di più a movimentare le indagini degli occupanti di Baker Street. Una strana e arcana maledizione che attanaglia la famiglia Baskerville da tempo quasi immemore: un cane nero, un mastino con occhi infernali che, di notte, fende la brughiera alla ricerca dell`ultimo erede di turno.', 175, '10.00', '2008-03-06', 'Italiano', 59, '2017-07-16 08:45:59', 'https://img.ibs.it/images/9788878992559_0_0_298_75.jpg', 'S', 18),
('9788891260109', 'L`attacco dei giganti: 3', 'I Giganti dentro la città stanno facendo una strage. Mikasa guida le ultime sacche di resistenza in una disperata battaglia per la sopravvivenza prima che una scelta difficile le si ponga davanti... L`incredibile avventura di Hajime Isayama continua senza lasciare respiro.', 200, '3.80', '2016-06-23', 'Italiano', 85, '2017-07-10 15:53:58', 'https://images-na.ssl-images-amazon.com/images/I/81Bm5JJ9WFL.jpg', 'S', 5),
('9788891264114', 'L`attacco dei giganti: 1', 'Eren e Mikasa vivono pacificamente ma poi ecco arrivare lui. Il Gigante Colossale darà inizio ad una guerra che l`umanità aveva dimenticato dopo più di cento anni di pace.', 200, '3.83', '2016-11-24', 'Italiano', 50, '2017-07-07 15:09:11', 'https://images-na.ssl-images-amazon.com/images/I/81XYMK8w8gL.jpg', 'S', 5);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `bookauthor`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `bookauthor` (
`book_isbn` varchar(13)
,`a_name` varchar(45)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `bookgenre`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `bookgenre` (
`book_isbn` varchar(13)
,`g_name` varchar(45)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `bookhistory`
--

CREATE TABLE `bookhistory` (
  `user_id` int(11) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `bookhistory`
--

INSERT INTO `bookhistory` (`user_id`, `book_isbn`, `timestamp`) VALUES
(1, '1111111111111', '2017-07-15 09:25:23'),
(1, '2222222222222', '2017-07-15 09:28:29'),
(1, '3333333333333', '2017-07-15 09:28:28'),
(1, '9781408708989', '2017-07-16 08:41:26'),
(1, '9788804646846', '2017-07-15 14:36:49'),
(1, '9788804669920', '2017-07-15 09:28:26'),
(1, '9788811688235', '2017-07-15 14:56:13'),
(1, '9788817093521', '2017-07-15 15:05:05'),
(1, '9788823518148', '2017-07-16 14:05:50'),
(1, '9788839717078', '2017-07-15 09:25:16'),
(1, '9788845931925', '2017-07-15 15:01:19'),
(1, '9788864202822', '2017-07-15 09:29:15'),
(1, '9788891260109', '2017-07-15 09:25:12'),
(1, '9788891264114', '2017-07-15 09:25:13'),
(2, '2222222222222', '2017-07-10 15:37:56'),
(2, '3333333333333', '2017-07-07 14:13:42'),
(2, '9781408708989', '2017-07-16 08:30:45'),
(2, '9788804669920', '2017-07-16 08:30:34'),
(2, '9788864202822', '2017-07-15 15:34:42'),
(2, '9788891264114', '2017-07-15 15:35:51'),
(6, '1111111111111', '2017-07-15 09:11:09'),
(6, '2222222222222', '2017-07-11 16:14:04'),
(6, '9788804669920', '2017-07-15 07:32:41'),
(6, '9788839717078', '2017-07-15 09:24:34'),
(6, '9788864202822', '2017-07-15 07:31:31'),
(7, '9788806230623', '2017-07-16 08:31:13'),
(7, '9788817093521', '2017-07-15 15:42:26'),
(7, '9788823518148', '2017-07-15 15:40:52'),
(8, '9788823518148', '2017-07-16 14:23:51'),
(9, '2222222222222', '2017-07-16 13:55:26'),
(9, '9788804646846', '2017-07-16 13:55:45'),
(9, '9788804669920', '2017-07-16 08:27:32'),
(9, '9788864202822', '2017-07-15 15:28:16'),
(9, '9788891260109', '2017-07-15 15:26:57'),
(12, '9781473663725', '2017-07-16 08:32:30'),
(12, '9788811688235', '2017-07-16 08:48:02'),
(12, '9788817043700', '2017-07-16 08:48:40'),
(12, '9788817064385', '2017-07-16 08:50:06'),
(12, '9788823518148', '2017-07-16 08:34:06');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `bookpublisher`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `bookpublisher` (
`book_isbn` varchar(13)
,`p_name` varchar(45)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `bookview`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `bookview` (
`isbn` varchar(13)
,`title` varchar(100)
,`description` varchar(1000)
,`pages` int(10) unsigned
,`price` decimal(6,2) unsigned
,`publication_date` date
,`language` varchar(45)
,`publisher_name` varchar(45)
,`stock` int(10) unsigned
,`vote` decimal(5,4)
,`n_votes` bigint(21)
,`coverUri` varchar(100)
,`timestamp` timestamp
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `bookvote`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `bookvote` (
`book_isbn` varchar(13)
,`thumbs_up` decimal(23,0)
,`thumbs_down` decimal(23,0)
,`total` bigint(21)
,`vote` decimal(5,4)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `book_has_author`
--

CREATE TABLE `book_has_author` (
  `book_isbn` varchar(13) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `book_has_author`
--

INSERT INTO `book_has_author` (`book_isbn`, `author_id`) VALUES
('1111111111111', 1),
('1111111111111', 9),
('2222222222222', 2),
('3333333333333', 3),
('9780241303986', 14),
('9780751565355', 18),
('9781408708989', 18),
('9781473663725', 17),
('9788804507949', 22),
('9788804646846', 8),
('9788804669920', 6),
('9788806230623', 16),
('9788807173134', 10),
('9788811688235', 11),
('9788817043700', 19),
('9788817064385', 19),
('9788817068581', 21),
('9788817093521', 13),
('9788820061845', 15),
('9788823518148', 14),
('9788839717078', 4),
('9788845265914', 20),
('9788845931925', 12),
('9788864202822', 5),
('9788878992559', 23),
('9788891260109', 7),
('9788891264114', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `book_has_genre`
--

CREATE TABLE `book_has_genre` (
  `book_isbn` varchar(13) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `book_has_genre`
--

INSERT INTO `book_has_genre` (`book_isbn`, `genre_id`) VALUES
('1111111111111', 4),
('2222222222222', 4),
('3333333333333', 13),
('3333333333333', 15),
('9780241303986', 16),
('9780751565355', 4),
('9780751565355', 7),
('9780751565355', 16),
('9781408708989', 4),
('9781408708989', 7),
('9781408708989', 16),
('9781473663725', 2),
('9788804507949', 5),
('9788804507949', 16),
('9788804646846', 4),
('9788804646846', 7),
('9788804669920', 4),
('9788804669920', 7),
('9788806230623', 1),
('9788806230623', 16),
('9788807173134', 8),
('9788807173134', 9),
('9788807173134', 11),
('9788811688235', 2),
('9788817043700', 2),
('9788817043700', 16),
('9788817064385', 2),
('9788817064385', 16),
('9788817068581', 16),
('9788817093521', 16),
('9788820061845', 16),
('9788820061845', 17),
('9788823518148', 16),
('9788839717078', 8),
('9788839717078', 10),
('9788845265914', 15),
('9788845931925', 12),
('9788864202822', 4),
('9788864202822', 14),
('9788878992559', 1),
('9788878992559', 16),
('9788891260109', 2),
('9788891260109', 4),
('9788891260109', 14),
('9788891264114', 2),
('9788891264114', 4),
('9788891264114', 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `coupon`
--

CREATE TABLE `coupon` (
  `code` char(15) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `discount` int(11) NOT NULL DEFAULT '0',
  `timestamp_c` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  `fl_active` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `coupon`
--

INSERT INTO `coupon` (`code`, `valid`, `discount`, `timestamp_c`, `fl_active`) VALUES
('123456789012345', 0, 15, '2017-07-15 14:21:44', 'S'),
('222222222222222', 1, 30, '2017-07-15 14:22:06', 'S'),
('aaaaaaaaaaaaaaa', 0, 20, '2017-06-23 13:37:13', 'S'),
('abcdefghijklmno', 1, 10, '2017-07-15 14:18:03', 'S'),
('bbbbbbbbbbbbbbb', 0, 20, '2017-06-23 13:52:48', 'S'),
('ccccccccccccccc', 0, 21, '2017-06-23 13:56:12', 'N'),
('ciaociaociaocia', 1, 50, '2017-07-15 14:22:28', 'S'),
('ddddddddddddddd', 1, 21, '2017-06-23 13:56:17', 'S');

-- --------------------------------------------------------

--
-- Struttura della tabella `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `fl_active` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `genre`
--

INSERT INTO `genre` (`id`, `name`, `fl_active`) VALUES
(1, 'giallo', 'S'),
(2, 'thriller', 'S'),
(3, 'horror', 'S'),
(4, 'fantasy', 'S'),
(5, 'fantascienza', 'S'),
(6, 'bambini', 'S'),
(7, 'ragazzi', 'S'),
(8, 'societa', 'S'),
(9, 'politica', 'S'),
(10, 'storia', 'S'),
(11, 'economia', 'S'),
(12, 'scienze', 'S'),
(13, 'cucina', 'S'),
(14, 'fumetto', 'S'),
(15, 'turismo', 'S'),
(16, 'narrativa', 'S'),
(17, 'rosa', 'S');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tot_price` decimal(6,2) UNSIGNED NOT NULL,
  `shipping_cost` decimal(6,2) NOT NULL,
  `state` varchar(45) NOT NULL,
  `coupon_code` char(15) DEFAULT NULL,
  `receiver_name` varchar(45) NOT NULL,
  `add1` varchar(45) NOT NULL,
  `add2` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `cap` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  `fl_active` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created`, `tot_price`, `shipping_cost`, `state`, `coupon_code`, `receiver_name`, `add1`, `add2`, `city`, `province`, `country`, `cap`, `timestamp`, `fl_active`) VALUES
(1, 6, '2017-07-06 14:18:10', '47.97', '0.00', 'Cancellato', 'aaaaaaaaaaaaaaa', 'Alessio Morselli', 'Vicolo Chiuso', '5', 'Serravalle a Po', 'Mantova', 'Italia', '46030', '2017-07-06 14:18:10', 'S'),
(2, 6, '2017-07-06 14:52:27', '19.99', '3.00', 'In spedizione', NULL, 'Rosa Manzoli', 'Vicolo Chiuso', '5', 'Serravalle a Po', 'Mantova', 'Italia', '46030', '2017-07-06 14:52:27', 'S'),
(3, 2, '2017-07-07 14:20:43', '39.98', '0.00', 'Consegnato', NULL, 'Luigi Buffetti', 'Vicolo Chiuso', '5', 'Serravalle a Po', 'Mantova', 'Italia', '46030', '2017-07-07 14:20:43', 'S'),
(4, 2, '2017-07-08 15:55:03', '7.32', '3.00', 'Cancellato', NULL, 'Rosa Manzoli', 'Vicolo Chiuso', '5', 'Serravalle a Po', 'Mantova', 'Italia', '46030', '2017-07-08 15:55:03', 'S'),
(5, 6, '2017-07-12 09:10:25', '15.99', '3.00', 'Cancellato', 'bbbbbbbbbbbbbbb', 'Rosa Manzoli', 'Vicolo Chiuso', '5', 'Serravalle a Po', 'Mantova', 'Italia', '46030', '2017-07-12 09:10:25', 'S'),
(6, 9, '2017-07-15 14:13:13', '31.58', '0.00', 'In spedizione', 'ccccccccccccccc', 'Sebastian Vettel', 'Via Merkel', '17', 'Francoforte', 'Francoforte', 'Germania', '17171', '2017-07-15 14:13:13', 'S'),
(7, 9, '2017-07-15 15:28:40', '207.22', '0.00', 'Cancellato', NULL, 'Sebastian Vettel', 'Via Ferrari', '17', 'Francoforte', 'Francoforte', 'Germania', '17171', '2017-07-15 15:28:40', 'S'),
(8, 12, '2017-07-16 08:49:39', '18.50', '3.00', 'In preparazione', NULL, 'Gastani Frinzi', 'Via Fasulla', '123', 'Ostiglia', 'Mantova', 'Italia', '46035', '2017-07-16 08:49:39', 'S'),
(9, 12, '2017-07-16 08:50:33', '38.00', '0.00', 'In preparazione', NULL, 'Gastani Frinzi', 'Via Fasulla', '123', 'Ostiglia', 'Mantova', 'Italia', '46035', '2017-07-16 08:50:33', 'S'),
(10, 12, '2017-07-16 08:53:17', '8.50', '3.00', 'In preparazione', '123456789012345', 'Gastani Frinzi', 'Via Fasulla', '123', 'Ostiglia', 'Mantova', 'Italia', '46035', '2017-07-16 08:53:17', 'S');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `orderview`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `orderview` (
`id` int(11)
,`user_id` int(11)
,`user_name` varchar(45)
,`user_surname` varchar(45)
,`created` timestamp
,`tot_price` decimal(6,2) unsigned
,`shipping_cost` decimal(6,2)
,`state` varchar(45)
,`coupon_code` char(15)
,`receiver_name` varchar(45)
,`add1` varchar(45)
,`add2` varchar(45)
,`city` varchar(45)
,`province` varchar(45)
,`country` varchar(45)
,`cap` varchar(45)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `order_has_book`
--

CREATE TABLE `order_has_book` (
  `book_isbn` varchar(13) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `order_has_book`
--

INSERT INTO `order_has_book` (`book_isbn`, `order_id`, `quantity`) VALUES
('1111111111111', 1, 2),
('1111111111111', 2, 1),
('1111111111111', 7, 10),
('2222222222222', 1, 1),
('2222222222222', 5, 1),
('2222222222222', 6, 2),
('3333333333333', 3, 2),
('9788817043700', 8, 1),
('9788817064385', 9, 2),
('9788864202822', 4, 2),
('9788864202822', 7, 2),
('9788878992559', 10, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `fl_active` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `fl_active`) VALUES
(1, 'Mondadori', 'S'),
(2, 'Treccani', 'S'),
(3, 'Rai Eri', 'S'),
(4, 'Star Comics', 'S'),
(5, 'Panini Comics', 'S'),
(6, 'Puzzoni Editore', 'S'),
(7, 'Feltrinelli', 'S'),
(8, 'Garzanti Libri', 'S'),
(9, 'Adelphi', 'S'),
(10, 'Rizzoli', 'S'),
(11, 'Guanda', 'S'),
(12, 'Sperling & Kupfer', 'S'),
(13, 'Einaudi', 'S'),
(14, 'Hodder & Stoughton General Division', 'S'),
(15, 'Penguin Books Ltd', 'S'),
(16, 'Little, Brown Book Group', 'S'),
(17, 'Bompiani', 'S'),
(18, 'Barbera', 'S');

-- --------------------------------------------------------

--
-- Struttura della tabella `shoppingcart_book`
--

CREATE TABLE `shoppingcart_book` (
  `user_id` int(11) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `shoppingcart_book`
--

INSERT INTO `shoppingcart_book` (`user_id`, `book_isbn`, `quantity`) VALUES
(2, '2222222222222', 1),
(6, '1111111111111', 1),
(6, '9788864202822', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `fl_active` varchar(1) NOT NULL DEFAULT 'S',
  `timestamp_c` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `is_admin`, `is_blocked`, `fl_active`, `timestamp_c`) VALUES
(1, 'Alessio', 'Morselli', 'detective.goro@giappo.it', 'conan', 1, 0, 'S', '2017-06-24 15:31:06'),
(2, 'Luigi', 'Buffetti', 'luigi.buffetti@giappo.it', 'buffetti', 0, 0, 'S', '2017-07-03 15:23:15'),
(3, 'Paola', 'Malavoglia', 'sonotriste@verga.it', 'lupini', 1, 0, 'N', '2017-07-04 13:58:25'),
(4, 'Rosso', 'Malpelo', 'ribelle94@verga.it', 'malpelo', 1, 0, 'S', '2017-07-04 14:05:57'),
(5, 'Rosa', 'Manzoli', 'rosa.manzoli@gmail.com', 'rosara', 1, 0, 'S', '2017-07-04 14:08:11'),
(6, 'Alessio', 'Morselli', 'ruggito.coniglio@giappo.it', 'coniglio', 0, 0, 'S', '2017-07-05 07:56:48'),
(7, 'Filippo', 'Solibello', 'filippo.solibello@radio.rai.it', 'radio2', 0, 0, 'S', '2017-07-11 05:56:48'),
(8, 'Gianni', 'Morandi', 'unabbraccio@giappo.it', 'manona', 0, 0, 'S', '2017-07-11 05:57:34'),
(9, 'Sebastian', 'Vettel', 'formula.uno.ferrari@gmail.com', 'ferrari', 0, 1, 'S', '2017-07-15 13:53:12'),
(10, 'Kimi', 'Raikonen', 'formula.uno.ferrari2@gmail.com', 'ferrari', 1, 0, 'S', '2017-07-15 15:32:16'),
(11, 'Gianni', 'Arnaldi', 'gianni.arnaldi@gmail.com', 'gianni', 1, 0, 'S', '2017-07-15 15:33:20'),
(12, 'Gastani', 'Frinzi', 'gastani.frinzi@gmail.com', 'gastanifrinzi', 0, 0, 'S', '2017-07-16 08:31:58');

-- --------------------------------------------------------

--
-- Struttura della tabella `vote`
--

CREATE TABLE `vote` (
  `user_id` int(11) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `thumb_up` tinyint(1) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `timestamp_c` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_active` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `vote`
--

INSERT INTO `vote` (`user_id`, `book_isbn`, `thumb_up`, `comment`, `timestamp_c`, `fl_active`) VALUES
(2, '9781408708989', 0, 'Sottotono rispetto alle sue opere originali (fidatevi, Harry Potter è tutta una altra cosa!)', '2017-07-15 15:37:51', 'S'),
(2, '9788804669920', 1, 'Ottima saga, dalla scrittrice italiana del fantasy forse più venduta anche al di fuori del nostro Paese! Consgliatissimo!', '2017-07-16 08:30:33', 'S'),
(2, '9788891264114', 1, 'Ritmo, azione e adrenalina! Tutto in un manga che si presenta come uno dei migliori degli ultimi anni! Unica nota negativa: un disegno forse troppo abbozzato!', '2017-07-15 15:35:49', 'S'),
(6, '9788864202822', 1, 'Un bel manga, leggero e divertente!', '2017-07-09 14:54:25', 'S'),
(7, '9788806230623', 1, 'Un thriller eccezionale! Fischia che emozioni!', '2017-07-15 15:40:24', 'S'),
(7, '9788817093521', 0, 'Scrittura un pochetto piatta e storia traballante! C\'è di meglio', '2017-07-15 15:41:24', 'S'),
(7, '9788823518148', 1, 'Un libro profondo, che fa riflettere su temi sociali per niente semplici!', '2017-07-15 15:40:51', 'S'),
(8, '9788823518148', 1, 'Non vi è nulla da aggiungere se non che è da leggere', '2017-07-16 14:23:49', 'S'),
(9, '2222222222222', 1, 'Un bel libro, dalla lettura scorrevole! Lo consiglio a tutti gli appassionati di fantasy.\r\nP.S.: il finale fa impazzire di curiosità!', '2017-07-16 13:55:24', 'S'),
(12, '9781473663725', 1, 'Ottimo libro!', '2017-07-16 08:32:29', 'S'),
(12, '9788811688235', 0, 'Non mi è piaciuto', '2017-07-16 08:32:59', 'S'),
(12, '9788823518148', 0, 'Un libro con buoni presupposti, ma troppo pesante in alcune parti', '2017-07-16 08:34:05', 'S');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `voteview`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `voteview` (
`book_isbn` varchar(13)
,`title` varchar(100)
,`user_id` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`thumb_up` tinyint(1)
,`comment` varchar(500)
,`timestamp_c` timestamp
);

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlist_book`
--

CREATE TABLE `wishlist_book` (
  `user_id` int(11) NOT NULL,
  `book_isbn` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wishlist_book`
--

INSERT INTO `wishlist_book` (`user_id`, `book_isbn`) VALUES
(2, '3333333333333'),
(6, '9788804669920'),
(6, '9788839717078'),
(9, '2222222222222');

-- --------------------------------------------------------

--
-- Struttura per la vista `bookauthor`
--
DROP TABLE IF EXISTS `bookauthor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookauthor`  AS  select `book_has_author`.`book_isbn` AS `book_isbn`,`author`.`name` AS `a_name` from (`book_has_author` join `author`) where ((`author`.`id` = `book_has_author`.`author_id`) and (`author`.`fl_active` = 'S')) ;

-- --------------------------------------------------------

--
-- Struttura per la vista `bookgenre`
--
DROP TABLE IF EXISTS `bookgenre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookgenre`  AS  select `book_has_genre`.`book_isbn` AS `book_isbn`,`genre`.`name` AS `g_name` from (`book_has_genre` join `genre`) where ((`genre`.`id` = `book_has_genre`.`genre_id`) and (`genre`.`fl_active` = 'S')) ;

-- --------------------------------------------------------

--
-- Struttura per la vista `bookpublisher`
--
DROP TABLE IF EXISTS `bookpublisher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookpublisher`  AS  select `b`.`isbn` AS `book_isbn`,`p`.`name` AS `p_name` from (`book` `b` join `publisher` `p`) where ((`b`.`publisher_id` = `p`.`id`) and (`p`.`fl_active` = 'S') and (`b`.`fl_active` = 'S')) ;

-- --------------------------------------------------------

--
-- Struttura per la vista `bookview`
--
DROP TABLE IF EXISTS `bookview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookview`  AS  select `b`.`isbn` AS `isbn`,`b`.`title` AS `title`,`b`.`description` AS `description`,`b`.`pages` AS `pages`,`b`.`price` AS `price`,`b`.`publication_date` AS `publication_date`,`b`.`language` AS `language`,`p`.`name` AS `publisher_name`,`b`.`stock` AS `stock`,`bv`.`vote` AS `vote`,`bv`.`total` AS `n_votes`,`b`.`coverURI` AS `coverUri`,`b`.`timestamp` AS `timestamp` from ((`book` `b` left join `bookvote` `bv` on((`bv`.`book_isbn` = `b`.`isbn`))) join `publisher` `p` on((`b`.`publisher_id` = `p`.`id`))) where ((`b`.`fl_active` = 'S') and (`p`.`fl_active` = 'S')) ;

-- --------------------------------------------------------

--
-- Struttura per la vista `bookvote`
--
DROP TABLE IF EXISTS `bookvote`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookvote`  AS  select `vote`.`book_isbn` AS `book_isbn`,sum((`vote`.`thumb_up` = 1)) AS `thumbs_up`,sum((`vote`.`thumb_up` = 0)) AS `thumbs_down`,count(0) AS `total`,avg((`vote`.`thumb_up` = 1)) AS `vote` from `vote` group by `vote`.`book_isbn` ;

-- --------------------------------------------------------

--
-- Struttura per la vista `orderview`
--
DROP TABLE IF EXISTS `orderview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderview`  AS  select `o`.`id` AS `id`,`o`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`u`.`surname` AS `user_surname`,`o`.`created` AS `created`,`o`.`tot_price` AS `tot_price`,`o`.`shipping_cost` AS `shipping_cost`,`o`.`state` AS `state`,`o`.`coupon_code` AS `coupon_code`,`o`.`receiver_name` AS `receiver_name`,`o`.`add1` AS `add1`,`o`.`add2` AS `add2`,`o`.`city` AS `city`,`o`.`province` AS `province`,`o`.`country` AS `country`,`o`.`cap` AS `cap` from (`orders` `o` join `user` `u` on((`u`.`id` = `o`.`user_id`))) where (`o`.`fl_active` = 'S') ;

-- --------------------------------------------------------

--
-- Struttura per la vista `voteview`
--
DROP TABLE IF EXISTS `voteview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voteview`  AS  select `v`.`book_isbn` AS `book_isbn`,`b`.`title` AS `title`,`v`.`user_id` AS `user_id`,`u`.`name` AS `name`,`u`.`surname` AS `surname`,`v`.`thumb_up` AS `thumb_up`,`v`.`comment` AS `comment`,`v`.`timestamp_c` AS `timestamp_c` from ((`vote` `v` join `book` `b` on((`v`.`book_isbn` = `b`.`isbn`))) join `user` `u` on((`v`.`user_id` = `u`.`id`))) where ((`b`.`fl_active` = 'S') and (`u`.`fl_active` = 'S')) ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`,`publisher_id`),
  ADD KEY `fk_Book_Publisher1_idx` (`publisher_id`);

--
-- Indici per le tabelle `bookhistory`
--
ALTER TABLE `bookhistory`
  ADD PRIMARY KEY (`user_id`,`book_isbn`),
  ADD KEY `fk_User_has_Book_Book2_idx` (`book_isbn`),
  ADD KEY `fk_User_has_Book_User2_idx` (`user_id`);

--
-- Indici per le tabelle `book_has_author`
--
ALTER TABLE `book_has_author`
  ADD PRIMARY KEY (`book_isbn`,`author_id`),
  ADD KEY `fk_Book_has_Author_Author1_idx` (`author_id`),
  ADD KEY `fk_Book_has_Author_Book1_idx` (`book_isbn`);

--
-- Indici per le tabelle `book_has_genre`
--
ALTER TABLE `book_has_genre`
  ADD PRIMARY KEY (`book_isbn`,`genre_id`),
  ADD KEY `fk_Book_has_Genre_Genre1_idx` (`genre_id`),
  ADD KEY `fk_Book_has_Genre_Book1_idx` (`book_isbn`);

--
-- Indici per le tabelle `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`code`);

--
-- Indici per le tabelle `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Order_User1_idx` (`user_id`),
  ADD KEY `fk_Order_Coupon1_idx` (`coupon_code`);

--
-- Indici per le tabelle `order_has_book`
--
ALTER TABLE `order_has_book`
  ADD PRIMARY KEY (`book_isbn`,`order_id`),
  ADD KEY `fk_Order_Book1_idx` (`book_isbn`),
  ADD KEY `fk_OrderBook_Order1_idx` (`order_id`);

--
-- Indici per le tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `shoppingcart_book`
--
ALTER TABLE `shoppingcart_book`
  ADD PRIMARY KEY (`user_id`,`book_isbn`),
  ADD KEY `fk_ShoppingCart_has_Book_Book1_idx` (`book_isbn`),
  ADD KEY `fk_ShoppingCart_has_Book_User1_idx` (`user_id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`user_id`,`book_isbn`),
  ADD KEY `fk_User_has_Book_Book3_idx` (`book_isbn`),
  ADD KEY `fk_User_has_Book_User3_idx` (`user_id`);

--
-- Indici per le tabelle `wishlist_book`
--
ALTER TABLE `wishlist_book`
  ADD PRIMARY KEY (`user_id`,`book_isbn`),
  ADD KEY `fk_User_has_Book_Book1_idx` (`book_isbn`),
  ADD KEY `fk_User_has_Book_User1_idx` (`user_id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_Book_Publisher1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `bookhistory`
--
ALTER TABLE `bookhistory`
  ADD CONSTRAINT `fk_User_has_Book_Book2` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_User_has_Book_User2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `book_has_author`
--
ALTER TABLE `book_has_author`
  ADD CONSTRAINT `fk_Book_has_Author_Author1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Book_has_Author_Book1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `book_has_genre`
--
ALTER TABLE `book_has_genre`
  ADD CONSTRAINT `fk_Book_has_Genre_Book1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Book_has_Genre_Genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Order_Coupon1` FOREIGN KEY (`coupon_code`) REFERENCES `coupon` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Order_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `order_has_book`
--
ALTER TABLE `order_has_book`
  ADD CONSTRAINT `fk_OrderBook_Order1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Order_Book1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `shoppingcart_book`
--
ALTER TABLE `shoppingcart_book`
  ADD CONSTRAINT `fk_ShoppingCart_has_Book_Book1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ShoppingCart_has_Book_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `fk_User_has_Book_Book3` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_User_has_Book_User3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `wishlist_book`
--
ALTER TABLE `wishlist_book`
  ADD CONSTRAINT `fk_User_has_Book_Book1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_User_has_Book_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
