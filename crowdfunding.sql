-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2021 a las 15:54:27
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crowdfundingv2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CodCategoria` int(5) NOT NULL,
  `Descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CodCategoria`, `Descrizione`) VALUES
(1, 'Culturale'),
(2, 'Beneficenza'),
(3, 'Istruzione'),
(4, 'Assistenza Sanitaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donatore`
--

CREATE TABLE `donatore` (
  `CodDonatore` int(5) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Cognome` varchar(40) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Codice_Fiscale` varchar(16) NOT NULL,
  `Data_Nascita` date NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `CodStato_FK` int(5) NOT NULL,
  `CodRuolo_FK` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `donatore`
--

INSERT INTO `donatore` (`CodDonatore`, `Nome`, `Cognome`, `Password`, `Email`, `Codice_Fiscale`, `Data_Nascita`, `Telefono`, `CodStato_FK`, `CodRuolo_FK`) VALUES
(1, 'Donatore1', 'Cognome1', '72613ccedb809509acca538524baf255', 'donatore1@test.it', 'PCGXFF92L60F160G', '2005-05-22', '93316156', 2, 1),
(14, 'Donatore2', 'Cognome2', 'f7d3e32910438f0a4562cf2d8671da8b', 'donatore2@test.it', 'KCGXFF92L60F190G', '2000-05-06', '13316156', 5, 1),
(17, 'Donatore3', 'Cognome3', '2b1526c97f97eb2faab11ef24c1d369d', 'donatore3@test.it', 'LCGXFF92L60F140G', '2000-07-02', '63316156', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donazione`
--

CREATE TABLE `donazione` (
  `CodDonazione` int(5) NOT NULL,
  `CodDonatore_FK` int(5) NOT NULL,
  `CodProgetto_FK` int(5) NOT NULL,
  `Tipo_Pagamento` varchar(20) NOT NULL,
  `Importo` decimal(8,0) NOT NULL,
  `Data_Pagamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `donazione`
--

INSERT INTO `donazione` (`CodDonazione`, `CodDonatore_FK`, `CodProgetto_FK`, `Tipo_Pagamento`, `Importo`, `Data_Pagamento`) VALUES
(250, 1, 11, 'Carta di Credito', '30000', '2021-06-12'),
(251, 1, 11, 'Carta di Credito', '60000', '2021-06-12'),
(253, 1, 11, 'Carta di Credito', '150000', '2021-06-18'),
(254, 1, 11, 'Carta di Credito', '100000', '2021-06-18'),
(255, 1, 12, 'Carta di Credito', '10000', '2021-06-18'),
(256, 1, 12, 'Carta di Credito', '150000', '2021-06-18'),
(257, 1, 12, 'Carta di Credito', '40000', '2021-06-18'),
(258, 1, 12, 'Carta di Credito', '15000', '2021-06-18'),
(259, 1, 14, 'Bonifico', '50000', '2021-06-19'),
(260, 1, 14, 'Carta di Credito', '500000', '2021-06-19'),
(261, 1, 16, 'Carta di Credito', '90000', '2021-06-19'),
(262, 1, 10, 'Carta di Credito', '15000', '2021-06-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `immagine`
--

CREATE TABLE `immagine` (
  `CodImmagine` int(11) NOT NULL,
  `Contenuto` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `immagine`
--

INSERT INTO `immagine` (`CodImmagine`, `Contenuto`) VALUES
(2, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(20, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(21, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(22, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(23, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(25, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(26, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(27, 'https://th.bing.com/th/id/R0353e6a91a30edf365f2e42ba178f152?rik=vOe0jy3jzri0UQ&riu=http%3a%2f%2fwww.devond.com%2fwp-content%2fuploads%2f2018%2f06%2fgestione-diversit%c3%a0.jpg&ehk=UBSAvdsSKbl1T9sN%2bwPyfAa8L%2fMxGMnU0iN4%2f8Hruz4%3d&risl=&pid=ImgRaw'),
(28, 'https://www.formazionemantova.it/files/immagini/varie/mediazione_culturale.jpg'),
(29, 'https://metropolitanmagazine.it/wp-content/uploads/2019/05/giornata.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizzazione`
--

CREATE TABLE `organizzazione` (
  `CodOrganizzazione` int(5) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Descrizione` text NOT NULL,
  `Partita_Iva` varchar(15) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `organizzazione`
--

INSERT INTO `organizzazione` (`CodOrganizzazione`, `Nome`, `Descrizione`, `Partita_Iva`, `Email`, `Telefono`) VALUES
(1, 'LIBERO PENSIERO', 'L\'Associazione Nazionale del Libero Pensiero \"Giordano Bruno\" è un movimento italiano che riunisce gruppi e pensatori laici e libertari.', 'PartitaIva1', 'email@organizzazione1.it', '+32 2 788 8484'),
(2, 'Organizzazione2', 'DescrizioneOrganizzazione2', 'PartitaIva2', 'email@organizzazione2.it', '+32 2 788 8485'),
(3, 'Civico Zero', 'Sinergia con le principali realtà e servizi presenti a Roma', 'PartitaIva3', 'email@organizzazione3.it', '+32 2 788 8486');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progetto`
--

CREATE TABLE `progetto` (
  `CodProgetto` int(5) NOT NULL,
  `Descrizione` text NOT NULL,
  `Titolo` varchar(30) NOT NULL,
  `CodImmagine_FK` int(5) NOT NULL,
  `Importo_Finanziamento` decimal(8,0) NOT NULL,
  `CodOrganizzazione_FK` int(5) NOT NULL,
  `Data_Scadenza` date NOT NULL,
  `CodCategoria_FK` int(5) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `progetto`
--

INSERT INTO `progetto` (`CodProgetto`, `Descrizione`, `Titolo`, `CodImmagine_FK`, `Importo_Finanziamento`, `CodOrganizzazione_FK`, `Data_Scadenza`, `CodCategoria_FK`, `deleted`) VALUES
(0, 'Stomp si propone come un polo di innovazione musicale finalizzato a sostenere attività di\r\ntrasferimento tecnologico e di supporto all\'imprenditorialità giovanile nel settore musicale, offrendo pacchetti\r\ndi consulenza per accompagnare band e musicisti nello sviluppo della propria music idea.\r\nIn neque ipsum, maximus vel consectetur eu, luctus et velit. Ut dignissim ante libero, eu sodales ligula scelerisque id. Vestibulum non ultrices augue. Sed gravida nisl in urna tincidunt euismod. Praesent nec efficitur enim. In fringilla at justo a facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sodales ligula vel dui hendrerit commodo. In semper porttitor quam vel pulvinar. Nulla facilisi. Morbi nec hendrerit nisl, id sodales nulla. Aliquam luctus sollicitudin hendrerit.\r\n\r\nMauris hendrerit tellus vel feugiat imperdiet. Ut libero enim, varius finibus convallis sed, maximus nec ligula. Cras eget neque metus. Quisque vitae velit nec enim iaculis interdum ac et sapien. Nulla rhoncus dictum mauris et fringilla. Duis sodales rhoncus sapien ut sodales. Mauris venenatis scelerisque metus, eget sollicitudin mi. Duis luctus neque arcu, sit amet facilisis mauris dapibus viverra. Quisque vel rutrum eros. Nunc lacinia imperdiet viverra. Nullam congue rhoncus ipsum at blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rhoncus elit ut mollis eleifend.\r\n\r\nPraesent quis dignissim risus, sed imperdiet quam. Donec varius sapien neque, vel fringilla magna iaculis at. Ut ac fringilla erat. Nunc interdum, lorem quis finibus lobortis, sem ex posuere nunc, sit amet sodales velit ligula quis felis. Quisque id nulla sapien. Morbi fermentum gravida turpis eget accumsan. Ut egestas, nisi sed ornare suscipit, quam felis dapibus lacus, eget elementum metus purus sed purus. Aenean in ligula pharetra, venenatis dui at, finibus lorem. Integer molestie odio non urna blandit facilisis. Suspendisse turpis nisi, tempus eu iaculis sed, tempor a nunc.\r\n\r\nPraesent eget nisl lobortis, euismod lectus at, molestie mi. Phasellus pretium imperdiet orci vel egestas. Nulla eu aliquam sapien. Nunc nec egestas tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque felis nibh, volutpat a metus commodo, malesuada interdum ligula. In quis mi quis ligula porttitor ornare a ac neque. Sed dolor erat, dapibus a magna vel, venenatis luctus sapien. Vivamus suscipit elementum vulputate. Sed id risus purus. In hac habitasse platea dictumst. Nulla vel convallis lorem, sit amet pulvinar ex. In hac habitasse platea dictumst. Etiam at porttitor nisl.', 'S.T.O.M.P Supporting', 2, '50000', 1, '2021-07-29', 1, 0),
(9, '“Pensa, crea, suona” è un progetto di supporto ai giovani artisti che necessitano di assistenza\r\nspecialistica per la loro crescita professionale. I giovani potranno fruire di due sale prove e di registrazione,\r\noltre ad un catalogo di servizi professionali a costi calmierati effettuati da giovani professionisti under 35 in\r\nun’ottica di sinergia reciproca.\r\nIn neque ipsum, maximus vel consectetur eu, luctus et velit. Ut dignissim ante libero, eu sodales ligula scelerisque id. Vestibulum non ultrices augue. Sed gravida nisl in urna tincidunt euismod. Praesent nec efficitur enim. In fringilla at justo a facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sodales ligula vel dui hendrerit commodo. In semper porttitor quam vel pulvinar. Nulla facilisi. Morbi nec hendrerit nisl, id sodales nulla. Aliquam luctus sollicitudin hendrerit.\r\n\r\nMauris hendrerit tellus vel feugiat imperdiet. Ut libero enim, varius finibus convallis sed, maximus nec ligula. Cras eget neque metus. Quisque vitae velit nec enim iaculis interdum ac et sapien. Nulla rhoncus dictum mauris et fringilla. Duis sodales rhoncus sapien ut sodales. Mauris venenatis scelerisque metus, eget sollicitudin mi. Duis luctus neque arcu, sit amet facilisis mauris dapibus viverra. Quisque vel rutrum eros. Nunc lacinia imperdiet viverra. Nullam congue rhoncus ipsum at blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rhoncus elit ut mollis eleifend.\r\n\r\nPraesent quis dignissim risus, sed imperdiet quam. Donec varius sapien neque, vel fringilla magna iaculis at. Ut ac fringilla erat. Nunc interdum, lorem quis finibus lobortis, sem ex posuere nunc, sit amet sodales velit ligula quis felis. Quisque id nulla sapien. Morbi fermentum gravida turpis eget accumsan. Ut egestas, nisi sed ornare suscipit, quam felis dapibus lacus, eget elementum metus purus sed purus. Aenean in ligula pharetra, venenatis dui at, finibus lorem. Integer molestie odio non urna blandit facilisis. Suspendisse turpis nisi, tempus eu iaculis sed, tempor a nunc.\r\n\r\nPraesent eget nisl lobortis, euismod lectus at, molestie mi. Phasellus pretium imperdiet orci vel egestas. Nulla eu aliquam sapien. Nunc nec egestas tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque felis nibh, volutpat a metus commodo, malesuada interdum ligula. In quis mi quis ligula porttitor ornare a ac neque. Sed dolor erat, dapibus a magna vel, venenatis luctus sapien. Vivamus suscipit elementum vulputate. Sed id risus purus. In hac habitasse platea dictumst. Nulla vel convallis lorem, sit amet pulvinar ex. In hac habitasse platea dictumst. Etiam at porttitor nisl.', 'Pensa, crea, suona', 20, '500000', 2, '2021-07-16', 1, 0),
(10, 'NCT - Coordinamento campano risponde all\'esigenza di piccoli e medi teatri dei comuni della\r\nCampania di strutturare servizi di distribuzione, promozione e comunicazione di spettacoli teatrali. Al centro\r\ndell\'azione progettuale, l\'utilizzo di dimore storiche, siti archeologici, biblioteche e musei. I servizi offerti\r\nsono: supporto alla dotazione tecnica degli spazi e alla formazione di figure professionali di settore; servizi di\r\ndistribuzione di spettacoli; promozione degli spettacoli attraverso l\'incontro domanda - offerta; servizi per la\r\ncomunicazione.\r\nIn neque ipsum, maximus vel consectetur eu, luctus et velit. Ut dignissim ante libero, eu sodales ligula scelerisque id. Vestibulum non ultrices augue. Sed gravida nisl in urna tincidunt euismod. Praesent nec efficitur enim. In fringilla at justo a facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sodales ligula vel dui hendrerit commodo. In semper porttitor quam vel pulvinar. Nulla facilisi. Morbi nec hendrerit nisl, id sodales nulla. Aliquam luctus sollicitudin hendrerit.\r\n\r\nMauris hendrerit tellus vel feugiat imperdiet. Ut libero enim, varius finibus convallis sed, maximus nec ligula. Cras eget neque metus. Quisque vitae velit nec enim iaculis interdum ac et sapien. Nulla rhoncus dictum mauris et fringilla. Duis sodales rhoncus sapien ut sodales. Mauris venenatis scelerisque metus, eget sollicitudin mi. Duis luctus neque arcu, sit amet facilisis mauris dapibus viverra. Quisque vel rutrum eros. Nunc lacinia imperdiet viverra. Nullam congue rhoncus ipsum at blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rhoncus elit ut mollis eleifend.\r\n\r\nPraesent quis dignissim risus, sed imperdiet quam. Donec varius sapien neque, vel fringilla magna iaculis at. Ut ac fringilla erat. Nunc interdum, lorem quis finibus lobortis, sem ex posuere nunc, sit amet sodales velit ligula quis felis. Quisque id nulla sapien. Morbi fermentum gravida turpis eget accumsan. Ut egestas, nisi sed ornare suscipit, quam felis dapibus lacus, eget elementum metus purus sed purus. Aenean in ligula pharetra, venenatis dui at, finibus lorem. Integer molestie odio non urna blandit facilisis. Suspendisse turpis nisi, tempus eu iaculis sed, tempor a nunc.\r\n\r\nPraesent eget nisl lobortis, euismod lectus at, molestie mi. Phasellus pretium imperdiet orci vel egestas. Nulla eu aliquam sapien. Nunc nec egestas tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque felis nibh, volutpat a metus commodo, malesuada interdum ligula. In quis mi quis ligula porttitor ornare a ac neque. Sed dolor erat, dapibus a magna vel, venenatis luctus sapien. Vivamus suscipit elementum vulputate. Sed id risus purus. In hac habitasse platea dictumst. Nulla vel convallis lorem, sit amet pulvinar ex. In hac habitasse platea dictumst. Etiam at porttitor nisl.', 'Nuovo Circuito Teatrale', 21, '90000', 2, '2021-07-30', 1, 0),
(11, 'La mission del progetto è quella di trasformare la Scuola di Cinema Melies, uno dei principali\r\nprogetti dell\'Associazione OpenMind, in un centro di cultura e di sperimentazione cinematografica\r\nall\'avanguardia. L\'Associazione fornirà al socio tutte le attrezzature necessarie per la realizzazione del suo\r\nprodotto audiovisivo e un supporto legato alla ricerca delle altre risorse umane fondamentali per le varie\r\nmansioni previste per la produzione di un\'opera audiovisiva.\r\nIn neque ipsum, maximus vel consectetur eu, luctus et velit. Ut dignissim ante libero, eu sodales ligula scelerisque id. Vestibulum non ultrices augue. Sed gravida nisl in urna tincidunt euismod. Praesent nec efficitur enim. In fringilla at justo a facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sodales ligula vel dui hendrerit commodo. In semper porttitor quam vel pulvinar. Nulla facilisi. Morbi nec hendrerit nisl, id sodales nulla. Aliquam luctus sollicitudin hendrerit.\r\n\r\nMauris hendrerit tellus vel feugiat imperdiet. Ut libero enim, varius finibus convallis sed, maximus nec ligula. Cras eget neque metus. Quisque vitae velit nec enim iaculis interdum ac et sapien. Nulla rhoncus dictum mauris et fringilla. Duis sodales rhoncus sapien ut sodales. Mauris venenatis scelerisque metus, eget sollicitudin mi. Duis luctus neque arcu, sit amet facilisis mauris dapibus viverra. Quisque vel rutrum eros. Nunc lacinia imperdiet viverra. Nullam congue rhoncus ipsum at blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rhoncus elit ut mollis eleifend.\r\n\r\nPraesent quis dignissim risus, sed imperdiet quam. Donec varius sapien neque, vel fringilla magna iaculis at. Ut ac fringilla erat. Nunc interdum, lorem quis finibus lobortis, sem ex posuere nunc, sit amet sodales velit ligula quis felis. Quisque id nulla sapien. Morbi fermentum gravida turpis eget accumsan. Ut egestas, nisi sed ornare suscipit, quam felis dapibus lacus, eget elementum metus purus sed purus. Aenean in ligula pharetra, venenatis dui at, finibus lorem. Integer molestie odio non urna blandit facilisis. Suspendisse turpis nisi, tempus eu iaculis sed, tempor a nunc.\r\n\r\nPraesent eget nisl lobortis, euismod lectus at, molestie mi. Phasellus pretium imperdiet orci vel egestas. Nulla eu aliquam sapien. Nunc nec egestas tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque felis nibh, volutpat a metus commodo, malesuada interdum ligula. In quis mi quis ligula porttitor ornare a ac neque. Sed dolor erat, dapibus a magna vel, venenatis luctus sapien. Vivamus suscipit elementum vulputate. Sed id risus purus. In hac habitasse platea dictumst. Nulla vel convallis lorem, sit amet pulvinar ex. In hac habitasse platea dictumst. Etiam at porttitor nisl.', 'Méliès 3.0', 22, '600000', 2, '2021-09-01', 1, 0),
(12, 'Il progetto mira a rendere l’Associazione in grado di affrontare le nuove sfide, attraverso una\r\nserie di investimenti per valorizzare le importanti innovazioni apportate negli ultimi anni e sfruttare al meglio\r\nle possibilità che la nuova fase offre. Per questo il progetto si struttura secondo 4 aree di intervento: il\r\nconsolidamento della struttura gestionale, un piano di marketing e di differenziazione delle entrate per\r\nessere meno esposti alle oscillazioni del mercato, uno sviluppo della comunicazione e un rafforzamento della\r\nprogrammazione artistica e musicale.\r\nIn neque ipsum, maximus vel consectetur eu, luctus et velit. Ut dignissim ante libero, eu sodales ligula scelerisque id. Vestibulum non ultrices augue. Sed gravida nisl in urna tincidunt euismod. Praesent nec efficitur enim. In fringilla at justo a facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sodales ligula vel dui hendrerit commodo. In semper porttitor quam vel pulvinar. Nulla facilisi. Morbi nec hendrerit nisl, id sodales nulla. Aliquam luctus sollicitudin hendrerit.\r\n\r\nMauris hendrerit tellus vel feugiat imperdiet. Ut libero enim, varius finibus convallis sed, maximus nec ligula. Cras eget neque metus. Quisque vitae velit nec enim iaculis interdum ac et sapien. Nulla rhoncus dictum mauris et fringilla. Duis sodales rhoncus sapien ut sodales. Mauris venenatis scelerisque metus, eget sollicitudin mi. Duis luctus neque arcu, sit amet facilisis mauris dapibus viverra. Quisque vel rutrum eros. Nunc lacinia imperdiet viverra. Nullam congue rhoncus ipsum at blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rhoncus elit ut mollis eleifend.\r\n\r\nPraesent quis dignissim risus, sed imperdiet quam. Donec varius sapien neque, vel fringilla magna iaculis at. Ut ac fringilla erat. Nunc interdum, lorem quis finibus lobortis, sem ex posuere nunc, sit amet sodales velit ligula quis felis. Quisque id nulla sapien. Morbi fermentum gravida turpis eget accumsan. Ut egestas, nisi sed ornare suscipit, quam felis dapibus lacus, eget elementum metus purus sed purus. Aenean in ligula pharetra, venenatis dui at, finibus lorem. Integer molestie odio non urna blandit facilisis. Suspendisse turpis nisi, tempus eu iaculis sed, tempor a nunc.\r\n\r\nPraesent eget nisl lobortis, euismod lectus at, molestie mi. Phasellus pretium imperdiet orci vel egestas. Nulla eu aliquam sapien. Nunc nec egestas tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque felis nibh, volutpat a metus commodo, malesuada interdum ligula. In quis mi quis ligula porttitor ornare a ac neque. Sed dolor erat, dapibus a magna vel, venenatis luctus sapien. Vivamus suscipit elementum vulputate. Sed id risus purus. In hac habitasse platea dictumst. Nulla vel convallis lorem, sit amet pulvinar ex. In hac habitasse platea dictumst. Etiam at porttitor nisl.', 'Magazzino 2.0', 23, '200000', 2, '2030-01-01', 1, 0),
(14, 'Officine Carabà si propone di diventare un polo recettore e promotore di cultura declinata in\r\nforme differenti, punto di riferimento per la creazione di un festival internazionale, realtà artistica produttiva\r\ne laboratorio di idee attenta sia alle esigenze e richieste culturali locali sia alla domanda turistica\r\ninternazionale. Attraverso il consolidamento della propria struttura organizzativa, Officine Carabà punta ad\r\naffermarsi con una offerta nuova ed originale non solo nel proprio territorio di appartenenza ma anche nei\r\ncircuiti internazionali con cui è già in rete.', 'Bring up', 25, '1000000', 3, '2021-08-20', 1, 0),
(15, 'Il progetto si pone in continuità con una collaborazione strategica attivata tra due compagnie\r\nteatrali torinesi, Tedacà e Il Mulino di Amleto. Saranno avviate azioni mirate al rafforzamento e alla\r\nstabilizzazione del modello collaborativo; all’ampliamento della struttura organizzativa; al miglioramento del\r\nprocesso di distribuzione e circuitazione degli spettacoli; alla formazione del personale; alla creazione di\r\nrelazioni di qualità con altri soggetti nazionali e internazionali; all’estensione del mercato di riferimento.', ' Stabilità', 26, '500000', 1, '2021-07-15', 1, 0),
(16, 'Il  programma Fulbright promuove opportunità di studio, ricerca e insegnamento in Italia e negli Stati Uniti attraverso borse di studio per i cittadini italiani e statunitensi.\r\n\r\nÈ un programma con una lunga storia ideato nel 1946 dal Senatore J William Fulbright per favorire il processo di pace attraverso lo scambio di idee e di cultura tra gli Stati Uniti e le altre nazioni nel mondo. Attualmente il programma è presente in oltre 150 stati.\r\n\r\nIn particolare l\'iniziativa Fulbright English Teaching Assistants (ETA) rientra nel vasto programma Fulbright promosso e gestito in Italia dalla Commissione Fulbright.\r\n\r\nTale attività prevede l\'impiego di borsisti statunitensi che in qualità di assistenti di inglese svolgono la loro attività presso le scuole italiane di istruzione superiore di secondo grado. Il primo gruppo di ETA arrivò in Italia durante l\'anno scolastico 2007-2008.\r\n\r\nSono, invece, finanziate dalla Direzione generale per gli ordinamenti scolastici e la valutazione del sistema nazionale di istruzione borse di studio Fulbright per cittadini italiani che si recano negli Stati Uniti per attività di alta formazione', 'Programma Fulbright', 27, '900000', 2, '2021-07-02', 1, 0),
(17, 'Il nostro intervento si pone l’obiettivo di effettuare un’azione di contrasto, mitigazione e prevenzione rispetto alle dinamiche che coinvolgono ed espongono minori e neomaggiorenni stranieri a processi di marginalizzazione tali da generare esiti psicopatologici conclamati, abuso e dipendenza da sostanze stupefacenti e alcool e, più in generale, disagio psico-sociale.\r\n\r\nIl progetto prevede la realizzazione di un Polo Psichiatrico-Psicologico sul territorio di Roma che avrà il compito di accogliere i ragazzi, tre pomeriggi a settimana, offrendo servizi di base (pasti, servizi igienici, ecc…) e attività ludiche, per poi valutarne la vulnerabilità (in termini psicopatologici o di dipendenze) e i bisogni specifici.\r\n\r\nSulla base delle prime valutazioni, il centro disporrà l’attivazione di un eventuale intervento di supporto psicologico o l’invio per una presa in carico sociale, sanitaria, psicoterapeutica o psichiatrica.\r\n\r\nFigura chiave dell’intervento è quella del mediatore linguistico-culturale fondamentale in tutte le azioni realizzate nell’ambito dell’intervento e che, oltre a rendere possibile o facilitare la comunicazione tra beneficiario e operatore, agevola la relazione su un piano puramente qualitativo favorendo una maggiore sensazione di “prossimità” nell’utente.', 'Polo psichiatrico-psicologico ', 28, '500000', 3, '2021-07-02', 3, 0),
(18, 'Descrizione Progetto Cultura', 'Progetto Cultura', 29, '60000', 3, '2021-07-02', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruolo`
--

CREATE TABLE `ruolo` (
  `CodRuolo` int(5) NOT NULL,
  `Descrizione` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ruolo`
--

INSERT INTO `ruolo` (`CodRuolo`, `Descrizione`) VALUES
(0, 'super-admin'),
(1, 'donatore'),
(2, 'admin-update'),
(3, 'admin-delete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stato`
--

CREATE TABLE `stato` (
  `Codstato` int(16) NOT NULL,
  `Nome_Stato` varchar(128) DEFAULT NULL,
  `Sigla_Numerica_Stati` varchar(4) DEFAULT NULL,
  `Sigla_iso_3166_1_alpha_3_stati` varchar(3) DEFAULT NULL,
  `Sigla_iso_3166_1_alpha_2_stati` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stato`
--

INSERT INTO `stato` (`Codstato`, `Nome_Stato`, `Sigla_Numerica_Stati`, `Sigla_iso_3166_1_alpha_3_stati`, `Sigla_iso_3166_1_alpha_2_stati`) VALUES
(1, 'Afghanistan', '004', 'AFG', 'AF'),
(2, 'Albania', '008', 'ALB', 'AL'),
(3, 'Algeria', '012', 'DZA', 'DZ'),
(4, 'Andorra', '020', 'AND', 'AD'),
(5, 'Angola', '024', 'AGO', 'AO'),
(6, 'Anguilla', '660', 'AIA', 'AI'),
(7, 'Antartide', '010', 'ATA', 'AQ'),
(8, 'Antigua e Barbuda', '028', 'ATG', 'AG'),
(9, 'Arabia Saudita', '682', 'SAU', 'SA'),
(10, 'Argentina', '032', 'ARG', 'AR'),
(11, 'Armenia', '051', 'ARM', 'AM'),
(12, 'Aruba', '533', 'ABW', 'AW'),
(13, 'Australia', '036', 'AUS', 'AU'),
(14, 'Austria', '040', 'AUT', 'AT'),
(15, 'Azerbaigian', '031', 'AZE', 'AZ'),
(16, 'Bahamas', '044', 'BHS', 'BS'),
(17, 'Bahrein', '048', 'BHR', 'BH'),
(18, 'Bangladesh', '050', 'BGD', 'BD'),
(19, 'Barbados', '052', 'BRB', 'BB'),
(20, 'Belgio', '056', 'BEL', 'BE'),
(21, 'Belize', '084', 'BLZ', 'BZ'),
(22, 'Benin', '204', 'BEN', 'BJ'),
(23, 'Bermuda', '060', 'BMU', 'BM'),
(24, 'Bhutan', '064', 'BTN', 'BT'),
(25, 'Bielorussia', '112', 'BLR', 'BY'),
(26, 'Birmania', '104', 'MMR', 'MM'),
(27, 'Bolivia', '068', 'BOL', 'BO'),
(28, 'Bosnia ed Erzegovina', '070', 'BIH', 'BA'),
(29, 'Botswana', '072', 'BWA', 'BW'),
(30, 'Brasile', '076', 'BRA', 'BR'),
(31, 'Brunei', '096', 'BRN', 'BN'),
(32, 'Bulgaria', '100', 'BGR', 'BG'),
(33, 'Burkina Faso', '854', 'BFA', 'BF'),
(34, 'Burundi', '108', 'BDI', 'BI'),
(35, 'Cambogia', '116', 'KHM', 'KH'),
(36, 'Camerun', '120', 'CMR', 'CM'),
(37, 'Canada', '124', 'CAN', 'CA'),
(38, 'Capo Verde', '132', 'CPV', 'CV'),
(39, 'Ciad', '148', 'TCD', 'TD'),
(40, 'Cile', '152', 'CHL', 'CL'),
(41, 'Cina', '156', 'CHN', 'CN'),
(42, 'Cipro', '196', 'CYP', 'CY'),
(43, 'Citt', '336', 'VAT', 'VA'),
(44, 'Colombia', '170', 'COL', 'CO'),
(45, 'Comore', '174', 'COM', 'KM'),
(46, 'Corea del Nord', '408', 'PRK', 'KP'),
(47, 'Corea del Sud', '410', 'KOR', 'KR'),
(48, 'Costa d\'Avorio', '384', 'CIV', 'CI'),
(49, 'Costa Rica', '188', 'CRI', 'CR'),
(50, 'Croazia', '191', 'HRV', 'HR'),
(51, 'Cuba', '192', 'CUB', 'CU'),
(52, 'Cura', '531', 'CUW', 'CW'),
(53, 'Danimarca', '208', 'DNK', 'DK'),
(54, 'Dominica', '212', 'DMA', 'DM'),
(55, 'Ecuador', '218', 'ECU', 'EC'),
(56, 'Egitto', '818', 'EGY', 'EG'),
(57, 'El Salvador', '222', 'SLV', 'SV'),
(58, 'Emirati Arabi Uniti', '784', 'ARE', 'AE'),
(59, 'Eritrea', '232', 'ERI', 'ER'),
(60, 'Estonia', '233', 'EST', 'EE'),
(61, 'Etiopia', '231', 'ETH', 'ET'),
(62, 'Figi', '242', 'FJI', 'FJ'),
(63, 'Filippine', '608', 'PHL', 'PH'),
(64, 'Finlandia', '246', 'FIN', 'FI'),
(65, 'Francia', '250', 'FRA', 'FR'),
(66, 'Gabon', '266', 'GAB', 'GA'),
(67, 'Gambia', '270', 'GMB', 'GM'),
(68, 'Georgia', '268', 'GEO', 'GE'),
(69, 'Georgia del Sud e isole Sandwich meridionali', '239', 'SGS', 'GS'),
(70, 'Germania', '276', 'DEU', 'DE'),
(71, 'Ghana', '288', 'GHA', 'GH'),
(72, 'Giamaica', '388', 'JAM', 'JM'),
(73, 'Giappone', '392', 'JPN', 'JP'),
(74, 'Gibilterra', '292', 'GIB', 'GI'),
(75, 'Gibuti', '262', 'DJI', 'DJ'),
(76, 'Giordania', '400', 'JOR', 'JO'),
(77, 'Grecia', '300', 'GRC', 'GR'),
(78, 'Grenada', '308', 'GRD', 'GD'),
(79, 'Groenlandia', '304', 'GRL', 'GL'),
(80, 'Guadalupa', '312', 'GLP', 'GP'),
(81, 'Guam', '316', 'GUM', 'GU'),
(82, 'Guatemala', '320', 'GTM', 'GT'),
(83, 'Guernsey', '831', 'GGY', 'GG'),
(84, 'Guinea', '324', 'GIN', 'GN'),
(85, 'Guinea-Bissau', '624', 'GNB', 'GW'),
(86, 'Guinea Equatoriale', '226', 'GNQ', 'GQ'),
(87, 'Guyana', '328', 'GUY', 'GY'),
(88, 'Guyana francese', '254', 'GUF', 'GF'),
(89, 'Haiti', '332', 'HTI', 'HT'),
(90, 'Honduras', '340', 'HND', 'HN'),
(91, 'Hong Kong', '344', 'HKG', 'HK'),
(92, 'India', '356', 'IND', 'IN'),
(93, 'Indonesia', '360', 'IDN', 'ID'),
(94, 'Iran', '364', 'IRN', 'IR'),
(95, 'Iraq', '368', 'IRQ', 'IQ'),
(96, 'Irlanda', '372', 'IRL', 'IE'),
(97, 'Islanda', '352', 'ISL', 'IS'),
(98, 'Isola Bouvet', '074', 'BVT', 'BV'),
(99, 'Isola di Man', '833', 'IMN', 'IM'),
(100, 'Isola di Natale', '162', 'CXR', 'CX'),
(101, 'Isola Norfolk', '574', 'NFK', 'NF'),
(102, 'Isole ', '248', 'ALA', 'AX'),
(103, 'Isole BES', '535', 'BES', 'BQ'),
(104, 'Isole Cayman', '136', 'CYM', 'KY'),
(105, 'Isole Cocos (Keeling)', '166', 'CCK', 'CC'),
(106, 'Isole Cook', '184', 'COK', 'CK'),
(107, 'F', '234', 'FRO', 'FO'),
(108, 'Isole Falkland', '238', 'FLK', 'FK'),
(109, 'Isole Heard e McDonald', '334', 'HMD', 'HM'),
(110, 'Isole Marianne Settentrionali', '580', 'MNP', 'MP'),
(111, 'Isole Marshall', '584', 'MHL', 'MH'),
(112, 'Isole minori esterne degli Stati Uniti', '581', 'UMI', 'UM'),
(113, 'Isole Pitcairn', '612', 'PCN', 'PN'),
(114, 'Isole Salomone', '090', 'SLB', 'SB'),
(115, 'Isole Vergini britanniche', '092', 'VGB', 'VG'),
(116, 'Isole Vergini americane', '850', 'VIR', 'VI'),
(117, 'Israele', '376', 'ISR', 'IL'),
(118, 'Italia', '380', 'ITA', 'IT'),
(119, 'Jersey', '832', 'JEY', 'JE'),
(120, 'Kazakistan', '398', 'KAZ', 'KZ'),
(121, 'Kenya', '404', 'KEN', 'KE'),
(122, 'Kirghizistan', '417', 'KGZ', 'KG'),
(123, 'Kiribati', '296', 'KIR', 'KI'),
(124, 'Kuwait', '414', 'KWT', 'KW'),
(125, 'Laos', '418', 'LAO', 'LA'),
(126, 'Lesotho', '426', 'LSO', 'LS'),
(127, 'Lettonia', '428', 'LVA', 'LV'),
(128, 'Libano', '422', 'LBN', 'LB'),
(129, 'Liberia', '430', 'LBR', 'LR'),
(130, 'Libia', '434', 'LBY', 'LY'),
(131, 'Liechtenstein', '438', 'LIE', 'LI'),
(132, 'Lituania', '440', 'LTU', 'LT'),
(133, 'Lussemburgo', '442', 'LUX', 'LU'),
(134, 'Macao', '446', 'MAC', 'MO'),
(135, 'Macedonia', '807', 'MKD', 'MK'),
(136, 'Madagascar', '450', 'MDG', 'MG'),
(137, 'Malawi', '454', 'MWI', 'MW'),
(138, 'Malesia', '458', 'MYS', 'MY'),
(139, 'Maldive', '462', 'MDV', 'MV'),
(140, 'Mali', '466', 'MLI', 'ML'),
(141, 'Malta', '470', 'MLT', 'MT'),
(142, 'Marocco', '504', 'MAR', 'MA'),
(143, 'Martinica', '474', 'MTQ', 'MQ'),
(144, 'Mauritania', '478', 'MRT', 'MR'),
(145, 'Mauritius', '480', 'MUS', 'MU'),
(146, 'Mayotte', '175', 'MYT', 'YT'),
(147, 'Messico', '484', 'MEX', 'MX'),
(148, 'Micronesia', '583', 'FSM', 'FM'),
(149, 'Moldavia', '498', 'MDA', 'MD'),
(150, 'Mongolia', '496', 'MNG', 'MN'),
(151, 'Montenegro', '499', 'MNE', 'ME'),
(152, 'Montserrat', '500', 'MSR', 'MS'),
(153, 'Mozambico', '508', 'MOZ', 'MZ'),
(154, 'Namibia', '516', 'NAM', 'NA'),
(155, 'Nauru', '520', 'NRU', 'NR'),
(156, 'Nepal', '524', 'NPL', 'NP'),
(157, 'Nicaragua', '558', 'NIC', 'NI'),
(158, 'Niger', '562', 'NER', 'NE'),
(159, 'Nigeria', '566', 'NGA', 'NG'),
(160, 'Niue', '570', 'NIU', 'NU'),
(161, 'Norvegia', '578', 'NOR', 'NO'),
(162, 'Nuova Caledonia', '540', 'NCL', 'NC'),
(163, 'Nuova Zelanda', '554', 'NZL', 'NZ'),
(164, 'Oman', '512', 'OMN', 'OM'),
(165, 'Paesi Bassi', '528', 'NLD', 'NL'),
(166, 'Pakistan', '586', 'PAK', 'PK'),
(167, 'Palau', '585', 'PLW', 'PW'),
(168, 'Palestina', '275', 'PSE', 'PS'),
(169, 'Panam', '591', 'PAN', 'PA'),
(170, 'Papua Nuova Guinea', '598', 'PNG', 'PG'),
(171, 'Paraguay', '600', 'PRY', 'PY'),
(172, 'Per', '604', 'PER', 'PE'),
(173, 'Polinesia Francese', '258', 'PYF', 'PF'),
(174, 'Polonia', '616', 'POL', 'PL'),
(175, 'Porto Rico', '630', 'PRI', 'PR'),
(176, 'Portogallo', '620', 'PRT', 'PT'),
(177, 'Monaco', '492', 'MCO', 'MC'),
(178, 'Qatar', '634', 'QAT', 'QA'),
(179, 'Regno Unito', '826', 'GBR', 'GB'),
(180, 'RD del Congo', '180', 'COD', 'CD'),
(181, 'Rep. Ceca', '203', 'CZE', 'CZ'),
(182, 'Rep. Centrafricana', '140', 'CAF', 'CF'),
(183, 'Rep. del Congo', '178', 'COG', 'CG'),
(184, 'Rep. Dominicana', '214', 'DOM', 'DO'),
(185, 'Riunione', '638', 'REU', 'RE'),
(186, 'Romania', '642', 'ROU', 'RO'),
(187, 'Ruanda', '646', 'RWA', 'RW'),
(188, 'Russia', '643', 'RUS', 'RU'),
(189, 'Sahara Occidentale', '732', 'ESH', 'EH'),
(190, 'Saint Kitts e Nevis', '659', 'KNA', 'KN'),
(191, 'Santa Lucia', '662', 'LCA', 'LC'),
(192, 'Sant\'Elena, Ascensione e Tristan da Cunha', '654', 'SHN', 'SH'),
(193, 'Saint Vincent e Grenadine', '670', 'VCT', 'VC'),
(194, 'Saint-Barth', '652', 'BLM', 'BL'),
(195, 'Saint-Martin', '663', 'MAF', 'MF'),
(196, 'Saint-Pierre e Miquelon', '666', 'SPM', 'PM'),
(197, 'Samoa', '882', 'WSM', 'WS'),
(198, 'Samoa Americane', '016', 'ASM', 'AS'),
(199, 'San Marino', '674', 'SMR', 'SM'),
(200, 'S', '678', 'STP', 'ST'),
(201, 'Senegal', '686', 'SEN', 'SN'),
(202, 'Serbia', '688', 'SRB', 'RS'),
(203, 'Seychelles', '690', 'SYC', 'SC'),
(204, 'Sierra Leone', '694', 'SLE', 'SL'),
(205, 'Singapore', '702', 'SGP', 'SG'),
(206, 'Sint Maarten', '534', 'SXM', 'SX'),
(207, 'Siria', '760', 'SYR', 'SY'),
(208, 'Slovacchia', '703', 'SVK', 'SK'),
(209, 'Slovenia', '705', 'SVN', 'SI'),
(210, 'Somalia', '706', 'SOM', 'SO'),
(211, 'Spagna', '724', 'ESP', 'ES'),
(212, 'Sri Lanka', '144', 'LKA', 'LK'),
(213, 'Stati Uniti', '840', 'USA', 'US'),
(214, 'Sudafrica', '710', 'ZAF', 'ZA'),
(215, 'Sudan', '729', 'SDN', 'SD'),
(216, 'Sudan del Sud', '728', 'SSD', 'SS'),
(217, 'Suriname', '740', 'SUR', 'SR'),
(218, 'Svalbard e Jan Mayen', '744', 'SJM', 'SJ'),
(219, 'Svezia', '752', 'SWE', 'SE'),
(220, 'Svizzera', '756', 'CHE', 'CH'),
(221, 'Swaziland', '748', 'SWZ', 'SZ'),
(222, 'Taiwan', '158', 'TWN', 'TW'),
(223, 'Tagikistan', '762', 'TJK', 'TJ'),
(224, 'Tanzania', '834', 'TZA', 'TZ'),
(225, 'Terre australi e antartiche francesi', '260', 'ATF', 'TF'),
(226, 'Territorio britannico dell\'oceano Indiano', '086', 'IOT', 'IO'),
(227, 'Thailandia', '764', 'THA', 'TH'),
(228, 'Timor Est', '626', 'TLS', 'TL'),
(229, 'Togo', '768', 'TGO', 'TG'),
(230, 'Tokelau', '772', 'TKL', 'TK'),
(231, 'Tonga', '776', 'TON', 'TO'),
(232, 'Trinidad e Tobago', '780', 'TTO', 'TT'),
(233, 'Tunisia', '788', 'TUN', 'TN'),
(234, 'Turchia', '792', 'TUR', 'TR'),
(235, 'Turkmenistan', '795', 'TKM', 'TM'),
(236, 'Turks e Caicos', '796', 'TCA', 'TC'),
(237, 'Tuvalu', '798', 'TUV', 'TV'),
(238, 'Ucraina', '804', 'UKR', 'UA'),
(239, 'Uganda', '800', 'UGA', 'UG'),
(240, 'Ungheria', '348', 'HUN', 'HU'),
(241, 'Uruguay', '858', 'URY', 'UY'),
(242, 'Uzbekistan', '860', 'UZB', 'UZ'),
(243, 'Vanuatu', '548', 'VUT', 'VU'),
(244, 'Venezuela', '862', 'VEN', 'VE'),
(245, 'Vietnam', '704', 'VNM', 'VN'),
(246, 'Wallis e Futuna', '876', 'WLF', 'WF'),
(247, 'Yemen', '887', 'YEM', 'YE'),
(248, 'Zambia', '894', 'ZMB', 'ZM'),
(249, 'Zimbabwe', '716', 'ZWE', 'ZW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utente`
--

CREATE TABLE `utente` (
  `CodUtente` int(11) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `CodRuolo_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `utente`
--

INSERT INTO `utente` (`CodUtente`, `Nome`, `Password`, `CodRuolo_FK`) VALUES
(1, 'super admin', '21232f297a57a5a743894a0e4a801fc3', 0),
(2, 'admin-rimozione', '21232f297a57a5a743894a0e4a801fc3', 3),
(3, 'admin-aggiornamento', '21232f297a57a5a743894a0e4a801fc3', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CodCategoria`);

--
-- Indices de la tabla `donatore`
--
ALTER TABLE `donatore`
  ADD PRIMARY KEY (`CodDonatore`),
  ADD KEY `CodStato_FK` (`CodStato_FK`),
  ADD KEY `CodRuolo` (`CodRuolo_FK`);

--
-- Indices de la tabla `donazione`
--
ALTER TABLE `donazione`
  ADD PRIMARY KEY (`CodDonazione`),
  ADD KEY `CodProgetto_FK` (`CodProgetto_FK`),
  ADD KEY `donazione_ibfk_1` (`CodDonatore_FK`);

--
-- Indices de la tabla `immagine`
--
ALTER TABLE `immagine`
  ADD PRIMARY KEY (`CodImmagine`);

--
-- Indices de la tabla `organizzazione`
--
ALTER TABLE `organizzazione`
  ADD PRIMARY KEY (`CodOrganizzazione`);

--
-- Indices de la tabla `progetto`
--
ALTER TABLE `progetto`
  ADD PRIMARY KEY (`CodProgetto`),
  ADD KEY `progetto_ibfk_1` (`CodImmagine_FK`),
  ADD KEY `progetto_ibfk_2` (`CodOrganizzazione_FK`),
  ADD KEY `progetto_ibfk_3` (`CodCategoria_FK`);

--
-- Indices de la tabla `ruolo`
--
ALTER TABLE `ruolo`
  ADD PRIMARY KEY (`CodRuolo`);

--
-- Indices de la tabla `stato`
--
ALTER TABLE `stato`
  ADD PRIMARY KEY (`Codstato`),
  ADD KEY `PRIMARY_KEY` (`Codstato`);

--
-- Indices de la tabla `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`CodUtente`),
  ADD KEY `CodRuolo_FK` (`CodRuolo_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CodCategoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `donatore`
--
ALTER TABLE `donatore`
  MODIFY `CodDonatore` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `donazione`
--
ALTER TABLE `donazione`
  MODIFY `CodDonazione` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT de la tabla `immagine`
--
ALTER TABLE `immagine`
  MODIFY `CodImmagine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `organizzazione`
--
ALTER TABLE `organizzazione`
  MODIFY `CodOrganizzazione` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `progetto`
--
ALTER TABLE `progetto`
  MODIFY `CodProgetto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ruolo`
--
ALTER TABLE `ruolo`
  MODIFY `CodRuolo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `stato`
--
ALTER TABLE `stato`
  MODIFY `Codstato` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT de la tabla `utente`
--
ALTER TABLE `utente`
  MODIFY `CodUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `donatore`
--
ALTER TABLE `donatore`
  ADD CONSTRAINT `CodRuolo` FOREIGN KEY (`CodRuolo_FK`) REFERENCES `ruolo` (`CodRuolo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `progetto`
--
ALTER TABLE `progetto`
  ADD CONSTRAINT `progetto_ibfk_1` FOREIGN KEY (`CodImmagine_FK`) REFERENCES `immagine` (`CodImmagine`) ON UPDATE CASCADE,
  ADD CONSTRAINT `progetto_ibfk_2` FOREIGN KEY (`CodOrganizzazione_FK`) REFERENCES `organizzazione` (`CodOrganizzazione`) ON UPDATE CASCADE,
  ADD CONSTRAINT `progetto_ibfk_3` FOREIGN KEY (`CodCategoria_FK`) REFERENCES `categoria` (`CodCategoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `CodRuolo_FK` FOREIGN KEY (`CodRuolo_FK`) REFERENCES `ruolo` (`CodRuolo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
