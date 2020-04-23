-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 24 2020 г., 01:30
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `fw`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent`) VALUES
(685, 'Комплектующие к Apple', 0),
(691, 'Запчасти iPad', 685),
(692, 'Запчасти iPhone', 685),
(693, 'Запчасти iPod', 685),
(694, 'Запчасти Mac', 685),
(695, 'iPad', 691),
(696, 'iPad 2', 691),
(697, 'iPad NEW (iPad 3)', 691),
(698, 'iPad 4', 691),
(699, 'iPad mini', 691),
(700, 'iPhone', 692),
(701, 'iPhone 3G/3GS', 692),
(702, 'iPhone 4', 692),
(703, 'iPhone 4S', 692),
(704, 'iPhone 5', 692),
(705, 'Микросхемы Apple', 685),
(836, 'Защитные плёнки на Apple', 0),
(840, 'iPad', 836),
(841, 'iPhone', 836),
(842, 'iPod', 836),
(843, 'Mac', 836),
(853, 'Оборудование для ремонта Apple', 0),
(876, 'Аксессуары для Apple', 0),
(877, 'Аксессуары iPad', 876),
(878, 'Аксессуары iPhone', 876),
(879, 'Аксессуары iPod', 876),
(880, 'Аксессуары Mac', 876),
(881, 'iPad', 877),
(882, 'iPad 2', 877),
(883, 'iPad NEW 3 / iPad 4', 877),
(884, 'iPad mini', 877),
(885, 'iPhone 3G / 3GS', 878),
(886, 'iPhone 4 / 4S', 878),
(887, 'iPhone 5', 878),
(888, 'Аксессуары для Apple', 876),
(895, 'iPhone 5 Lamborghini', 878);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Категория 1'),
(2, 'Category 2'),
(3, 'Категория 3'),
(4, 'Category 3'),
(5, 'Категория 3'),
(6, 'Категория 3');

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `base` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `code`, `title`, `base`) VALUES
(1, 'ru', 'Русский', 1),
(2, 'en', 'English', 0),
(3, 'ua', 'Українська', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `page_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`page_id`, `title`, `alias`, `description`, `keywords`, `text`, `position`) VALUES
(1, 'Главная', 'index', 'Описание главной', 'ключевики главной', 'Текст главной страницы', 1),
(2, 'О компании', 'about', 'Описание о компании', 'ключевики о компании', 'Текст страницы о компании', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `short_content` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `preview` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `date`, `short_content`, `content`, `preview`, `author_name`, `type`) VALUES
(1, 'Новости Украины', '2016-06-03', 'Последние события', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, neque assumenda dolores quasi id tempora nisi minus, facilis corrupti inventore aspernatur unde? Consequatur delectus quis quia voluptatem inventore molestias reprehenderit id consequuntur nobis ipsa ullam labore ea dignissimos, non laudantium, quaerat velit reiciendis tenetur ducimus aspernatur impedit pariatur cum? Deleniti cum obcaecati esse consectetur, corporis deserunt doloribus laudantium tempore distinctio labore libero iste in aspernatur ex dignissimos soluta iusto aliquid ea nulla incidunt? Ullam quis ipsam minima repudiandae. Corporis hic, necessitatibus, sapiente expedita tempore quas eum sed iste accusamus nemo fugiat voluptatem minus similique rem eius officiis nostrum voluptatibus voluptas quia aliquam non? Cum, laborum quae odio sequi nisi perferendis doloribus alias qui commodi sunt nobis quasi? Voluptate fugiat fuga asperiores illum exercitationem nemo. Delectus sequi quidem expedita, dolorem dolores inventore voluptates nemo asperiores praesentium, eius sapiente quod reprehenderit eveniet incidunt magnam eaque quaerat libero ducimus ad illum minima consequuntur minus. Dolorem at vel odit?</p>', '/images.jpg', 'Victor', 'NewsPublication'),
(2, 'Новости Харькова', '2016-06-03', 'Важные события', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, neque assumenda dolores quasi id tempora nisi minus, facilis corrupti inventore aspernatur unde? Consequatur delectus quis quia voluptatem inventore molestias reprehenderit id consequuntur nobis ipsa ullam labore ea dignissimos, non laudantium, quaerat velit reiciendis tenetur ducimus aspernatur impedit pariatur cum? Deleniti cum obcaecati esse consectetur, corporis deserunt doloribus laudantium tempore distinctio labore libero iste in aspernatur ex dignissimos soluta iusto aliquid ea nulla incidunt? Ullam quis ipsam minima repudiandae. Corporis hic, necessitatibus, sapiente expedita tempore quas eum sed iste accusamus nemo fugiat voluptatem minus similique rem eius officiis nostrum voluptatibus voluptas quia aliquam non? Cum, laborum quae odio sequi nisi perferendis doloribus alias qui commodi sunt nobis quasi? Voluptate fugiat fuga asperiores illum exercitationem nemo. Delectus sequi quidem expedita, dolorem dolores inventore voluptates nemo asperiores praesentium, eius sapiente quod reprehenderit eveniet incidunt magnam eaque quaerat libero ducimus ad illum minima consequuntur minus. Dolorem at vel odit?</p>', '/images.jpg', 'Василий', 'NewsPublication'),
(3, 'Евро 2016', '2016-06-10', 'Сегодняшние матчи', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, neque assumenda dolores quasi id tempora nisi minus, facilis corrupti inventore aspernatur unde? Consequatur delectus quis quia voluptatem inventore molestias reprehenderit id consequuntur nobis ipsa ullam labore ea dignissimos, non laudantium, quaerat velit reiciendis tenetur ducimus aspernatur impedit pariatur cum? Deleniti cum obcaecati esse consectetur, corporis deserunt doloribus laudantium tempore distinctio labore libero iste in aspernatur ex dignissimos soluta iusto aliquid ea nulla incidunt? Ullam quis ipsam minima repudiandae. Corporis hic, necessitatibus, sapiente expedita tempore quas eum sed iste accusamus nemo fugiat voluptatem minus similique rem eius officiis nostrum voluptatibus voluptas quia aliquam non? Cum, laborum quae odio sequi nisi perferendis doloribus alias qui commodi sunt nobis quasi? Voluptate fugiat fuga asperiores illum exercitationem nemo. Delectus sequi quidem expedita, dolorem dolores inventore voluptates nemo asperiores praesentium, eius sapiente quod reprehenderit eveniet incidunt magnam eaque quaerat libero ducimus ad illum minima consequuntur minus. Dolorem at vel odit?</p>', '/images.jpg', 'Слава', 'PhotoPublication'),
(4, 'Новости экономики', '2016-06-10', 'Курс валют на сегодня', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, neque assumenda dolores quasi id tempora nisi minus, facilis corrupti inventore aspernatur unde? Consequatur delectus quis quia voluptatem inventore molestias reprehenderit id consequuntur nobis ipsa ullam labore ea dignissimos, non laudantium, quaerat velit reiciendis tenetur ducimus aspernatur impedit pariatur cum? Deleniti cum obcaecati esse consectetur, corporis deserunt doloribus laudantium tempore distinctio labore libero iste in aspernatur ex dignissimos soluta iusto aliquid ea nulla incidunt? Ullam quis ipsam minima repudiandae. Corporis hic, necessitatibus, sapiente expedita tempore quas eum sed iste accusamus nemo fugiat voluptatem minus similique rem eius officiis nostrum voluptatibus voluptas quia aliquam non? Cum, laborum quae odio sequi nisi perferendis doloribus alias qui commodi sunt nobis quasi? Voluptate fugiat fuga asperiores illum exercitationem nemo. Delectus sequi quidem expedita, dolorem dolores inventore voluptates nemo asperiores praesentium, eius sapiente quod reprehenderit eveniet incidunt magnam eaque quaerat libero ducimus ad illum minima consequuntur minus. Dolorem at vel odit?</p>', '/images.jpg', 'Зигмунд', 'ArticlePublication'),
(5, 'Погода', '2016-06-15', 'Завтра дожди', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, neque assumenda dolores quasi id tempora nisi minus, facilis corrupti inventore aspernatur unde? Consequatur delectus quis quia voluptatem inventore molestias reprehenderit id consequuntur nobis ipsa ullam labore ea dignissimos, non laudantium, quaerat velit reiciendis tenetur ducimus aspernatur impedit pariatur cum? Deleniti cum obcaecati esse consectetur, corporis deserunt doloribus laudantium tempore distinctio labore libero iste in aspernatur ex dignissimos soluta iusto aliquid ea nulla incidunt? Ullam quis ipsam minima repudiandae. Corporis hic, necessitatibus, sapiente expedita tempore quas eum sed iste accusamus nemo fugiat voluptatem minus similique rem eius officiis nostrum voluptatibus voluptas quia aliquam non? Cum, laborum quae odio sequi nisi perferendis doloribus alias qui commodi sunt nobis quasi? Voluptate fugiat fuga asperiores illum exercitationem nemo. Delectus sequi quidem expedita, dolorem dolores inventore voluptates nemo asperiores praesentium, eius sapiente quod reprehenderit eveniet incidunt magnam eaque quaerat libero ducimus ad illum minima consequuntur minus. Dolorem at vel odit?</p>', '/images.jpg', 'Сергей', 'PhotoPublication');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'empty_thumb.jpg',
  `price` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `parent`, `content`, `image`, `price`) VALUES
(7582, 'LCD iPod Touch ', 693, '', 'empty_thumb.jpg', 22),
(7583, 'Len+Touchscreen iPod Touch ', 693, '', 'empty_thumb.jpg', 12),
(8833, 'Аккумулятор iPod Touch 1G ', 693, '', 'empty_thumb.jpg', 7.3),
(8834, 'Аккумулятор iPod Touch 2G ', 693, '', 'empty_thumb.jpg', 7.7),
(8935, 'Len+Touchscreen iPod Touch 2G', 693, '', 'empty_thumb.jpg', 15),
(8989, 'LCD iPod Touch 2G', 693, '', 'empty_thumb.jpg', 12),
(9087, 'Buzzer iPod Nano 5G', 693, '', 'empty_thumb.jpg', 2.7),
(9352, 'LCD iPod Nano 4G', 693, '', 'empty_thumb.jpg', 14),
(9353, 'Len iPod Nano 4G', 693, '', 'empty_thumb.jpg', 5.3),
(9508, 'Аккумулятор iPod Nano 2G', 693, '', 'empty_thumb.jpg', 7),
(9509, 'Аккумулятор iPod Nano 3G', 693, '', 'empty_thumb.jpg', 8.5),
(9918, 'LCD iPod Touch 4G+Touchscreen (black)', 693, '', 'empty_thumb.jpg', 24),
(9967, 'LCD iPod Nano 5G', 693, '', 'empty_thumb.jpg', 14),
(10390, 'LCD iPod Nano 6G', 693, '<p>\r\n	only lcd</p>\r\n', 'empty_thumb.jpg', 16),
(10486, 'Flat сable iPod nano 6G with on/off button and volume', 693, '', 'empty_thumb.jpg', 10.1),
(10733, 'Housing Cover iPod nano 3G (silver)', 693, '', 'empty_thumb.jpg', 8.5),
(11062, 'LCD iPod Touch 4G+Touchscreen (white)', 693, '', 'empty_thumb.jpg', 23),
(11629, 'Flat Cable on/off iPod touch 4G', 693, '', 'empty_thumb.jpg', 8.5),
(11630, 'Аккумулятор iPod Classic 616-0232(160gb)', 693, '', 'empty_thumb.jpg', 9),
(12100, 'LCD iPod Nano 2G', 693, '', 'empty_thumb.jpg', 14),
(12145, 'LCD iPod Nano 6G module', 693, '', 'empty_thumb.jpg', 50),
(12147, 'On/off outside home iPod Touch 4G (black)', 693, '', 'empty_thumb.jpg', 4),
(12148, 'On/off outside home iPod Touch 4G (white)', 693, '', 'empty_thumb.jpg', 4),
(12217, 'Аккумулятор iPod Nano 6G', 693, '', 'empty_thumb.jpg', 10.5),
(13219, 'Camera iPod Touch 4G', 693, '', 'empty_thumb.jpg', 12),
(12915, 'Housing iPod Touch 4G 32G/64G (silver)', 693, '', 'empty_thumb.jpg', 17.5),
(13003, 'Скотч для Touchscreen iPod Touch 4G', 693, '', 'empty_thumb.jpg', 1.1),
(13065, 'Аккумулятор iPod Classic 616-0229 (80gb/120gb)', 693, '', 'empty_thumb.jpg', 9),
(13094, 'Аккумулятор iPod Touch 4G', 693, '', 'empty_thumb.jpg', 13.4),
(13220, 'Hands-free connector iPod Touch 4G', 693, '', 'empty_thumb.jpg', 6.5),
(13295, 'LCD iPod Nano 7G', 693, '', 'empty_thumb.jpg', 20),
(10621, 'Glass Screen Cover for MacBook Pro 13.3\"', 694, 'защитное стекло экрана', 'empty_thumb.jpg', 59),
(10622, 'Glass Screen Cover for MacBook Pro 15.4\"', 694, 'защитное стекло экрана ', 'empty_thumb.jpg', 69),
(10623, 'Glass Screen Cover for MacBook Pro 17.1\"', 694, 'защитное стекло экрана', 'empty_thumb.jpg', 77),
(9639, 'Клипсы для дисплея iPad ', 695, '', 'empty_thumb.jpg', 0.3),
(9780, 'Housing iPad 3G (silver)', 695, 'Корпус на iPad 3G серебристый', 'empty_thumb.jpg', 55),
(10162, 'Аккумулятор iPad ', 695, '', 'empty_thumb.jpg', 30),
(10373, 'Housing iPad  Wi-Fi', 695, 'Корпус для iPad 3 Wi-Fi', 'empty_thumb.jpg', 75),
(10462, 'Flat Cable iPad + HF connector', 695, 'Шлейф с разъёмом наушников на iPad', 'empty_thumb.jpg', 8.8),
(10131, 'Flat Cable iPad 2 with charger connector', 696, 'Шлейф на iPad 2 с системным разьемом.', 'empty_thumb.jpg', 8.5),
(10132, 'Flat Cable iPad 2 with switch on/off & switch vibro', 696, 'Шлейф с кнопками громкости и кнопкой включения', 'empty_thumb.jpg', 13.5),
(10133, 'Двухсторонний скотч для iPad 2 (комплект)', 696, '', 'empty_thumb.jpg', 3),
(10134, 'Flat Cable iPad 2 3G with sim & HF connector (black)', 696, 'Шлейф в комплекте с SIM-держателем и разьемом гарнитуры черного цвета ', 'empty_thumb.jpg', 9.99),
(10135, 'Flat Cable iPad 2 3G with sim & HF connector (white)', 696, 'Шлейф в комплекте с SIM-держателем и разьемом гарнитуры белого цвета ', 'empty_thumb.jpg', 9.99),
(10136, 'Flat Cable iPad 2 Wi-Fi with HF connector', 696, '', 'empty_thumb.jpg', 10),
(10161, 'LCD iPad 2  only lcd', 696, 'AB0970003013', 'empty_thumb.jpg', 70),
(10163, 'Touchscreen + Len iPad 2 (black)', 696, 'сенсорное стекло с чёрной рамкой', 'empty_thumb.jpg', 36),
(10164, 'Touchscreen + Len iPad 2 (white)', 696, 'сенсорное стекло с белой рамкой', 'empty_thumb.jpg', 36),
(10375, 'Camera iPad 2 big (front)', 696, 'камера передняя', 'empty_thumb.jpg', 4.8),
(10461, 'Mic iPad 2 (микрофон)', 696, 'микрофон на шлейфе с разъёмом для iPad 2', 'empty_thumb.jpg', 4.8),
(10463, 'Camera iPad 2 small (back)', 696, 'камера задняя', 'empty_thumb.jpg', 4.8),
(10563, 'On/off inside Home iPad 2', 696, 'центральная кнопка  (внутреняя) на плате для iPad 2.', 'empty_thumb.jpg', 3.99),
(10564, 'Button Home iPad 2 (black)', 696, 'Наружная кнопка главного меню на iPad 2 WiFi/iPad 2 WiFi+3G, чёрного цвета.', 'empty_thumb.jpg', 1.99),
(10565, 'Antenna iPad 2 bluetooth', 696, 'антенна блютуз', 'empty_thumb.jpg', 6.8),
(10566, 'Antenna iPad 2 Wi-Fi', 696, 'антенна Wi-Fi', 'empty_thumb.jpg', 6.2),
(10734, 'Touch socket iPad 2 (black) ', 696, 'Рамка под дисплей на iPad 2 чёрного цвета', 'empty_thumb.jpg', 3.9),
(10735, 'Touch socket iPad 2 (white) ', 696, 'Рамка под дисплей на iPad 2 белого цвета', 'empty_thumb.jpg', 3.9),
(10786, 'Sim card holder outside iPad 2', 696, '', 'empty_thumb.jpg', 3.5),
(10880, 'Аккумулятор iPad 2', 696, '', 'empty_thumb.jpg', 29),
(11061, 'Button Home iPad 2 (white)', 696, 'Наружная кнопка главного меню на iPad 2 WiFi/iPad 2 WiFi+3G, белого цвета.', 'empty_thumb.jpg', 1.99),
(12972, 'Touchscreen + Len iPad 2 (black) copy', 696, 'сенсорное стекло с чёрной рамкой', 'empty_thumb.jpg', 29),
(13211, 'Flat Cable iPad 2 on LCD', 696, 'дисплейный шлейф', 'empty_thumb.jpg', 5.99),
(13402, 'Housing iPad 2', 696, '', 'empty_thumb.jpg', 85),
(12149, 'LCD iPad NEW 3/4 only lcd', 697, '<p>\r\n	дисплей для iPad NEW 3 без сенсора</p>\r\n', 'empty_thumb.jpg', 72),
(12154, 'Touchscreen + Len iPad NEW 3/4 (black)', 697, 'Сенсорное стекло черного цвета для iPad 3', 'empty_thumb.jpg', 58),
(12263, 'Touchscreen + Len iPad NEW 3/4 (white)', 697, '<p>\r\n	Сенсорное стекло белого цвета для iPad 3</p>\r\n', 'empty_thumb.jpg', 58),
(12836, 'Camera iPad New 3 back', 697, 'камера задняя', 'empty_thumb.jpg', 25.5),
(12922, 'Housing iPad NEW 3 Wi-Fi 3G', 697, '<p>\r\n	Задняя крышка корпуса для iPad 3 WiFi серебристого цвета</p>\r\n', 'empty_thumb.jpg', 105),
(13118, 'Flat Cable NEW iPad 3 with switch volume on/off &amp; switch vibro', 697, '<p>\r\n	Шлейф для iPad New 3 с кнопками регулировки громкости и включения</p>\r\n', 'empty_thumb.jpg', 6),
(13209, 'Flat Cable iPad 3 with HF connector', 697, '', 'empty_thumb.jpg', 39.9),
(13251, 'Touchscreen + Len iPad NEW 3/4 (black) copy', 697, '', 'empty_thumb.jpg', 45),
(13252, 'Touchscreen + Len iPad NEW 3/4 (white) copy ', 697, '', 'empty_thumb.jpg', 45),
(13408, 'Flat Cable iPad NEW 3 with charger connector', 697, '<p>\r\n	Шлейф с системным коннектором для iPad NEW (iPad 3)</p>\r\n', 'empty_thumb.jpg', 7.4),
(13409, 'Buzzer iPad NEW 3 (2pcs) with frame', 697, '<p>\r\n	Динамик полифонический для iPad New 3 (2 шт) в рамке</p>\r\n', 'empty_thumb.jpg', 15.9),
(13417, 'Antenna iPad NEW 3 bluetooth', 697, '<p>\r\n	Антенна з блютузом для iPad 3</p>\r\n', 'empty_thumb.jpg', 4.8),
(13418, 'Antenna iPad NEW 3 GPS', 697, '<p>\r\n	Антенна для iPad 3 GPS</p>\r\n', 'empty_thumb.jpg', 4.8),
(13420, 'Antenna 3G iPad NEW 3 (2pcs)', 697, '<p>\r\n	Антенна 3G для iPad New 3 (правая и левая)</p>\r\n', 'empty_thumb.jpg', 6.8),
(13422, 'Flat Cable iPad NEW 3 with microphone', 697, '<p>\r\n	Шлейф для iPad New 3 c микрофоном</p>\r\n', 'empty_thumb.jpg', 3.8),
(13547, 'Camera iPad New 3 front', 697, '', 'empty_thumb.jpg', 12),
(12913, 'Touchscreen iPad mini (black)', 699, 'Сенсорное стекло на iPad mini чёрного цвета', 'empty_thumb.jpg', 99),
(12914, 'Touchscreen iPad mini (white)', 699, 'Сенсорное стекло на iPad mini белого цвета', 'empty_thumb.jpg', 99),
(12970, 'LCD iPad mini', 699, 'Дисплей на iPad mini', 'empty_thumb.jpg', 68),
(13410, 'Flat Cable iPad mini with connector system (white)', 699, '<p>\r\n	Шлейф с системным разьёмом белого цвета для iPad MINI.</p>\r\n', 'empty_thumb.jpg', 12.8),
(13412, 'Button Home iPad mini (black)', 699, '<p>\r\n	Кнопка главного меню чёрного цвета для iPad MINI.</p>\r\n', 'empty_thumb.jpg', 2.8),
(13411, 'Flat Cable iPad mini with connector system (black)', 699, '<p>\r\n	Шлейф с системным разьёмом чёрного цвета для iPad MINI</p>\r\n', 'empty_thumb.jpg', 12.8),
(13413, 'Button Home iPad mini (white)', 699, '<p>\r\n	Кнопка главного меню белого цвета для iPad MINI.</p>\r\n', 'empty_thumb.jpg', 2.8),
(13414, 'Flat Cable iPad mini with hands-free connector (black)', 699, '<p>\r\n	Шлейф с разьемом гарнитуры черного цвета для iPad MINI</p>\r\n', 'empty_thumb.jpg', 7.4),
(13415, 'Flat Cable iPad mini with hands-free connector (white)', 699, '<p>\r\n	Шлейф с разьемом гарнитуры белого цвета для iPad MINI</p>\r\n', 'empty_thumb.jpg', 7.4),
(13416, 'Flat Cable iPad mini microphone', 699, '<p>\r\n	Шлейф с микрофоном для iPad MINI</p>\r\n', 'empty_thumb.jpg', 4.8),
(7225, 'Housing iPhone 2G', 700, 'USED!!!black .silver ', 'empty_thumb.jpg', 24),
(7424, 'Sim card holder iPhone 2G', 700, 'silver', 'empty_thumb.jpg', 5),
(7425, 'Flat cable iPhone 2G for light sensor and speaker ', 700, 'with components', 'empty_thumb.jpg', 2.8),
(7426, 'Charger flat cable iPhone 2G', 700, 'Шлейф с разъемом заряда на iPhone 2G', 'empty_thumb.jpg', 6.5),
(7427, 'Housing cover iPhone 2G (крышка акб) ', 700, 'black, green, blue, red, pink, 8G, 16G', 'empty_thumb.jpg', 21),
(7428, 'Flat cable iPhone 2G with vibro ', 700, ' handsfree connector and on/off button', 'empty_thumb.jpg', 9.2),
(7597, 'Len iPhone 2G', 700, '', 'empty_thumb.jpg', 7),
(7806, 'Buzzer iPhone 2G ', 700, 'Полифонический динамик на iPhone 2G', 'empty_thumb.jpg', 2.2),
(8144, 'Аккумулятор iPhone 2G', 700, '', 'empty_thumb.jpg', 8.3),
(8197, 'Выталкиватель сим карты iPhone', 700, '', 'empty_thumb.jpg', 0.6),
(8215, 'Винтики iPhone 2G', 700, '', 'empty_thumb.jpg', 0.1),
(8238, 'Charger connector iPhone 2G', 700, 'Разъём заряда (системный разъём) на iPhone 2G', 'empty_thumb.jpg', 0.9),
(8311, 'Sim card holder inside iPhone 2G', 700, '', 'empty_thumb.jpg', 3.9),
(8509, 'Camera iPhone 2G', 700, 'Камера на iPhone 2G', 'empty_thumb.jpg', 5.5),
(9182, 'Металлическая основа под LCD iPhone 2G', 700, '', 'empty_thumb.jpg', 9),
(9183, 'Скотч под LCD iPhone 2G', 700, '', 'empty_thumb.jpg', 0.9),
(9356, 'Antenna block iPhone ', 700, 'Антенна на iPhone', 'empty_thumb.jpg', 5),
(9609, 'Mic iPhone 2G', 700, '', 'empty_thumb.jpg', 1.5),
(7581, 'Len iPhone 3G ', 701, 'стекло', 'empty_thumb.jpg', 9),
(7649, 'Housing cover iPhone 3G high copy (black)', 701, 'задняя крышка', 'empty_thumb.jpg', 36),
(7725, 'Sim card holder outside (tray) iPhone 3G/3GS (black)', 701, '', 'empty_thumb.jpg', 2.5),
(7867, 'Charger flat cable iPhone 3G ', 701, 'Шлейф с разъемом зарядки', 'empty_thumb.jpg', 4.5),
(7868, 'Antenna+buzzer iPhone 3G ', 701, 'with data connector', 'empty_thumb.jpg', 6.5),
(7925, 'Button Home  iPhone 3G/3GS white', 701, '<p>\r\n	центральная кнопка</p>\r\n', 'empty_thumb.jpg', 1.8),
(8145, 'Аккумулятор iPhone 3G', 701, '', 'empty_thumb.jpg', 7.6),
(8174, 'Touchscreen+Len iPhone 3G (black)', 701, '', 'empty_thumb.jpg', 11),
(8216, 'Screws iPhone 3G small', 701, 'винтики', 'empty_thumb.jpg', 0.1),
(8307, 'Charger flat cable iPhone 3GS', 701, 'Шлейф с разъемом зарядки', 'empty_thumb.jpg', 5.5),
(8308, 'Charger connector iPhone 3G/3GS', 701, 'разъём заряда', 'empty_thumb.jpg', 0.95),
(8310, 'Sim card holder inside iPhone 3G', 701, 'внутренний держатель сим карты', 'empty_thumb.jpg', 4.65),
(8338, 'Housing iPhone 3GS (black)', 701, 'задняя крышка', 'empty_thumb.jpg', 19.5),
(8390, 'Sim card contact iPhone 2G/3G/3GS', 701, 'контакты для сим карты', 'empty_thumb.jpg', 1.2),
(8391, 'On/off vibro mode iPhone 3G/3GS (black)', 701, '<p>\r\n	кнопка вкл/выкл беззвучного режима</p>\r\n', 'empty_thumb.jpg', 1),
(8392, 'Внутренний выталкиватель сим карты iPhone 3G/3GS', 701, '', 'empty_thumb.jpg', 1),
(8508, 'Sim card holder inside iPhone 3GS', 701, 'внутренний держатель сим карты', 'empty_thumb.jpg', 4.7),
(8640, 'Touchscreen+Len iPhone 3GS (black)', 701, '', 'empty_thumb.jpg', 11.8),
(8643, 'Flat cable on/off iPhone 3GS/3G + HF (black)', 701, '<p>\r\n	шлейф с разъёмам наушников</p>\r\n', 'empty_thumb.jpg', 5),
(8841, 'Button outside volume iPhone 3G/3GS', 701, 'кнопка регулировки громкости звука iPhone 3G/3GS', 'empty_thumb.jpg', 2),
(9027, 'Camera iPhone 3G', 701, 'камера', 'empty_thumb.jpg', 9),
(9077, 'Housing iPhone 3G (black)', 701, '', 'empty_thumb.jpg', 21),
(9081, 'Flat button inside Home iPhone 3G/3GS', 701, 'внутренняя центральная кнопка со шлейфом', 'empty_thumb.jpg', 2),
(9082, 'Frame mounting LCD iPhone 3G/3GS (black)', 701, 'Пластиковая рамка крепления дисплея и сенсорного стекла на iPhone 3G/3GS', 'empty_thumb.jpg', 8.5),
(9083, 'Металлическая основа под LCD iPhone 3G/3GS', 701, '', 'empty_thumb.jpg', 6),
(9085, 'Microphone iPhone 3G/3GS with flat cable', 701, 'Микрофон на iPhone 3G/3GS в комплекте со шлейфом и резиновым колпачком', 'empty_thumb.jpg', 2),
(9177, 'Аккумулятор iPhone 3GS ', 701, '', 'empty_thumb.jpg', 7.8),
(9180, 'Button on/off outside iPhone 3G/3GS', 701, 'накладка на кнопку включения и выключения iPhone 3G/3GS', 'empty_thumb.jpg', 1.35),
(9346, 'Flat cable iPhone 3G/3GS for light sensor ', 701, '', 'empty_thumb.jpg', 5.2),
(9355, 'Buzzer iPhone 3G/3GS', 701, 'with antenna cover', 'empty_thumb.jpg', 3.5),
(9517, 'Housing iPhone 3G Full (black)', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'empty_thumb.jpg', 42),
(9583, 'Housing iPhone 3GS Full (black)', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'empty_thumb.jpg', 45),
(9771, 'Screws iPhone 3G big', 701, 'винтики', 'empty_thumb.jpg', 0.1),
(10008, 'Vibro iPhone 3G/3GS', 701, 'вибромотор', 'empty_thumb.jpg', 2.6),
(10474, 'Sticker for fixing the Touchscreen iPhone 3G/3GS', 701, 'Двухсторонняя клеящая лента для  iPhone 3G/3GS.', 'empty_thumb.jpg', 1.5),
(10499, 'Antenna Cable iPhone 3G', 701, '', 'empty_thumb.jpg', 3.5),
(10500, 'Antenna Cable iPhone 3GS ', 701, '', 'empty_thumb.jpg', 4.8),
(10560, 'Camera iPhone 3GS', 701, 'камера', 'empty_thumb.jpg', 6.6),
(10561, 'Antenna+buzzer iPhone 3GS', 701, 'with data connector', 'empty_thumb.jpg', 7.6),
(11059, 'Sim card holder outside (tray) iPhone 3G/3GS (white)', 701, '', 'empty_thumb.jpg', 2.5),
(11245, 'Flat cable on/off iPhone 3GS/3G + HF (white)', 701, '<p>\r\n	шлейф с разъёмам наушников</p>\r\n', 'empty_thumb.jpg', 5),
(11258, 'Housing iPhone 3G Full (white)', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'empty_thumb.jpg', 42),
(11259, 'Housing iPhone 3GS Full (white)', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'empty_thumb.jpg', 45),
(11261, 'Housing iPhone 3G (white)', 701, '', 'empty_thumb.jpg', 21),
(11262, 'Housing iPhone 3GS (white)', 701, '<p>\r\n	задняя крышка</p>\r\n', 'empty_thumb.jpg', 19.5),
(11540, 'Touchscreen+Len iPhone 3G (white)', 701, '', 'empty_thumb.jpg', 11),
(11970, 'On/off vibro mode iPhone 3G/3GS (white)', 701, 'кнопка вкл/выкл беззвучного режима', 'empty_thumb.jpg', 1),
(12032, 'Touchscreen+Len iPhone 3GS (white)', 701, '', 'empty_thumb.jpg', 12),
(12140, 'Wi-Fi Antenna Cable iPhone 3G/3GS', 701, '', 'empty_thumb.jpg', 3.2),
(12180, 'LCD iPhone 3G ', 701, 'дисплей', 'empty_thumb.jpg', 24),
(12181, 'LCD iPhone 3GS', 701, '<p>\r\n	дисплей</p>\r\n', 'empty_thumb.jpg', 19),
(13105, 'Button Home  iPhone 3G/3GS black', 701, '<p>\r\n	центральная кнопка</p>\r\n', 'empty_thumb.jpg', 1.8),
(9384, 'Speaker iPhone 4', 702, 'динамик', 'empty_thumb.jpg', 2.2),
(9469, 'LCD+Touchscreen iPhone 4 (black)', 702, '', 'empty_thumb.jpg', 33),
(9470, 'LCD+Touchscreen iPhone 4 (white)', 702, '', 'empty_thumb.jpg', 35),
(9471, 'Middle part iPhone 4', 702, 'Средняя часть корпуса', 'empty_thumb.jpg', 19),
(9472, 'Back cover iPhone 4 (white)', 702, 'Задняя крышка корпуса белого цвета на iPhone 4', 'empty_thumb.jpg', 11.8),
(9474, 'Sim-card holder outside iPhone 4', 702, '', 'empty_thumb.jpg', 3.9),
(9510, 'Microphone iPhone 4', 702, '', 'empty_thumb.jpg', 1.4),
(9511, 'Buzzer Ringer for iPhone 4/4S', 702, 'полифонический динамик', 'empty_thumb.jpg', 3.2),
(9514, 'Аккумулятор iPhone 4G', 702, '', 'empty_thumb.jpg', 13.2),
(9515, 'Home button outside iPhone 4 high copy (black)', 702, 'центральная кнопка', 'empty_thumb.jpg', 3.95),
(9519, 'Charger flat cable iPhone 4 black connector', 702, 'Шлейф с разъёмом зарядки (чёрный) c компонентами и микрофоном на iPhone 4', 'empty_thumb.jpg', 9.5),
(9562, 'Touchscreen+Len iPhone 4 (white)', 702, '', 'empty_thumb.jpg', 18),
(9563, 'Touchscreen+Len iPhone 4 (black)', 702, '', 'empty_thumb.jpg', 18),
(9564, 'LCD iPhone 4 only lcd', 702, '', 'empty_thumb.jpg', 33),
(9630, 'Flat Cable iPhone 4 for light proximity sensor & power key', 702, 'Шлейф с датчиком приближения уха к динамику и мембраной кнопки вкл/выкл на iPhone 4', 'empty_thumb.jpg', 9),
(9637, 'Home button outside  iPhone 4 (black)', 702, 'центральная кнопка ', 'empty_thumb.jpg', 2.2),
(9638, 'Home button outside iPhone 4 (white) ', 702, 'центральная кнопка ', 'empty_thumb.jpg', 2.2),
(9774, 'Flat Cable iPhone 4 with hands-free connector (black) + volume switch', 702, 'Шлейф с разъёмом гарнитуры (чёрный) и мембранами кнопок управления звуком на iPhone 4', 'empty_thumb.jpg', 7),
(9781, 'LCD+Touchscreen iPhone 4 high copy (black) ', 702, '', 'empty_thumb.jpg', 64),
(10009, 'Camera back iPhone 4 ', 702, 'задняя', 'empty_thumb.jpg', 11),
(10094, 'Turbo-SIM for iPhone 4', 702, '', 'empty_thumb.jpg', 6.5),
(10112, 'Vibro module iPhone 4', 702, 'вибро звонок', 'empty_thumb.jpg', 2.6),
(10113, 'LCD+Touchscreen iPhone 4 high copy (white) ', 702, '', 'empty_thumb.jpg', 64),
(10114, 'Back cover iPhone 4 high copy (white) ', 702, 'Задняя крышка корпуса белого цвета на iPhone 4', 'empty_thumb.jpg', 27),
(10130, 'Набор винтов для iPhone 4', 702, '<p>\r\n	комплект</p>\r\n', 'empty_thumb.jpg', 4.7),
(10285, 'Back cover iPhone 4 high copy (black) ', 702, 'Задняя крышка корпуса чёрного цвета на iPhone 4', 'empty_thumb.jpg', 27),
(10326, 'Flat Cable on/off inside Home iPhone 4', 702, '', 'empty_thumb.jpg', 3.4),
(10331, 'Back cover iPhone 4 (black) ', 702, 'Задняя крышка корпуса чёрного цвета на iPhone 4', 'empty_thumb.jpg', 11.8),
(10488, 'Charger flat cable iPhone 4 white connector', 702, 'Шлейф с разъёмом зарядки (белый) c компонентами и микрофоном на iPhone 4', 'empty_thumb.jpg', 10),
(10493, 'Waterproof sticker iPhone 4', 702, 'индикатор влаги ', 'empty_thumb.jpg', 0.3),
(10495, 'Connector on board for Back camera iPhone 4', 702, '', 'empty_thumb.jpg', 6.5),
(10497, 'Connector on board for Sensor flat iPhone 4', 702, '', 'empty_thumb.jpg', 6),
(10498, 'Connector on board for Audio iPhone 4', 702, '', 'empty_thumb.jpg', 5.9),
(10558, 'LCD+Touchscreen iPhone 4+Housing cover (Purple)', 702, '', 'empty_thumb.jpg', 45),
(10559, 'LCD+Touchscreen iPhone 4+Housing cover (Gold)', 702, '', 'empty_thumb.jpg', 45),
(10562, 'Camera front iPhone 4 ', 702, 'передняя', 'empty_thumb.jpg', 7.9),
(10567, 'Antenna iPhone 4 with WiFi ', 702, 'антенна', 'empty_thumb.jpg', 4.2),
(10642, 'Sim-card holder inside iPhone 4', 702, 'держатель сим карты на iPhone 4', 'empty_thumb.jpg', 3.4),
(10643, 'Button set iPhone 4 (volume+power+mute)', 702, 'Набор кнопок (3шт.) . В комплект входит: кнопка вкл/выкл телефона, кнопка регулировки громкости, кнопка беззвучного режима и держатель SIM карты.', 'empty_thumb.jpg', 4.9),
(10644, 'Battery connector iPhone 4', 702, 'разъём аккумулятора', 'empty_thumb.jpg', 2.9),
(10645, 'Внутренний выталкиватель iPhone 4', 702, '', 'empty_thumb.jpg', 2.2),
(10646, 'Connector on board for Front camera iPhone 4', 702, '', 'empty_thumb.jpg', 6.5),
(10647, 'Connector on board for Touchscreen iPhone 4', 702, '', 'empty_thumb.jpg', 5.2),
(10648, 'Защитная сетка для Speaker iPhone 4', 702, '', 'empty_thumb.jpg', 1.1),
(11060, 'Flat Cable iPhone 4 with hands-free connector (white) + volume switch', 702, 'Шлейф с разъёмом гарнитуры (белый) и мембранами кнопок управления звуком на iPhone 4', 'empty_thumb.jpg', 7),
(11524, 'Защитная сетка для Buzzer iPhone 4', 702, '', 'empty_thumb.jpg', 1),
(11529, 'Скотч для Touchscreen iPhone 4', 702, '', 'empty_thumb.jpg', 1.2),
(11627, 'Frame Housing cover iPhone 4 Black', 702, '<p>\r\n	Рамка задней крышки корпуса на iPhone 4 чёрного цвета</p>\r\n', 'empty_thumb.jpg', 10),
(11628, 'Frame Housing cover iPhone 4 White', 702, '<p>\r\n	Рамка задней крышки корпуса на iPhone 4 белого цвета</p>\r\n', 'empty_thumb.jpg', 10),
(10487, 'Аккумулятор iPhone 4S', 703, '', 'empty_thumb.jpg', 18.7),
(10489, 'Flat Cable iPhone 4S(black) with hands-free connector', 703, 'шлейф с разьёмом для наушников ', 'empty_thumb.jpg', 14),
(10490, 'Flat Cable iPhone 4S(white) with hands-free connector', 703, 'шлейф с разьёмом для наушников ', 'empty_thumb.jpg', 14),
(10491, 'Charger flat cable iPhone 4S (black) connector', 703, 'Шлейф с разъемом зарядки чёрный', 'empty_thumb.jpg', 14),
(10492, 'Charger flat cable iPhone 4S (white) connector', 703, 'Шлейф с разъемом зарядки белый', 'empty_thumb.jpg', 14),
(10494, 'LCD connector iPhone 4S', 703, '', 'empty_thumb.jpg', 5.5),
(10568, 'Flat Cable on/off inside Home iPhone 4S ', 703, '', 'empty_thumb.jpg', 5.5),
(10569, 'LCD iPhone 4S + Touchscreen (black)', 703, '', 'empty_thumb.jpg', 42),
(10570, 'LCD iPhone 4S + Touchscreen (white)', 703, '', 'empty_thumb.jpg', 43),
(10571, 'LCD iPhone 4S + Touchscreen (black) high copy', 703, '', 'empty_thumb.jpg', 67),
(10572, 'LCD iPhone 4S + Touchscreen (white) high copy', 703, '', 'empty_thumb.jpg', 67),
(10573, 'Flat Cable iPhone 4S with proximity sensor', 703, 'шлейф с кнопкой вкл.', 'empty_thumb.jpg', 14),
(10575, 'Camera front  iPhone 4S', 703, 'передняя', 'empty_thumb.jpg', 13.5),
(10636, 'Back cover iPhone 4S (black) ', 703, '<p>\r\n	задняя крышка</p>\r\n', 'empty_thumb.jpg', 17.5),
(10637, 'Back cover iPhone 4S (white) ', 703, '<p>\r\n	задняя крышка</p>\r\n', 'empty_thumb.jpg', 17.5),
(11623, 'Back cover iPhone 4S high copy (black) ', 703, '<p>\r\n	задняя крышка</p>\r\n', 'empty_thumb.jpg', 29),
(11624, 'Middle part iPhone 4S (silver)', 703, '', 'empty_thumb.jpg', 49),
(11625, 'Frame Housing cover iPhone 4S (black)', 703, '', 'empty_thumb.jpg', 10.5),
(11626, 'Frame Housing cover iPhone 4S (white)', 703, '', 'empty_thumb.jpg', 10),
(11998, 'Turbo-SIM for iPhone 4S (5.0/ 5.1/ 5.01)', 703, '', 'empty_thumb.jpg', 20),
(12031, 'Camera back iPhone 4S 8MP', 703, '<p>\r\n	задняя</p>\r\n', 'empty_thumb.jpg', 26),
(12033, 'Back cover iPhone 4S high copy (white) ', 703, '<p>\r\n	задняя крышка</p>\r\n', 'empty_thumb.jpg', 29),
(12151, 'Home button outside for iPhone 4S (black)', 703, '', 'empty_thumb.jpg', 2.5),
(12152, 'Home button outside for iPhone 4S (white)', 703, '', 'empty_thumb.jpg', 2.5),
(12153, 'Vibro module iPhone 4S', 703, '', 'empty_thumb.jpg', 4.5),
(12869, 'Аккумулятор iPhone 4S original', 703, '', 'empty_thumb.jpg', 25),
(12666, 'Charger flat cable iPhone 5 (black) connector with HF ', 704, 'Шлейф на iPhone 5 с разъёмом зарядки и разъёмом наушников', 'empty_thumb.jpg', 7.8),
(12667, 'Charger flat cable iPhone 5 (white) connector with HF', 704, 'Шлейф на iPhone 5  с разъёмом зарядки и разъёмом наушников', 'empty_thumb.jpg', 8),
(12668, 'Buzzer Ringer for iPhone 5', 704, 'Полифонический динамик на iPhone 5', 'empty_thumb.jpg', 3.4),
(12669, 'Vibro module iPhone 5', 704, 'Вибро звонок для iPhone 5', 'empty_thumb.jpg', 2),
(12670, 'Flat Cable on/off inside iPhone 5', 704, 'Шлейф на iPhone 5 с кнопкой включения, кнопками регулировки громкости и беззвучного режима', 'empty_thumb.jpg', 4.6),
(12671, 'Sim-card holder outside iPhone 5 (black)', 704, 'Держатель нано сим карты для iPhone 5, чёрный', 'empty_thumb.jpg', 2),
(12672, 'Sim-card holder outside iPhone 5 (white)', 704, 'Держатель нано сим карты для iPhone 5, белый', 'empty_thumb.jpg', 2),
(12673, 'Flat Cable iPhone 5 for light and proximity sensor with front camera', 704, 'Шлейф на iPhone 5 с передней камерой и датчиками приближения и освещённости', 'empty_thumb.jpg', 14),
(12674, 'Speaker iPhone 5', 704, 'Динамик разговорный для iPhone 5', 'empty_thumb.jpg', 2.5),
(12675, 'Home button outside for iPhone 5 (black)', 704, 'Кнопка home внешняя для iPhone 5 чёрного цвета', 'empty_thumb.jpg', 2.5),
(12676, 'Home button outside for iPhone 5 (white)', 704, 'Кнопка home внешняя для iPhone 5 белого цвета', 'empty_thumb.jpg', 2.5),
(12677, 'Flat Cable Home inside iPhone 5', 704, 'Шлейф с мембраной кнопки возврата в главное меню на iPhone 5', 'empty_thumb.jpg', 3),
(12678, 'Battery connector iPhone 5', 704, 'Разъём аккумулятора на iPhone 5', 'empty_thumb.jpg', 2.2),
(12679, 'Flat Cable Wi-Fi iPhone 5', 704, 'Шлейф Wi-Fi iPhone 5', 'empty_thumb.jpg', 4.7),
(12680, 'Housing iPhone 5 (black)', 704, 'Корпус на iPhone 5 чёрный', 'empty_thumb.jpg', 155),
(12681, 'Housing iPhone 5 (white)', 704, 'Корпус на iPhone 5 белый', 'empty_thumb.jpg', 150),
(12682, 'Replacement Home Button Bracket for iPhone 5', 704, '<p>\r\n	Металлическая основа для шлейфа с кнопкой Home</p>\r\n', 'empty_thumb.jpg', 4.9),
(12683, 'Rubber pad Home button outside for iPhone 5 (black)', 704, 'Резиновая прокладка под накладку на кнопку Home', 'empty_thumb.jpg', 4),
(12911, 'LCD iPhone 5 + Touchscreen (black)', 704, 'Дисплей на iPhone 5 с сенсорным стеклом, чёрный', 'empty_thumb.jpg', 175),
(12912, 'LCD iPhone 5 + Touchscreen (white)', 704, 'Дисплей на iPhone 5 с сенсорным стеклом, белый', 'empty_thumb.jpg', 175),
(12929, 'Набор винтов для iPhone 5', 704, '', 'empty_thumb.jpg', 3.8),
(13038, 'LCD iPhone 5 + Touchscreen full (black)+camera+Home key', 704, '<p>\r\n	Дисплей на iPhone 5 с сенсорным стеклом, камерой и центральной кнопкой Home, чёрный</p>\r\n', 'empty_thumb.jpg', 190),
(13039, 'LCD iPhone 5 + Touchscreen full (white)+camera+Home key', 704, '<p>\r\n	Дисплей на iPhone 5 с сенсорным стеклом, камерой и центральной кнопкой Home, белый</p>\r\n', 'empty_thumb.jpg', 190),
(13093, 'Аккумулятор iPhone 5', 704, '', 'empty_thumb.jpg', 19),
(13398, 'Housing iPhone 5 (white) copy', 704, '<p>\r\n	Корпус на iPhone 5 белый улучшенная копия</p>\r\n', 'empty_thumb.jpg', 110),
(13399, 'Housing iPhone 5 (black) copy', 704, '<p>\r\n	Корпус на iPhone 5 чёрный улучшенная копия</p>\r\n', 'empty_thumb.jpg', 110),
(13400, 'Housing iPhone 5 (pink) copy', 704, '<p>\r\n	Корпус на iPhone 5 розовый улучшенная копия</p>\r\n', 'empty_thumb.jpg', 110),
(13401, 'Housing iPhone 5 (gold) copy', 704, '<p>\r\n	Корпус на iPhone 5 золотистый улучшенная копия</p>\r\n', 'empty_thumb.jpg', 110),
(9383, 'Power IC iPhone 3GS 338S0768-AE БЕЗ ГАРАНТИИ!!!', 705, 'Микросхема управления питанием ', 'empty_thumb.jpg', 45),
(9775, 'Power IC iPhone 3G БЕЗ ГАРАНТИИ !!!', 705, 'Микросхема управления питанием ', 'empty_thumb.jpg', 24),
(9776, 'Power IC iPhone 4 338S-0822- A3 БЕЗ ГАРАНТИИ !!!', 705, '09428HCF', 'empty_thumb.jpg', 45),
(9969, 'Charger IC iPhone 3G 40882/N0470/LTBH', 705, 'Микросхема для Iphone 3G (зарядки)', 'empty_thumb.jpg', 12),
(10290, 'USB Power Manager IC iPhone 3G (DEC 4088 EDE-2)', 705, '', 'empty_thumb.jpg', 7.9),
(10294, 'Sound IC iPhone 3GS/4G', 705, '', 'empty_thumb.jpg', 16),
(10395, 'Микросхема Wi-Fi iPhone 4 (модуль)', 705, '', 'empty_thumb.jpg', 33),
(10396, 'Micbias IC CD 3282 A1 iPhone 4', 705, 'микросхема звука во время разговора ', 'empty_thumb.jpg', 27),
(10477, 'PF-SKY 77529-24 iPhone 4', 705, '4679779', 'empty_thumb.jpg', 18),
(10478, 'CPU+Flash iPhone 4', 705, 'Флеш память', 'empty_thumb.jpg', 48),
(10731, 'TSC 2004_WCSP 25', 705, '', 'empty_thumb.jpg', 7.5),
(10732, 'SMP 3i 6820', 705, '', 'empty_thumb.jpg', 15),
(11609, 'SKY 77541-32', 705, '', 'empty_thumb.jpg', 18),
(12155, 'Power IC iPhone 4S 338S0973-A3  БЕЗ ГАРАНТИИ', 705, '<p>\r\n	1209EHHQ</p>\r\n', 'empty_thumb.jpg', 58),
(13207, 'Audio IC iPhone 5', 705, '', 'empty_thumb.jpg', 25),
(13208, 'IC WiFi iPhone 4S 339S0154', 705, '<p>\r\n	нагрев 200 градусов</p>\r\n', 'empty_thumb.jpg', 18),
(13210, 'Power IC 343S0542-A2 / iPad 2', 705, '', 'empty_thumb.jpg', 13.5),
(13404, 'IC WiFi iPhone 4S ', 705, '<p>\r\n	нагрев 300 градусов</p>\r\n', 'empty_thumb.jpg', 20),
(13406, 'Power IC iPhone 5 338S1131', 705, '', 'empty_thumb.jpg', 28),
(13407, 'IC USB/LCD iPhone 5 1608A1', 705, '', 'empty_thumb.jpg', 16),
(8990, 'Screen Guard iPad Crystal Clear', 840, '', 'empty_thumb.jpg', 5),
(8991, 'Screen Guard iPad Anti Glare', 840, '(матовая)', 'empty_thumb.jpg', 8),
(8992, 'Screen Guard iPad Mirror', 840, '(зеркальная)', 'empty_thumb.jpg', 7),
(9089, 'Capdase iMAG Screen Guard iPad ', 840, 'Superb Transparency & Anti-Glare protection', 'empty_thumb.jpg', 16),
(9818, 'Screen Guard iPad Green  Crystal Clear', 840, '', 'empty_thumb.jpg', 7),
(10018, 'Screen Guard iPad 2/3/4 Anti Glare', 840, '(матовая)', 'empty_thumb.jpg', 9),
(10019, 'Screen Guard iPad 2/3/4 Crystal Clear', 840, '', 'empty_thumb.jpg', 8.5),
(10427, 'Back Guard iPad 2 Carbon (grey)', 840, '<p>\r\n	Карбоновая защитная пленка.</p>\r\n', 'empty_thumb.jpg', 8.9),
(10555, 'Mallper Screen Protective Film iPad 2 (black)', 840, '', 'empty_thumb.jpg', 12.7),
(10866, 'Screen Guard Professional  iPad 2/3 (2 in 1)BULLKin ', 840, 'лицевая и задняя защитные плёнки (белая,серая,чёрная карбон)', 'empty_thumb.jpg', 9),
(10891, 'Screen Ward iPad 2 Back Side anti-glare', 840, 'anti-ultraviolet/air-bubble-proof', 'empty_thumb.jpg', 7.5),
(11063, 'Back Guard iPad 2 Carbon (black)', 840, '<p>\r\n	Карбоновая защитная пленка.</p>\r\n', 'empty_thumb.jpg', 8.9),
(11064, 'Back Guard iPad 2 Carbon (white)', 840, '<p>\r\n	Карбоновая защитная пленка.</p>\r\n', 'empty_thumb.jpg', 8.9),
(11069, 'Mallper Screen Protective Film iPad 2 (white)', 840, '', 'empty_thumb.jpg', 12.7),
(11532, 'HOCO Screen Professional for iPad 2/3/4', 840, '', 'empty_thumb.jpg', 12.4),
(12342, 'Screen Ward iPad 2 Back Side ', 840, '', 'empty_thumb.jpg', 9),
(12629, 'Screen Guard iPad 2 / New Waterproof', 840, '<p>\r\n	водонепроницаемая</p>\r\n', 'empty_thumb.jpg', 9.5),
(12803, 'Screen Guard  Professional iPad 2/3 Front BULLKin ', 840, '<p>\r\n	лицевая защитная плёнка</p>\r\n', 'empty_thumb.jpg', 5.7),
(12901, 'ISME Screen Guard iPad mini Anti Glare', 840, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 6.5),
(12902, 'ISME Screen Guard iPad mini Clear', 840, '', 'empty_thumb.jpg', 6),
(12943, 'Screen Guard iPad mini Anti Glare', 840, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 5),
(12944, 'Screen Guard iPad mini Clear', 840, '', 'empty_thumb.jpg', 5),
(12945, 'Screen Guard  iPad mini Clear BULLKin ', 840, '', 'empty_thumb.jpg', 5.7),
(12946, 'Screen Guard  iPad mini Anti Glare BULLKin ', 840, '(матовая)', 'empty_thumb.jpg', 5.7),
(13119, 'Back Screen Guard iPad mini Clear', 840, 'плотная защитная плёнка на заднюю крышку прозрачная', 'empty_thumb.jpg', 5),
(13314, 'Super Ultra Screen Protector iPad mini Clear', 840, '<p>\r\n	ультратонкая защитная плёнка на айпад мини прозрачная</p>\r\n', 'empty_thumb.jpg', 5),
(13315, 'Super Ultra Screen Protector iPad mini Anti Glare', 840, '<p>\r\n	ультратонкая защитная плёнка на айпад мини матовая</p>\r\n', 'empty_thumb.jpg', 5),
(7139, 'Screen Guard iPhone 2G', 841, '', 'empty_thumb.jpg', 1.7),
(7607, 'Screen Guard iPhone 2G Mirror ', 841, '(зеркальная)', 'empty_thumb.jpg', 1),
(7609, 'Screen Guard iPhone 3G/3GS Mirror ', 841, '(зеркальная)', 'empty_thumb.jpg', 2),
(7610, 'Screen Guard iPhone 3G/3GS Anti Glare', 841, '(матовая)', 'empty_thumb.jpg', 2),
(7655, 'Screen Guard iPhone 3G/3GS ', 841, '(глянцевая)', 'empty_thumb.jpg', 2),
(9028, 'Screen Guard + Skin iPhone 3G/3GS', 841, '', 'empty_thumb.jpg', 2.7),
(9148, 'Screen Guard iPhone 4/4S', 841, '', 'empty_thumb.jpg', 1.9),
(9149, 'Screen Guard iPhone 4/4S Anti Glare', 841, '(матовая)', 'empty_thumb.jpg', 2.7),
(9415, 'Skin iPhone 4 Carbon Black', 841, '', 'empty_thumb.jpg', 4),
(9641, 'Mallper Insulation Sticker for iPhone 4G (black/white/red)', 841, 'защитная плёнка на боковую часть корпуса iPhone 4G  ', 'empty_thumb.jpg', 6.7),
(9643, 'Screen Guard iPhone 4/4S Anti Glare Capdase - ARIS Screen Protector', 841, 'Crystal Clear with Anti-Reflection Protection', 'empty_thumb.jpg', 6.5),
(9644, 'Screen Guard iPhone 4/4S Anti Glare Capdase - iXiMAG Screen Protector', 841, 'Superb Transparency & Anti-Glare.Finger-Print & Grease Resistant.', 'empty_thumb.jpg', 6.5),
(9645, 'Screen Guard iPhone 4/4S Mirror Capdase-MIRA Screen Protector', 841, '2 in1 excellent protection: Crystal Clear & Silver Glass Mirror', 'empty_thumb.jpg', 10),
(9784, 'Screen Guard iPhone 4/4S Front/Back BULLKin  ', 841, '', 'empty_thumb.jpg', 3.3),
(9785, 'Screen Guard iPhone 4/4S Clear BULLKin  ', 841, '', 'empty_thumb.jpg', 2.9),
(9786, 'Mallper Screen Protective Film iPhone 4G ', 841, 'Compatible with capacitive touch screen', 'empty_thumb.jpg', 6),
(10100, 'Screen Guard iPhone 4/4S Front/Back', 841, '', 'empty_thumb.jpg', 2.8),
(10101, 'Screen Guard iPhone 4/4S Front/Back Mirror ', 841, '(зеркальная)', 'empty_thumb.jpg', 2),
(10102, 'Screen Guard iPhone 4/4S Front/Back Anti Glare ', 841, '(матовая)', 'empty_thumb.jpg', 2.8),
(10336, 'Screen Guard iPhone 4/4S Mirror', 841, '<p>\r\n	(зеркальная)</p>\r\n', 'empty_thumb.jpg', 1.6),
(10855, 'Screen Guard iPhone 4/4S Front/Back Diamond', 841, '', 'empty_thumb.jpg', 6.5),
(10864, 'Insulation Sticker for iPhone 4G (grey/clear/wtite)', 841, 'защитная плёнка на боковую часть корпуса iPhone 4G', 'empty_thumb.jpg', 5.2),
(12010, 'Skin iPhone 4/4S Wood', 841, '', 'empty_thumb.jpg', 12.5),
(12011, 'Skin iPhone 4/4S 3D', 841, '', 'empty_thumb.jpg', 9.8),
(12236, 'Skin iPhone 4/4S 3D BULLKin', 841, '', 'empty_thumb.jpg', 8.8),
(12237, 'Screen Guard iPhone 4/4S Front/Back HOCO', 841, '', 'empty_thumb.jpg', 6.6),
(12351, 'Skin iPhone 4/4S 3D JunLieg', 841, '', 'empty_thumb.jpg', 8),
(12585, 'Screen Guard iPhone 4/4S Front/Back Anti Glare BULLKin ', 841, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 3.3),
(12625, 'Screen Guard iPhone 4/4S Waterproof', 841, '<p>\r\n	водонепроницаемая</p>\r\n', 'empty_thumb.jpg', 5.5),
(12656, 'Screen Guard iPhone 5 Front/Back BULLKin ', 841, '<p>\r\n	задняя из трёх частей</p>\r\n', 'empty_thumb.jpg', 4.5),
(12657, 'Screen Guard iPhone 5 Anti Glare BULLKin ', 841, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 4),
(12771, 'Screen Guard iPhone 5 Front/Back Anti Glare BULLKin ', 841, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 4.5),
(12772, 'Screen Guard iPhone 5 Clear BULLKin ', 841, '', 'empty_thumb.jpg', 3.3),
(12775, 'Screen Guard iPhone 5 Front/Back Clear', 841, '', 'empty_thumb.jpg', 4),
(12776, 'Screen Guard iPhone 5 Front/Back Anti Glare', 841, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 4),
(12777, 'Screen Guard iPhone 5 Front/Back Mirror', 841, '<p>\r\n	(зеркальная)</p>\r\n', 'empty_thumb.jpg', 4.5),
(12778, 'Screen Guard iPhone 5 Clear', 841, '', 'empty_thumb.jpg', 3),
(12779, 'Screen Guard iPhone 5 Anti Glare ', 841, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 3.2),
(13044, 'Screen Guard iPhone 5 Front/Back Diamond BULLKin ', 841, '', 'empty_thumb.jpg', 5.5),
(12942, 'Screen Guard iPhone 5 Front/Back Clear HOCO', 841, '', 'empty_thumb.jpg', 5.3),
(12896, 'Skin iPhone 4 Carbon White', 841, '', 'empty_thumb.jpg', 4),
(12897, 'Skin iPhone 4S Carbon Black', 841, '', 'empty_thumb.jpg', 4),
(12898, 'Skin iPhone 4S Carbon White', 841, '', 'empty_thumb.jpg', 4),
(13045, 'Screen Guard iPhone 5 Front/Back Japan AF BULLKin ', 841, '', 'empty_thumb.jpg', 6.5),
(13480, 'Screen Guard iPhone 5 Anti Glare BULLKin ', 841, '', 'empty_thumb.jpg', 0),
(9146, 'Screen Guard iPod Touch 2G/3G', 842, '', 'empty_thumb.jpg', 1.5),
(9147, 'Screen Guard iPod Touch 2G/3G Anti Glare ', 842, '(матовая)', 'empty_thumb.jpg', 1.3),
(9536, 'Screen Guard iPod Touch 4G ', 842, '', 'empty_thumb.jpg', 1.7),
(9537, 'Screen Guard iPod Touch 4G Anti Glare ', 842, '(матовая)', 'empty_thumb.jpg', 1.9),
(9538, 'Screen Guard iPod Nano 6G', 842, '', 'empty_thumb.jpg', 1.1),
(9539, 'Screen Guard iPod Nano 6G Anti Glare ', 842, '(матовая)', 'empty_thumb.jpg', 1.2),
(9540, 'Screen Guard iPod Nano 5G', 842, '', 'empty_thumb.jpg', 0.9),
(13338, 'Screen Guard iPod Touch 5G Anti Glare', 842, '<p>\r\n	(матовая)</p>\r\n', 'empty_thumb.jpg', 3),
(13339, 'Screen Guard iPod Touch 5G ', 842, '', 'empty_thumb.jpg', 2.9),
(7027, 'Screen Guard MacBook Air 13.3\"', 843, '', 'empty_thumb.jpg', 4.9),
(9955, 'Screen Guard MacBook Air 11.6\"', 843, '', 'empty_thumb.jpg', 4),
(10376, 'Skin for Apple MacBook Air 11\" carbon (white, black)', 843, '', 'empty_thumb.jpg', 7),
(10619, 'X-doria Keyboard Protector for MacBook Air/Pro 13.3\"', 843, 'защитная плёнка на клавиатуру', 'empty_thumb.jpg', 19),
(10620, 'X-doria Keyboard Protector for MacBook Air 11.6\"', 843, 'защитная плёнка на клавиатуру', 'empty_thumb.jpg', 19),
(10626, 'X-doria Screen Protector for MacBook 13.3\"', 843, 'защитная плёнка на экран ', 'empty_thumb.jpg', 19),
(10627, 'X-doria Screen Protector for MacBook 11,6\"', 843, 'защитная плёнка на экран', 'empty_thumb.jpg', 19),
(10862, 'Keypad protector TPU for Air 11,6\"', 843, '', 'empty_thumb.jpg', 8),
(10863, 'Keypad protector TPU for Air 13,3\"', 843, '', 'empty_thumb.jpg', 8),
(8110, 'Набор для открывания корпусов iPhone 2G/3G/3GS', 853, '', 'empty_thumb.jpg', 5),
(9013, 'Трафарет для iPhone 3G', 853, '', 'empty_thumb.jpg', 6.1),
(9015, 'Трафарет CPU iPhone', 853, '', 'empty_thumb.jpg', 5.95),
(9465, 'Трафарет для iPhone 3GS', 853, '', 'empty_thumb.jpg', 6.1),
(9711, 'Набор для открывания корпусов iPhone 4', 853, 'отвертка / присоска / пластиковые инструменты', 'empty_thumb.jpg', 6.5),
(9904, 'Клей для iPhone (для LCD)', 853, '', 'empty_thumb.jpg', 6.9),
(10182, 'Отвёртка Apple (крестовая)', 853, '', 'empty_thumb.jpg', 5.5),
(10332, 'Трафарет для iPhone 4', 853, '2G/3G/3GS', 'empty_thumb.jpg', 8),
(10829, 'Клей двухкомпонентный для iPhone', 853, '', 'empty_thumb.jpg', 7),
(12084, 'Отвёртка Apple (звездочка)', 853, '', 'empty_thumb.jpg', 5.5),
(12804, 'Присоска для вскрытия iPhone/iPod/iPad', 853, '', 'empty_thumb.jpg', 3),
(13450, 'Пластиковая основа для хранения болтов на iPhone 4G', 853, '', 'empty_thumb.jpg', 3.5),
(13451, 'Пластиковая основа для хранения болтов на iPhone 5', 853, '', 'empty_thumb.jpg', 5),
(13530, 'Трафарет для iPhone 5', 853, '', 'empty_thumb.jpg', 8),
(8446, 'Cable USB iPod Shuffle ', 879, '', 'empty_thumb.jpg', 9),
(8838, 'Capdase Leather Sleeve case iPod Nano 5G Lofti (red)', 879, '', 'empty_thumb.jpg', 15),
(8842, 'Capdase Leather Sleeve case iPod Nano 5G Lofti (black)', 879, '', 'empty_thumb.jpg', 19),
(9095, 'Sleeve case Soft jacket 2 iPod Nano 5G  Capdase (закрытый) (white)', 879, '', 'empty_thumb.jpg', 10),
(9096, 'Sleeve case Soft jacket iPod Nano 5G Capdase (открытый)', 879, '', 'empty_thumb.jpg', 16),
(9185, 'Socks for iPod (комплект)', 879, '', 'empty_thumb.jpg', 6.9),
(11054, 'Capdase Soft Jacket 2 Xpose - iPod Touch (4th generation) Silicone Case (grey)', 879, '', 'empty_thumb.jpg', 19.5),
(11055, 'Capdase Soft Jacket 2 Xpose - iPod Touch (4th generation) Silicone Case (white)', 879, '', 'empty_thumb.jpg', 19.5),
(11684, 'Capdase Sport Armband for iPod shuffle 2G', 879, '<p>\r\n	Syncha Sync and Charge Adaptor Set</p>\r\n', 'empty_thumb.jpg', 7.8),
(12606, 'Capdase Soft Jacket 2 Xpose - iPod Touch (4th generation) Silicone Case (clear)', 879, '', 'empty_thumb.jpg', 19),
(10504, 'Palmguard Air 13 with Trackpad Protector Silver for MacBook Air 13\"', 880, 'Накладка на тачпад.', 'empty_thumb.jpg', 17),
(10505, 'Palmguard Pro 13 with Trackpad Protector Silver for MacBook Pro 13\"', 880, 'Накладка на тачпад.', 'empty_thumb.jpg', 17),
(10506, 'Palmguard Pro 15 with Trackpad Protector Silver for MacBook Pro 15\"', 880, 'Накладка на тачпад.', 'empty_thumb.jpg', 17),
(10507, 'Palmguard Air 11.6 with Trackpad Protector Silver for MacBook Air 11.6\"', 880, 'Накладка на тачпад.', 'empty_thumb.jpg', 16),
(10617, 'Power Adapter MagSafe 85W (блок питания)', 880, 'блок питания ', 'empty_thumb.jpg', 95),
(10618, 'Power Adapter MagSafe 60W (блок питания)', 880, 'блок питания ', 'empty_thumb.jpg', 75),
(10624, 'Case iTaste Studio for Apple MacBook Air 11.6 (black)', 880, '<p>\r\n	Чехол - карман для MacBook Air 11.6</p>\r\n', 'empty_thumb.jpg', 37),
(10625, 'Case iTaste Studio for Apple MacBook Air 13.3', 880, '<p>\r\n	Чехол - карман для MacBook Air 13.3</p>\r\n', 'empty_thumb.jpg', 37),
(9090, 'Sleeve Case iPad (резиновый) (black-orange)', 881, '', 'empty_thumb.jpg', 3.5),
(9091, 'Protect back cover для iPad  ', 881, 'карбон-полимерный чехол (прозрачный)', 'empty_thumb.jpg', 3),
(9092, 'Кожаный чехол папка-трансформер iPad сase (black)', 881, '', 'empty_thumb.jpg', 15),
(9093, 'Кожаный чехол-папка для iPad (black)', 881, '', 'empty_thumb.jpg', 3.3),
(9189, 'Sleeve Case iPad original (замшевый чехол-папка) (black) ', 881, 'designed by Apple in California', 'empty_thumb.jpg', 20),
(9190, 'Кожаный чехол-папка для iPad (вертикальный) (black)', 881, '', 'empty_thumb.jpg', 3.2),
(9191, 'Кожаный чехол-папка для iPad (горизонтальный) (black)', 881, '', 'empty_thumb.jpg', 3.4),
(9240, 'Stylus iPad big (black)', 881, '', 'empty_thumb.jpg', 2.9),
(9266, 'Capdase Screen protector included Soft Jacket 2 Xpose iPad (white)', 881, '<p>\r\n	ультратонкий чехол с открытым экраном</p>\r\n', 'empty_thumb.jpg', 15),
(9267, 'Tuneshell for iPad (пластиковый чехол) (blue)', 881, 'чехол являет собой твердую оболочку и плотно прилегает к задней панели оставляя все порты и переключатели открытыми', 'empty_thumb.jpg', 7.5),
(9426, 'Stylus iPad small (white)', 881, '', 'empty_thumb.jpg', 1.8),
(9452, 'Camera Connection Kit for iPad', 881, 'Переходник для подключения карты памяти, камеры и USB устройств.', 'empty_thumb.jpg', 5.5),
(9700, 'Mallper USB Power Supply in Car Charger iPhone/iPad', 881, 'автомобильное зарядное устройство для iPad (2.1 A)', 'empty_thumb.jpg', 11),
(10898, 'Capdase Screen protector included Soft Jacket 2 Xpose iPad (black)', 881, '<p>\r\n	ультратонкий чехол с открытым экраном</p>\r\n', 'empty_thumb.jpg', 15),
(10899, 'Кожаный чехол-папка для iPad (brown)', 881, '', 'empty_thumb.jpg', 3.3),
(10900, 'Кожаный чехол-папка для iPad (red)', 881, '', 'empty_thumb.jpg', 3.3),
(10901, 'Кожаный чехол-папка для iPad (pink)', 881, '', 'empty_thumb.jpg', 3.3),
(10902, 'Stylus iPad small (black)', 881, '', 'empty_thumb.jpg', 1.8),
(10916, 'Sleeve Case iPad (резиновый) (black-pink)', 881, '', 'empty_thumb.jpg', 3.5),
(10917, 'Sleeve Case iPad (резиновый) (black-blue)', 881, '', 'empty_thumb.jpg', 3.5),
(10919, 'Tuneshell for iPad (пластиковый чехол) (pink)', 881, '<p>\r\n	чехол являет собой твердую оболочку и плотно прилегает к задней панели оставляя все порты и переключатели открытыми</p>\r\n', 'empty_thumb.jpg', 7.5),
(10920, 'Tuneshell for iPad (пластиковый чехол) (purple)', 881, '<p>\r\n	чехол являет собой твердую оболочку и плотно прилегает к задней панели оставляя все порты и переключатели открытыми</p>\r\n', 'empty_thumb.jpg', 7.5),
(10253, 'Apple iPad 2 Smart Cover Leather Tan (black)', 882, 'чехол специально создан для iPad 2 со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран', 'empty_thumb.jpg', 9),
(10254, 'Back Cover for iPad 2 (green)', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'empty_thumb.jpg', 5),
(10381, 'High Sensitive Stylus Pen (black, silver, white)', 882, 'Стилус универсальный для емкостного экрана (цвета в ассортименте) и имеет мягкий наконечник', 'empty_thumb.jpg', 2),
(10557, 'Mallper Mabaye series Cover iPad 2 ', 882, 'красивый дизайн с экологически чистых материалов абсолютно удобный для пользователей', 'empty_thumb.jpg', 13),
(10867, 'Capdase Protective Case Flip Jacket for iPad 2 (black)', 882, 'кожаный чехол который трансформируется в подставку и фиксирует iPad 2 в трех положениях', 'empty_thumb.jpg', 30),
(10877, 'LOCA Companion Case for iPad 2 /NEW iPad (black)', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'empty_thumb.jpg', 10),
(10921, 'Smart Cover Polyurethane iPad 2 (pink) (шторка)', 882, 'Smart Cover изготовлен из кожи и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 13),
(10922, 'Smart Cover Polyurethane iPad 2 (green) (шторка)', 882, 'Smart Cover изготовлен из кожи и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 9),
(10923, 'Smart Cover Polyurethane iPad 2 (grеy) (шторка)', 882, 'Smart Cover изготовлен из кожи и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 14),
(10924, 'Back Cover for iPad 2 (gray)', 882, 'чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели', 'empty_thumb.jpg', 5),
(10925, 'Back Cover for iPad 2 (blue)', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'empty_thumb.jpg', 5),
(10926, 'Back Cover for iPad 2 (pink)', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'empty_thumb.jpg', 5),
(10929, 'LOCA Companion Case for iPad 2 /NEW iPad  (clear)', 882, 'чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели ', 'empty_thumb.jpg', 14),
(11414, 'LOCA Companion Case for iPad 2 /NEW iPad  (pink)', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'empty_thumb.jpg', 14),
(11606, 'Capdase Protective Case Flip Jacket for iPad 2 (red)', 882, 'кожаный чехол который трансформируется в подставку и фиксирует iPad 2 в трех положениях', 'empty_thumb.jpg', 30),
(11631, 'Back Cover for iPad 2 (foggy)', 882, 'чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели', 'empty_thumb.jpg', 5),
(11632, 'Back Cover for iPad 2 (clear)', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'empty_thumb.jpg', 5),
(11651, 'iTaste Studio Simple Bag for iPad 2 (black)', 882, '<p>\r\n	Кожаный чехол - карман для iPad 2</p>\r\n', 'empty_thumb.jpg', 25),
(11652, 'Miaget Hermes case iPad 2 (white)', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'empty_thumb.jpg', 23),
(11653, 'Miaget Hermes case iPad 2 (black)', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'empty_thumb.jpg', 23),
(11654, 'Miaget Hermes case iPad 2 (beige)', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'empty_thumb.jpg', 23),
(11655, 'Miaget Hermes case iPad 2 (pink)', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'empty_thumb.jpg', 23),
(11656, 'Miaget Hermes case iPad 2 (red)', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'empty_thumb.jpg', 23),
(11673, 'Croco Crocodile design leather Case for iPad 2 (black)', 882, 'чехол из кожы рептилий внутри с каркасом из пластика', 'empty_thumb.jpg', 14),
(11674, 'Croco Crocodile design leather Case for iPad 2  (pink)', 882, 'чехол из кожы рептилий внутри с каркасом из пластика', 'empty_thumb.jpg', 14),
(11678, 'Flip Case for iPad 2 Rhombic (black)', 882, '', 'empty_thumb.jpg', 14),
(11679, 'Flip Case for iPad 2 Rhombic (white)', 882, '', 'empty_thumb.jpg', 14),
(11680, 'Flip Case for iPad 2 Rhombic (yellow)', 882, '', 'empty_thumb.jpg', 14),
(11681, 'Flip Case for iPad 2 Rhombic (blue)', 882, '', 'empty_thumb.jpg', 14),
(11683, 'Flip Case for iPad 2 Rhombic (pink)', 882, '', 'empty_thumb.jpg', 14),
(12061, 'ROCK Texture case for New iPad (black)', 883, '', 'empty_thumb.jpg', 27),
(12067, 'ROCK Texture case for New iPad (sand)', 883, '', 'empty_thumb.jpg', 27),
(12075, 'Leather case for NEW iPad/iPad 2 (black)', 883, '<p>\r\n	чехол</p>\r\n', 'empty_thumb.jpg', 17),
(12135, 'Leather Smart Cover for New iPad (black)', 883, '<p>\r\n	кожаная шторка</p>\r\n', 'empty_thumb.jpg', 20),
(12136, 'Polyurethane Smart Cover For New iPad (black)', 883, '', 'empty_thumb.jpg', 16),
(12339, 'Smart Case for New iPad (black)', 883, '', 'empty_thumb.jpg', 21),
(12340, 'Smart Case for New iPad (white)', 883, '', 'empty_thumb.jpg', 21),
(12341, 'ROCK Eternal case for New iPad (grey)', 883, '', 'empty_thumb.jpg', 28),
(12361, 'Leather Smart Cover for New iPad (beige)', 883, '', 'empty_thumb.jpg', 15.5),
(12390, 'ROCK Texture case for New iPad (green)', 883, '', 'empty_thumb.jpg', 27),
(12391, 'ROCK Texture case for New iPad (bronze)', 883, '', 'empty_thumb.jpg', 27),
(12439, 'Yoobao Executive leather Case for New iPad (black)', 883, '', 'empty_thumb.jpg', 33),
(12440, 'Yoobao Executive leather Case for New iPad (purple)', 883, '', 'empty_thumb.jpg', 32),
(12441, 'Yoobao Executive leather Case for New iPad (pink)', 883, '', 'empty_thumb.jpg', 31),
(12443, 'Trexta Slim Folio Case for New iPad (brown)', 883, '', 'empty_thumb.jpg', 33),
(12445, 'Trexta Slim Folio Case for New iPad (light pink)', 883, '', 'empty_thumb.jpg', 33),
(12446, 'Aigo Advanced leather Case for New iPad (black)', 883, '', 'empty_thumb.jpg', 32),
(12447, 'Aigo Advanced leather Case for New iPad (brown)', 883, '', 'empty_thumb.jpg', 32),
(12448, 'Aigo Advanced leather Case for New iPad (red)', 883, '', 'empty_thumb.jpg', 32),
(12451, 'Speck Magfolio Case for New iPad (black)', 883, '', 'empty_thumb.jpg', 19),
(12452, 'Speck Magfolio Case for New iPad (red)', 883, '', 'empty_thumb.jpg', 19),
(12453, 'Speck Magfolio Case for New iPad (multi-color)', 883, '', 'empty_thumb.jpg', 19),
(12454, 'BELK Case PU Leather for New iPad (grey)', 883, '', 'empty_thumb.jpg', 15),
(12460, 'BELK Case Italian Style for New iPad (black)', 883, '', 'empty_thumb.jpg', 15),
(12461, 'BELK Case Italian Style for New iPad (white)', 883, '', 'empty_thumb.jpg', 15),
(12463, 'BELK Case Italian Style for New iPad (pink)', 883, '', 'empty_thumb.jpg', 15),
(12464, 'BELK Case Italian Style for New iPad (blue)', 883, '', 'empty_thumb.jpg', 15),
(12465, 'BELK Case Italian Style for New iPad (orange)', 883, '', 'empty_thumb.jpg', 15),
(12596, 'ROCK Defense case for NEW iPad (grey)', 883, '', 'empty_thumb.jpg', 28),
(12597, 'ROCK Defense case for NEW iPad (green)', 883, '', 'empty_thumb.jpg', 27),
(12604, 'BOROFONE case for New iPad (black)', 883, '', 'empty_thumb.jpg', 29),
(12605, 'BOROFONE case for New iPad (grey)', 883, '', 'empty_thumb.jpg', 29),
(12684, 'Smart Case for New iPad original (black)', 883, '', 'empty_thumb.jpg', 59),
(12685, 'Smart Case for New iPad original (grey)', 883, '', 'empty_thumb.jpg', 59);
INSERT INTO `products` (`id`, `title`, `parent`, `content`, `image`, `price`) VALUES
(12888, 'Griffin wall charger for iPad/iPhone/iPod (dual USB)', 883, 'Сетевое зарядное устройство 2 USB 10watt /5volts/2.1amps', 'empty_thumb.jpg', 15),
(12960, 'ROCK Eternal case for New iPad (black)', 883, '', 'empty_thumb.jpg', 28),
(12961, 'ROCK Eternal case for New iPad (green)', 883, '', 'empty_thumb.jpg', 28),
(12963, 'ROCK Defense case for NEW iPad (orange)', 883, '', 'empty_thumb.jpg', 28),
(12903, 'ROCK Eternal case for iPad mini (green)', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 22),
(12904, 'Smart Cover Polyurethane for iPad mini (black)', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 17),
(12905, 'Smart Cover Polyurethane for iPad mini (grey)', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 15),
(12906, 'ROCK Veins case for iPad mini (cream)', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 22),
(12907, 'ROCK Flexible case for iPad mini (dark grey)', 884, 'чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 19.5),
(12908, 'USAMS Leather Stand Cover for iPad mini (black)', 884, 'Выполненный из мягкой кожи чехол USAMS отлично защитит iPad mini и оставляет доступ ко всем портам и функциональным клавишам', 'empty_thumb.jpg', 21),
(12909, 'USAMS Leather Stand Cover for iPad mini (white)', 884, 'Выполненный из мягкой кожи чехол USAMS отлично защитит iPad mini и оставляет доступ ко всем портам и функциональным клавишам', 'empty_thumb.jpg', 21),
(12910, 'USAMS Leather Stand Cover for iPad mini (pink)', 884, 'Выполненный из мягкой кожи чехол USAMS отлично защитит iPad mini и оставляет доступ ко всем портам и функциональным клавишам', 'empty_thumb.jpg', 20),
(12916, 'ROCK Veins case for iPad mini (dark grey)', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 22),
(12955, 'ROCK Eternal case for iPad mini (black)', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 22),
(12956, 'ROCK Eternal case for iPad mini (grey)', 884, '<p>\r\n	кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях</p>\r\n', 'empty_thumb.jpg', 22),
(12957, 'ROCK Eternal case for iPad mini (orange)', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 22),
(12958, 'ROCK Flexible case for iPad mini (pink)', 884, 'чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 19.5),
(12959, 'ROCK Flexible case for iPad mini (green)', 884, 'чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'empty_thumb.jpg', 19.5),
(12964, 'Smart Cover Polyurethane for iPad mini (pink)', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 17),
(12965, 'Smart Cover Polyurethane for iPad mini (white)', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'empty_thumb.jpg', 17),
(12966, 'Back Cover iPad mini (grey)', 884, '<p>\r\n	дымчатый чехол - крышка пластиковый на корпус</p>\r\n', 'empty_thumb.jpg', 8),
(12967, 'Back Cover iPad mini (clear)', 884, '<p>\r\n	прозрачный чехол - крышка пластиковая на корпус</p>\r\n', 'empty_thumb.jpg', 8),
(13046, 'BOROFONE case for iPad mini (black)', 884, '', 'empty_thumb.jpg', 22),
(13131, 'Baseus Grace leather Case iPad mini (blue)', 884, '', 'empty_thumb.jpg', 17),
(13132, 'Baseus Grace leather Case iPad mini (grey)', 884, '', 'empty_thumb.jpg', 17),
(8444, 'Hands free iPhone 3G/3GS/iPod Shuffle', 885, 'наушники\r\n', 'empty_thumb.jpg', 11.5),
(8652, 'Sleeve case Capdase Callid iPhone 3G/3GS (black)', 885, '<p>\r\n	чехол кожаный закрытый с прорезью</p>\r\n', 'empty_thumb.jpg', 14),
(8655, 'Sleeve case iPhone 3G/3GS (силиконовые red/pink/purple)', 885, '', 'empty_thumb.jpg', 1),
(8835, 'Sleeve case Capdase Snak iPhone 3G', 885, '', 'empty_thumb.jpg', 14),
(10255, 'Protective Case for iPhone 3G (black) Ultra Thin', 885, '', 'empty_thumb.jpg', 3),
(10959, 'Sleeve case Capdase Callid iPhone 3G/3GS (white)', 885, '', 'empty_thumb.jpg', 14),
(10960, 'Sleeve case Capdase Callid iPhone 3G/3GS (red)', 885, '', 'empty_thumb.jpg', 13),
(9194, 'Sleeve сase iPhone 4 (black)', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'empty_thumb.jpg', 2),
(9439, 'Capdase Soft Jacket 2 Xpose iPhone 4 (black) (силиконовый)', 886, 'чехол +мягкий чехол+подставка+защитная плёнка', 'empty_thumb.jpg', 9),
(9441, 'Capdase Alumor Metal Case iPhone 4 (black-pink)', 886, '', 'empty_thumb.jpg', 11),
(9442, 'Bumper case iPhone 4 high copy (black)', 886, '', 'empty_thumb.jpg', 7),
(9443, 'Bumper case iPhone 4 (purple)', 886, '', 'empty_thumb.jpg', 4),
(9444, 'Belkin Sleeve case iPhone 4 (white) (силиконовый)', 886, 'чехол силиконовый', 'empty_thumb.jpg', 6.5),
(9445, 'Crystal hard back case iPhone 4 (black)', 886, '', 'empty_thumb.jpg', 5),
(9503, 'Dual SIM Card for iPhone 4 (black) Back Cover 2 in 1', 886, 'переходник с задней крышкой на 2 сим карты ', 'empty_thumb.jpg', 16),
(9518, 'Crystal hard back case iPhone 4 clear (white)', 886, '', 'empty_thumb.jpg', 5),
(9522, 'Dual SIM Card for iPhone 4 (black) Back Cover 3 in 1', 886, 'переходник с задней крышкой на 3 сим карты', 'empty_thumb.jpg', 16),
(9565, 'Belkin Shield Eclipse for iPhone 4 (black-white) (силиконовый)', 886, 'чехол силиконовый', 'empty_thumb.jpg', 6),
(9571, 'Capdase Leather Case Forme Capparel iPhone 4/4S (black) (кожаный)', 886, 'чехол', 'empty_thumb.jpg', 19),
(9647, 'Moshi Hard Case For iPhone 4 (black)', 886, 'чехол', 'empty_thumb.jpg', 5),
(9699, 'ILUV Sentinel Metallic Case for iPhone 4 (bronze)', 886, 'пластиковый чехол', 'empty_thumb.jpg', 3),
(9960, 'Capdase Smart Pocket Value Set Callid Bold+Soft Jacket Xpose For iPhone 4 (black)', 886, '', 'empty_thumb.jpg', 29),
(10017, 'Compact Dual USB Charger for iPod/iPhone Griffin', 886, '', 'empty_thumb.jpg', 13),
(10398, 'Capdase Smart Pocket Callid Dot  iPhone 4/4S (white)', 886, '', 'empty_thumb.jpg', 19),
(10455, 'Epoxy Sticker iPhone 4', 886, 'наклейки', 'empty_thumb.jpg', 2),
(10554, 'Steven Paul Jobs case iPhone 4/4S', 886, '', 'empty_thumb.jpg', 3),
(10872, 'Crystal case iGlaze iPhone 4 (white)', 886, '', 'empty_thumb.jpg', 4),
(10873, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (black-clear)', 886, '<p>\r\n	чехол +мягкий чехол+подставка+защитная плёнка</p>\r\n', 'empty_thumb.jpg', 10),
(10874, 'Crystal case Tenacity iPhone 4/4S (pink)', 886, '', 'empty_thumb.jpg', 6),
(10875, '	Crystal case E.L.Grande iPhone 4/4S 0,3mm (black)', 886, '', 'empty_thumb.jpg', 5),
(10967, 'Belkin Shield Eclipse for iPhone 4 (red-white) (силиконовый)', 886, '<p>\r\n	чехол силиконовый</p>\r\n', 'empty_thumb.jpg', 6),
(10968, 'Belkin Shield Eclipse for iPhone 4 (grey-white) (силиконовый)', 886, 'чехол силиконовый', 'empty_thumb.jpg', 6),
(10970, 'Belkin Sleeve case iPhone 4 (smoky) (силиконовый)', 886, '<p>\r\n	чехол силиконовый</p>\r\n', 'empty_thumb.jpg', 6.5),
(10971, 'Bumper case iPhone 4 (clear)', 886, '', 'empty_thumb.jpg', 4),
(10972, 'Bumper case iPhone 4 (blue)', 886, '', 'empty_thumb.jpg', 4),
(10974, 'Bumper case iPhone 4 (red)', 886, '', 'empty_thumb.jpg', 4),
(10985, 'Bumper case iPhone 4 high copy (white)', 886, '', 'empty_thumb.jpg', 7),
(10986, 'Bumper case iPhone 4 high copy (orange)', 886, '', 'empty_thumb.jpg', 7),
(10987, 'Bumper case iPhone 4 high copy (pink)', 886, '', 'empty_thumb.jpg', 7),
(10988, 'Bumper case iPhone 4 high copy (blue)', 886, '', 'empty_thumb.jpg', 7),
(10992, 'Capdase Smart Pocket Callid iPhone 4/4S (white)', 886, '<p>\r\n	кожаный чехол с прорезью</p>\r\n', 'empty_thumb.jpg', 19),
(10995, 'Capdase Smart Pocket Value Set Callid Bold+Soft Jacket Xpose For iPhone 4 (red)', 886, '', 'empty_thumb.jpg', 29),
(10998, 'Capdase Soft Jacket 2 Xpose iPhone 4 (white) (силиконовый)', 886, '<p>\r\n	чехол +мягкий чехол+подставка+защитная плёнка</p>\r\n', 'empty_thumb.jpg', 9),
(10999, 'Crystal hard back case iPhone 4 (blue)', 886, '', 'empty_thumb.jpg', 5),
(11001, 'Crystal hard back case iPhone 4 (pink)', 886, '', 'empty_thumb.jpg', 5),
(11002, 'Crystal hard back case iPhone 4 (red)', 886, '', 'empty_thumb.jpg', 5),
(11003, 'Crystal hard back case iPhone 4 (light blue)', 886, '', 'empty_thumb.jpg', 5),
(11005, 'Crystal hard back case iPhone 4 (silver)', 886, '', 'empty_thumb.jpg', 5),
(11006, 'Crystal hard back case iPhone 4 (white)', 886, '', 'empty_thumb.jpg', 5),
(11007, 'Crystal hard back case iPhone 4 clear (black)', 886, '', 'empty_thumb.jpg', 5),
(11008, 'ILUV Sentinel Metallic Case for iPhone 4 (silver)', 886, '<p>\r\n	пластиковый чехол</p>\r\n', 'empty_thumb.jpg', 3),
(11009, 'ILUV Sentinel Metallic Case for iPhone 4 (grey)', 886, '<p>\r\n	пластиковый чехол</p>\r\n', 'empty_thumb.jpg', 3),
(11010, 'ILUV Sentinel Metallic Case for iPhone 4 (gold)', 886, '<p>\r\n	пластиковый чехол</p>\r\n', 'empty_thumb.jpg', 3),
(11011, 'Moshi Hard Case For iPhone 4 (white)', 886, '', 'empty_thumb.jpg', 5),
(11013, 'Moshi Hard Case For iPhone 4 (red)', 886, '', 'empty_thumb.jpg', 5),
(11014, 'Moshi Hard Case For iPhone 4 (blue)', 886, '', 'empty_thumb.jpg', 5),
(11017, 'Capdase Alumor Metal Case iPhone 4 (black-blue)', 886, '', 'empty_thumb.jpg', 11),
(11018, 'Capdase Alumor Metal Case iPhone 4 (black)', 886, '', 'empty_thumb.jpg', 11),
(11019, 'Capdase Alumor Metal Case iPhone 4 (mirror-black)', 886, '', 'empty_thumb.jpg', 11),
(11020, 'Bumper hard plastic case ', 886, '', 'empty_thumb.jpg', 8),
(11023, 'Bumper hard plastic case Vser iPhone 4/4S (blue-white)', 886, '', 'empty_thumb.jpg', 8),
(11024, 'Bumper hard plastic case Vser iPhone 4/4S (green-white)', 886, '', 'empty_thumb.jpg', 8),
(11025, 'Bumper hard plastic case Vser iPhone 4/4S (white-clear)', 886, '', 'empty_thumb.jpg', 8),
(11030, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (blue-clear)', 886, '', 'empty_thumb.jpg', 13),
(11031, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (green-clear)', 886, '', 'empty_thumb.jpg', 13),
(11033, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (yellow-clear)', 886, '', 'empty_thumb.jpg', 13),
(11035, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (orange)', 886, '', 'empty_thumb.jpg', 5),
(11036, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (grey)', 886, '', 'empty_thumb.jpg', 5),
(11037, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (white)', 886, '', 'empty_thumb.jpg', 5),
(11038, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (pink)', 886, '', 'empty_thumb.jpg', 5),
(11039, 'Crystal case Tenacity iPhone 4/4S (white)', 886, '', 'empty_thumb.jpg', 6),
(11040, 'Crystal case Tenacity iPhone 4/4S (lime)', 886, '', 'empty_thumb.jpg', 6),
(11041, 'Crystal case iGlaze iPhone 4 (smoky)', 886, '', 'empty_thumb.jpg', 4),
(11042, 'Crystal case iGlaze iPhone 4 (black)', 886, '', 'empty_thumb.jpg', 4),
(11043, 'Crystal case \"iGlaze\" iPhone 4 (pink)', 886, '', 'empty_thumb.jpg', 4),
(11044, 'Crystal case iGlaze iPhone 4 (purple)', 886, '', 'empty_thumb.jpg', 4),
(11045, 'Crystal case iGlaze iPhone 4 (green)', 886, '', 'empty_thumb.jpg', 4),
(11046, 'Crystal case iGlaze iPhone 4 (yellow)', 886, '', 'empty_thumb.jpg', 4),
(11047, 'Crystal case iGlaze iPhone 4 (blue)', 886, '', 'empty_thumb.jpg', 4),
(11048, 'Sleeve сase iPhone 4 (white)', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'empty_thumb.jpg', 2),
(11049, 'Sleeve сase iPhone 4 (pink)', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'empty_thumb.jpg', 2),
(11050, 'Sleeve сase iPhone 4 (violet)', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'empty_thumb.jpg', 2),
(11052, 'Capdase Smart Pocket Callid Dot  iPhone 4/4S (blue)', 886, '', 'empty_thumb.jpg', 19),
(11276, 'Crystal case Tenacity iPhone 4/4S (grey)', 886, '', 'empty_thumb.jpg', 6),
(11523, 'Capdase Alumor Metal Case iPhone 4 (mirror-purple)', 886, '', 'empty_thumb.jpg', 11),
(11538, 'Moshi Concerti for iPhone 4/4S (black)', 886, '', 'empty_thumb.jpg', 29),
(11607, 'Capdase Leather Case Forme Capparel iPhone 4/4S (white) (кожаный)', 886, 'чехол', 'empty_thumb.jpg', 19),
(11633, 'HOCO Open Face Case iPhone 4/4S (black) ', 886, '<p>\r\n	задняя накладка + пленка</p>\r\n', 'empty_thumb.jpg', 12),
(11634, 'HOCO Open Face Case iPhone 4/4S (black-red) ', 886, 'задняя накладка + пленка', 'empty_thumb.jpg', 12),
(11635, 'HOCO Open Face Case iPhone 4/4S (white) ', 886, 'задняя накладка + пленка', 'empty_thumb.jpg', 12),
(11636, 'HOCO Open Face Case iPhone 4/4S (red) ', 886, '<p>\r\n	задняя накладка + пленка</p>\r\n', 'empty_thumb.jpg', 12),
(11637, 'HOCO Open Face Case iPhone 4/4S (pink) ', 886, '<p>\r\n	задняя накладка + пленка</p>\r\n', 'empty_thumb.jpg', 12),
(11638, 'HOCO Duke Advanced Leather Case for iPhone 4/4S (white)', 886, '', 'empty_thumb.jpg', 18),
(11639, 'HOCO Duke Advanced Leather Case for iPhone 4/4S (pink)', 886, '', 'empty_thumb.jpg', 18),
(11640, 'HOCO Leather case Earl fashion for IPhone 4/4S (black)', 886, 'кожа', 'empty_thumb.jpg', 19),
(11641, 'HOCO Leather case Earl fashion for IPhone 4/4S (pink)', 886, 'кожа', 'empty_thumb.jpg', 19),
(11642, 'HOCO Leather case Earl fashion for IPhone 4/4S (red)', 886, 'кожа', 'empty_thumb.jpg', 19),
(11643, 'HOCO Leather case Earl fashion for IPhone 4/4S (white)', 886, 'кожа', 'empty_thumb.jpg', 19),
(11644, 'HOCO Leather case Marquess Classic for IPhone 4/4S (black)', 886, 'кожаный чехол с прорезью', 'empty_thumb.jpg', 20),
(11645, 'HOCO Leather case Marquess Classic for IPhone 4/4S (pink)', 886, 'кожаный чехол с прорезью', 'empty_thumb.jpg', 20),
(11647, 'DiscoveryBuy leather case for iPhone 4/4S (black)', 886, '', 'empty_thumb.jpg', 17),
(11648, 'DiscoveryBuy leather back cover for iPhone 4/4S (white)', 886, '', 'empty_thumb.jpg', 17),
(11649, 'DiscoveryBuy leather back cover for iPhone 4/4S (pink)', 886, '', 'empty_thumb.jpg', 17),
(11686, 'Capdase Soft Jacket 2 Xpose iPhone 4 (black-diamond) (силиконовый)', 886, '<p>\r\n	чехол +мягкий чехол+подставка+защитная плёнка</p>\r\n', 'empty_thumb.jpg', 9),
(12068, 'Moshi Concerti for iPhone 4/4S (red)', 886, '', 'empty_thumb.jpg', 29),
(12069, 'Moshi iGlaze Kameleon for iPhone 4/4S (black)', 886, 'leather shell case (кожа)', 'empty_thumb.jpg', 23),
(12070, 'Moshi iGlaze Kameleon for iPhone 4/4S (white)', 886, 'leather shell case (кожа)', 'empty_thumb.jpg', 23),
(12071, 'Moshi iGlaze snap on case for iPhone 4/4S (silver)', 886, '', 'empty_thumb.jpg', 23),
(12072, 'Moshi iGlaze snap on case for iPhone 4/4S (red)', 886, '', 'empty_thumb.jpg', 23),
(12073, 'Moshi iGlaze snap on case for iPhone 4/4S (black)', 886, '', 'empty_thumb.jpg', 23),
(12085, 'HOCO Open Face Case iPhone 4/4S (white-red)', 886, '', 'empty_thumb.jpg', 12),
(12086, 'HOCO Open Face Case iPhone 4/4S (purple) ', 886, '', 'empty_thumb.jpg', 12),
(12129, 'Moshi iGlaze snap on case for iPhone 4/4S (red) copy', 886, '', 'empty_thumb.jpg', 5),
(12131, 'Rhombic Case for iPhone 4/4S Chanel (black)', 886, '', 'empty_thumb.jpg', 13),
(12133, 'Rhombic Case for iPhone 4/4S Chanel (pink)', 886, '', 'empty_thumb.jpg', 13),
(12205, 'Button Stickers for iPhone/iPod/iPad', 886, 'наклейки на кнопку Home', 'empty_thumb.jpg', 1.8),
(12353, 'Capdase Upper Polka iPhone 4/4S (white)', 886, 'чехол из кожзаменителя  тип чехла флип-топ', 'empty_thumb.jpg', 18),
(12355, 'Borofone Explorer Leather Case for iPhone 4/4S (grey)', 886, '', 'empty_thumb.jpg', 15),
(12365, 'Moshi iGlaze snap on case for iPhone 4/4S (black) copy', 886, '', 'empty_thumb.jpg', 5),
(12406, 'HOCO Duke Advanced Leather Case for iPhone 4/4S (black)', 886, '', 'empty_thumb.jpg', 18),
(12482, 'SUPER Case for iPhone 4/4S (black)', 886, '', 'empty_thumb.jpg', 12),
(12483, 'SUPER Case for iPhone 4/4S (white)', 886, '', 'empty_thumb.jpg', 12),
(12484, 'SUPER Case for iPhone 4/4S (red)', 886, '', 'empty_thumb.jpg', 12),
(12485, 'SUPER Case for iPhone 4/4S (grey)', 886, '', 'empty_thumb.jpg', 12),
(13143, 'Чехол MissCase для iPhone 4/4S (purple)', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'empty_thumb.jpg', 5),
(13144, 'Чехол MissCase для iPhone 4/4S (green)', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'empty_thumb.jpg', 5),
(13176, 'Чехол-накладка c шипами на iPhone 4/4S (чёрный /шипы серебристые)', 886, '', 'empty_thumb.jpg', 4),
(13177, 'Чехол радужный для iPhone 4/4S (белый)', 886, '', 'empty_thumb.jpg', 5),
(13188, 'Чехол MissCase для iPhone 4/4S (pink)', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'empty_thumb.jpg', 5),
(13190, 'Чехол MissCase для iPhone 4/4S (blue)', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'empty_thumb.jpg', 5),
(13358, 'Ferrari Leather Hard case iPhone 4/4S (black)', 886, '', 'empty_thumb.jpg', 19),
(13359, 'Griffin Elan Form case iPhone 4 (black)', 886, '', 'empty_thumb.jpg', 8),
(13376, 'Moshi Hard Case For iPhone 4 (pink)', 886, '', 'empty_thumb.jpg', 5),
(13571, 'Чехол на iPhone 4/4S прозрачный с чёрным бампером ', 886, '', 'empty_thumb.jpg', 7),
(13572, 'Чехол на iPhone 4/4S прозрачный с белым бампером ', 886, '', 'empty_thumb.jpg', 7),
(13573, 'Чехол на iPhone 4/4S прозрачный с салатовым бампером ', 886, '', 'empty_thumb.jpg', 7),
(13574, 'Чехол на iPhone 4/4S прозрачный с оранжевым бампером ', 886, '', 'empty_thumb.jpg', 7),
(13575, 'Чехол на iPhone 4/4S прозрачный с розовым бампером ', 886, '', 'empty_thumb.jpg', 7),
(13595, 'Чехол-накладка на iPhone 4/4S чёрный с разноцветными камнями (в квадратик)', 886, '', 'empty_thumb.jpg', 13),
(13596, 'Чехол-накладка на iPhone 4/4S белый с разноцветными камнями (в квадратик)', 886, '', 'empty_thumb.jpg', 13),
(13597, 'Чехол-накладка на iPhone 4/4S чёрный с разноцветными камнями (дуга)', 886, '', 'empty_thumb.jpg', 13),
(13598, 'Чехол-накладка на iPhone 4/4S чёрный с разноцветными камнями (абстракция)', 886, '', 'empty_thumb.jpg', 13),
(9390, 'Перчатки для iPhone/iPad (black, white, brown, grey)', 887, 'Мягкие и теплые перчатки позволят вам пользоваться вашим iPhone, iPad или любым другим сенсорным мультимедийным устройством, сохраняя ваши руки в тепле.', 'empty_thumb.jpg', 2),
(12661, 'HOCO Duke Leather Case iPhone 5 (pink)', 887, 'кожаный чехол-книжка HOCO, присутствуют все вырезы под камеру, нижний динамик, кнопки регулировки громкости, откидная крышка чехла фиксируется на специальный зажим, внутри чехол обшит замшей', 'empty_thumb.jpg', 20),
(12662, 'HOCO Duke Leather Case iPhone 5 (black)', 887, 'кожаный чехол-книжка HOCO, присутствуют все вырезы под камеру, нижний динамик, кнопки регулировки громкости, откидная крышка чехла фиксируется на специальный зажим, внутри чехол обшит замшей', 'empty_thumb.jpg', 20),
(12663, 'HOCO Duke Leather Case iPhone 5 (white)', 887, 'кожаный чехол-книжка HOCO, присутствуют все вырезы под камеру, нижний динамик, кнопки регулировки громкости, откидная крышка чехла фиксируется на специальный зажим, внутри чехол обшит замшей', 'empty_thumb.jpg', 20),
(12664, 'ROCK Case Eternal iPhone 5 (black)', 887, '', 'empty_thumb.jpg', 17),
(12665, 'ROCK Case Eternal iPhone 5 (green)', 887, '', 'empty_thumb.jpg', 17),
(12810, 'Bumper case iPhone 5 (black)', 887, 'Бампер на iPhone 5 чёрный', 'empty_thumb.jpg', 11),
(12811, 'Bumper case iPhone 5 (white)', 887, 'Бампер на iPhone 5 белый', 'empty_thumb.jpg', 12),
(12812, 'Bumper case iPhone 5 (pink)', 887, 'Бампер на iPhone 5 розовый', 'empty_thumb.jpg', 11),
(12885, 'Moshi hard shell case iPhone 5 (black)', 887, 'Чехол - накладка для iPhone 5', 'empty_thumb.jpg', 8),
(12886, 'Moshi hard shell case iPhone 5 (white)', 887, 'Чехол - накладка для iPhone 5', 'empty_thumb.jpg', 8),
(12887, 'Moshi hard shell case iPhone 5 (pink)', 887, 'Чехол - накладка для iPhone 5', 'empty_thumb.jpg', 8),
(13170, 'Чехол c шипами для iPhone 5 (тигровый)', 887, 'пластиковый с наклеянной кожей', 'empty_thumb.jpg', 8),
(12920, 'HandsFree iPhone 5 EarPod original', 887, 'наушники оригинальные', 'empty_thumb.jpg', 28),
(12948, 'ROCK Case Eternal iPhone 5 (orange)', 887, '', 'empty_thumb.jpg', 17),
(12949, 'HOCO Lizard Leather Case iPhone 5 (black)', 887, 'кожаный чехол - книжки , серии Royal, линейка Lizard выполнены из телячьей кожи, в стиле кожи ящерицы путем искусственного рифления, внутренняя отделка чехлов замшей, края и технологические отверстия чехла дополнительно обработаны спайкой, используется кл', 'empty_thumb.jpg', 21),
(12950, 'HOCO Lizard Leather Case iPhone 5 (white)', 887, 'кожаный чехол - книжки , серии Royal, линейка Lizard выполнены из телячьей кожи, в стиле кожи ящерицы путем искусственного рифления, внутренняя отделка чехлов замшей, края и технологические отверстия чехла дополнительно обработаны спайкой, используется кл', 'empty_thumb.jpg', 21),
(12951, 'HOCO Lizard Leather Case iPhone 5 (pink)', 887, 'кожаный чехол - книжки , серии Royal, линейка Lizard выполнены из телячьей кожи, в стиле кожи ящерицы путем искусственного рифления, внутренняя отделка чехлов замшей, края и технологические отверстия чехла дополнительно обработаны спайкой, используется кл', 'empty_thumb.jpg', 21),
(12952, 'HOCO Protection Case iPhone 5 (black)', 887, 'кожаная чехол-накладка Нoco на заднюю панель', 'empty_thumb.jpg', 17),
(12953, 'HOCO Protection Case iPhone 5 (white)', 887, 'кожаная чехол-накладка Нoco на заднюю панель', 'empty_thumb.jpg', 17),
(12954, 'HOCO Protection Case iPhone 5 (pink)', 887, 'кожаная чехол-накладка Нoco на заднюю панель', 'empty_thumb.jpg', 17),
(13047, 'Case for iPhone 5 0,3mm (clear)', 887, 'Ультратонкий пластиковый чехол на iPhone 5 прозрачный', 'empty_thumb.jpg', 9),
(13048, 'Case for iPhone 5 0,3mm (black)', 887, 'Ультратонкий пластиковый чехол на iPhone 5 чёрный', 'empty_thumb.jpg', 9),
(13149, 'Чехол Marc Jacobs kisses для iPhone 5 (black)', 887, 'Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений', 'empty_thumb.jpg', 10),
(13151, 'Чехол Marc Jacobs kisses для iPhone 5 (silver)', 887, '<p>\r\n	Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений</p>\r\n', 'empty_thumb.jpg', 10),
(13153, 'Чехол Marc Jacobs резиновый с буквами для iPhone 5 (black)', 887, 'Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений', 'empty_thumb.jpg', 12),
(13155, 'Чехол Marc Jacobs резиновый с буквами для iPhone 5 (yellow)', 887, 'Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений', 'empty_thumb.jpg', 12),
(13159, 'Чехол с черепами для iPhone 5 (чёрный /черепа серебристые)', 887, 'пластиковый с наклеянной кожей', 'empty_thumb.jpg', 15),
(13161, 'Чехол с шипами крестом для iPhone 5 (черный/шипы золотистые)', 887, 'пластиковый с наклеянной кожей', 'empty_thumb.jpg', 8),
(13162, 'Чехол с шипами крестом для iPhone 5 (розовый/шипы серебристые)', 887, 'пластиковый с наклеянной кожей', 'empty_thumb.jpg', 8),
(13163, 'Чехол с шипами крестом для iPhone 5 (белый/шипы серебристые)', 887, 'пластиковый с наклеянной кожей', 'empty_thumb.jpg', 8),
(13164, 'Чехол с шипами крестом для iPhone 5 (английский флаг/шипы серебристые)', 887, 'пластиковый с наклеянной кожей', 'empty_thumb.jpg', 8),
(13167, 'Чехол для iPhone 5 радужный (чёрный)', 887, '', 'empty_thumb.jpg', 9),
(13171, 'Чехол для iPhone 5 радужный  (розовый)', 887, '', 'empty_thumb.jpg', 9),
(13172, 'Case for iPhone 5 0,3mm (pink)', 887, 'Ультратонкий пластиковый чехол на iPhone 5 розовый', 'empty_thumb.jpg', 9),
(13173, 'Case for iPhone 5 0,3mm (blue)', 887, 'Ультратонкий пластиковый чехол на iPhone 5 голубой', 'empty_thumb.jpg', 9),
(13174, 'Case for iPhone 5 0,3mm (green)', 887, 'Ультратонкий пластиковый чехол на iPhone 5 зелёный', 'empty_thumb.jpg', 9),
(13187, 'HandsFree iPhone 5 EarPod', 887, 'наушники', 'empty_thumb.jpg', 13.7),
(13299, 'Чехол Swarovski для iPhone 5 (розовый)', 887, '<p>\r\n	чехол-накладка пластиковый</p>\r\n', 'empty_thumb.jpg', 19),
(13300, 'Чехол Swarovski для iPhone 5 (голубой)', 887, 'чехол-накладка пластиковый', 'empty_thumb.jpg', 19),
(13301, 'Чехол Swarovski для iPhone 5 (бело-серебристый)', 887, '<p>\r\n	чехол-накладка пластиковый</p>\r\n', 'empty_thumb.jpg', 19),
(13351, 'Чехол с шипами для iPhone 5 (белый)', 887, '<p>\r\n	пластиковый с наклеянной кожей</p>\r\n', 'empty_thumb.jpg', 8),
(13353, 'Protective Case for iPhone 5 (grey-clear)', 887, 'Жёсткий чехол-накладка прозрачно-серый', 'empty_thumb.jpg', 10),
(13354, 'Protective Case for iPhone 5 (pink-clear)', 887, 'Жёсткий чехол-накладка прозрачно-розовый', 'empty_thumb.jpg', 10),
(13355, 'Protective Case for iPhone 5 (black-clear)', 887, 'Жёсткий чехол-накладка прозрачно-чёрный', 'empty_thumb.jpg', 10),
(13356, 'Protective Case for iPhone 5 (white-clear)', 887, 'Жёсткий чехол-накладка прозрачно-белый', 'empty_thumb.jpg', 10),
(13428, 'Чехол дополнительный аккумулятор для iPhone 5 \"Ferrari\" (чёрный)', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'empty_thumb.jpg', 28),
(13429, 'Чехол дополнительный аккумулятор для iPhone 5 (серебристо-белый)', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'empty_thumb.jpg', 26),
(13430, 'Чехол дополнительный аккумулятор для iPhone 5 (чёрный)', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'empty_thumb.jpg', 26),
(13431, 'Чехол дополнительный аккумулятор для iPhone 5 \"Ferrari\" (серебристо-белый)', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'empty_thumb.jpg', 28),
(13491, 'Mophie Juice Pack Air iPhone 5 (чёрный)', 887, '<p>\r\n	Чехол с дополнительным аккумулятором для iPhone 5 -это надежная защита и долгая работа вашего смартфона, есть индикатор заряда батареи, Материал: Поликарбонат</p>\r\n', 'empty_thumb.jpg', 34),
(13492, 'Mophie Juice Pack Air iPhone 5 (белый)', 887, '<p>\r\n	Чехол с дополнительным аккумулятором для iPhone 5 -это надежная защита и долгая работа вашего смартфона, есть индикатор заряда батареи, Материал: Поликарбонат</p>\r\n', 'empty_thumb.jpg', 34),
(13566, 'Чехол Swarovski для iPhone 5 (сыпучие камушки)', 887, '', 'empty_thumb.jpg', 15),
(13570, 'Protective Case for iPhone 5 (red-clear)', 887, 'Жёсткий чехол-накладка прозрачно-красный', 'empty_thumb.jpg', 10),
(13576, 'Чехол на iPhone 5 прозрачный с белым бампером ', 887, '', 'empty_thumb.jpg', 8),
(13577, 'Чехол на iPhone 5 прозрачный с чёрным бампером ', 887, '', 'empty_thumb.jpg', 8),
(13578, 'Чехол на iPhone 5 прозрачный с голубым бампером ', 887, '', 'empty_thumb.jpg', 8),
(13579, 'Чехол на iPhone 5 прозрачный с салатовым бампером ', 887, '', 'empty_thumb.jpg', 8),
(13580, 'Чехол на iPhone 5 прозрачный с розовым бампером ', 887, '', 'empty_thumb.jpg', 8),
(13581, 'Чехол на iPhone 5 (жёлтый с двумя белыми полосами)', 887, '', 'empty_thumb.jpg', 9),
(13582, 'Чехол на iPhone 5 (салатовый с двумя белыми полосами)', 887, '', 'empty_thumb.jpg', 9),
(13583, 'Чехол на iPhone 5 с белой полосой синий', 887, '', 'empty_thumb.jpg', 9),
(13584, 'Чехол на iPhone 5 с белой полосой розовый ', 887, '', 'empty_thumb.jpg', 9),
(13585, 'Чехол на iPhone 5 с белой полосой бирюзовый ', 887, '', 'empty_thumb.jpg', 9),
(13586, 'Чехол на iPhone 5 с белой полосой чёрный', 887, '', 'empty_thumb.jpg', 9),
(13600, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (в полоску)', 887, '', 'empty_thumb.jpg', 13),
(13601, 'Чехол-накладка на iPhone 5 белый с разноцветными камнями (в полоску)', 887, '', 'empty_thumb.jpg', 13),
(13602, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (дуга)', 887, '', 'empty_thumb.jpg', 13),
(13603, 'Чехол-накладка на iPhone 5 белый с разноцветными камнями (дуга)', 887, '', 'empty_thumb.jpg', 13),
(13604, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (сердце)', 887, '', 'empty_thumb.jpg', 13),
(13605, 'Чехол-накладка на iPhone 5 белый с разноцветными камнями (сердце)', 887, '', 'empty_thumb.jpg', 13),
(13606, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (купальник)', 887, '', 'empty_thumb.jpg', 13),
(13607, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами (полоса горизонтальная)', 887, '', 'empty_thumb.jpg', 25),
(13608, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами (полоса диагональ)', 887, '', 'empty_thumb.jpg', 25),
(13609, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами (полоса зигзаг)', 887, '', 'empty_thumb.jpg', 25),
(13610, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами и часами', 887, '', 'empty_thumb.jpg', 28),
(13611, 'Чехол на iPhone 5 Swarovski чёрный с разноцветными кристаллами и часами', 887, '', 'empty_thumb.jpg', 28),
(8393, 'Cable USB iPhone/iPod', 888, '', 'empty_thumb.jpg', 9),
(8552, 'Car kit iPhone 2G/3G + FM transmitter', 888, 'Автомобильная зарядка с держателем для iPod\\iPhone с av передатчиком', 'empty_thumb.jpg', 14),
(8660, 'Capdase Charger Dual USB Car & cable kit ', 888, 'Комплект зарядных устройств на iPhone с кабелем.', 'empty_thumb.jpg', 38),
(8661, 'Car kit Monster, iCar Changer inc.FM modulator', 888, 'Автомобильная зарядка с держателем для iPod\\iPhone с av передатчиком', 'empty_thumb.jpg', 18),
(9078, 'Charger any micro USB Auto Belkin ', 888, 'Micro-USB для прикуривателя  (Быстрозарядный USB-порт)', 'empty_thumb.jpg', 10.7),
(9080, 'AV Composite cable iPhone & iPod Capdase ', 888, 'кабель для подключения к audio & video (3 кабеля)', 'empty_thumb.jpg', 33),
(9178, 'Charger Dual USB Car Capdase (white, black)', 888, 'Автомобильная зарядка на iPhone', 'empty_thumb.jpg', 17),
(9186, 'Universal Dock For iPad big', 888, 'Подставка для iPad.', 'empty_thumb.jpg', 7),
(9187, 'Universal Dock For iPad small ', 888, 'Подставка для iPhone\\iPad.', 'empty_thumb.jpg', 5.5),
(9195, 'AC Adapter+euroadapter iPad original', 888, '', 'empty_thumb.jpg', 25),
(9196, 'Euroadapter iPhone/iPad', 888, '', 'empty_thumb.jpg', 6.3),
(9448, 'Micro Sim Cutter For iPhone 4/iPad', 888, 'обрезалка для симок', 'empty_thumb.jpg', 14),
(9449, 'Micro Sim Card Adapter (to SIM) Classic', 888, 'переходник на Micro sim', 'empty_thumb.jpg', 1.5),
(9640, 'AV Component cable iPhone & iPod Capdase ', 888, 'кабель для подключения к audio & video(5 кабелей)', 'empty_thumb.jpg', 34),
(9698, 'Charger any micro USB Auto Belkin  ( без упаковки )', 888, 'Micro-USB для прикуривателя  (Быстрозарядный USB-порт)', 'empty_thumb.jpg', 9.7),
(10250, 'VGA Adapter for iPad /iPad 2/iPhone 4/iPod touch 4', 888, 'адаптер для подключения iPad 2/iPad/iPhone 4/iPod touch 4G к телевизору, проэктору или VGA дисплею', 'empty_thumb.jpg', 35),
(10633, 'Micro Sim Card Adapter ', 888, 'переходник на Micro sim', 'empty_thumb.jpg', 1.5),
(10871, 'Griffin PowerJolt Dual Micro Car Charger for iPad/iPhone/iPod ', 888, 'автомобильное зарядное устройство оснащенное сразу двумя портами USB', 'empty_thumb.jpg', 19),
(10894, 'HDMI Adapter for iPad /iPad 2 ', 888, '<p>\r\n	HDMI кабель для подключения к телевизору.</p>\r\n', 'empty_thumb.jpg', 29),
(11608, 'AC Adapter+euroadapter iPad ', 888, '', 'empty_thumb.jpg', 19),
(12047, 'Stylus iPhone (short) black', 888, '', 'empty_thumb.jpg', 3.5),
(12048, 'Stylus iPhone (short) silver', 888, '', 'empty_thumb.jpg', 3.5),
(12049, 'Stylus iPhone (short) red', 888, '', 'empty_thumb.jpg', 3.5),
(12050, 'Stylus iPhone (short) pink', 888, '', 'empty_thumb.jpg', 3.5),
(12051, 'Stylus iPhone (middle) black', 888, '', 'empty_thumb.jpg', 3.5),
(12052, 'Stylus iPhone (middle) pink', 888, '', 'empty_thumb.jpg', 3.5),
(12053, 'Stylus iPhone (middle) white', 888, '', 'empty_thumb.jpg', 3.5),
(12204, 'Monster Beats by Dr. Dre iBeats With ControlTalk In-Ear Headphones (black) ', 888, 'вакуумные наушники-вкладыши для iPhone', 'empty_thumb.jpg', 35),
(12508, 'Monster Beats by Dr. Dre iBeats With ControlTalk In-Ear Headphones (white) ', 888, 'вакуумные наушники-вкладыши для iPhone', 'empty_thumb.jpg', 35),
(12658, 'Nano Sim Cutter iPhone 5 (noname)', 888, 'обрезалка для симок', 'empty_thumb.jpg', 16),
(12659, 'Nano Sim Cutter iPhone 5 ROCK + adapters', 888, 'обрезалка для симок', 'empty_thumb.jpg', 16),
(12660, 'Nano Sim + Micro Sim Adapters iPhone 4/4S/5', 888, 'переходник с nano и micro SIM', 'empty_thumb.jpg', 8),
(12917, 'USB Cable Lightning iPhone 5/ iPad mini ', 888, 'Кабель для iPhone5/iPad mini', 'empty_thumb.jpg', 9.8),
(12918, 'USB Cable Lightning iPhone 5/ iPad mini original', 888, 'Кабель для iPhone5/iPad mini', 'empty_thumb.jpg', 19),
(12919, 'Lightning to Micro USB Adapter', 888, 'переходник с микро USB на Lightning', 'empty_thumb.jpg', 13.5),
(12921, 'Connection Kit Lightning iPhone 5/ iPad mini 3-in-1', 888, 'переходник для фотокамер, Micro SD/ SD', 'empty_thumb.jpg', 15),
(12923, 'Lightning to 30-pin Adapter ', 888, 'переходник из нового коннектора Lightning в традиционный 30-пиновый разъем', 'empty_thumb.jpg', 11),
(13327, 'Портативное зарядное устройство Lepow-stone  (серебристое) 2 USB + кабель', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'empty_thumb.jpg', 40),
(13328, 'Портативное зарядное устройство Lepow-stone  (белое) 2 USB + кабель', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'empty_thumb.jpg', 40),
(13329, 'Портативное зарядное устройство Lepow-stone  (салатовое) 2 USB + кабель', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'empty_thumb.jpg', 40),
(13330, 'Портативное зарядное устройство Lepow-stone  (голубое) 2 USB + кабель', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'empty_thumb.jpg', 40),
(13331, 'Портативное зарядное устройство Lepow-stone  (розовое) 2 USB + кабель', 888, '<p>\r\n	Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA</p>\r\n', 'empty_thumb.jpg', 40),
(13332, 'Портативное зарядное устройство Lepow-stone  (чёрное) 2 USB + кабель', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'empty_thumb.jpg', 40),
(13352, 'Nano Sim + Micro Sim Cutter iPhone/iPad', 888, 'Устройство для обрезки сим карт под нано сим и микросим карту.', 'empty_thumb.jpg', 19),
(13405, 'Griffin PowerJolt Dual Micro Car Charger for iPhone 5/iPad 4/iPad mini', 888, '', 'empty_thumb.jpg', 25),
(13489, 'Портативное зарядное устройство Lepow-stone  (золотистое) 2 USB + кабель', 888, '', 'empty_thumb.jpg', 40),
(13490, 'Портативное зарядное устройство Lepow-stone  (тёмно-розовый) 2 USB + кабель', 888, '', 'empty_thumb.jpg', 40),
(13453, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black) \"Aventador D1\"', 895, 'Чехол флип-кейс Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи; Чехол очень тонкий и легкий, все порты и разъёмы остаются открытыми. Чехол не увеличит вес и объем вашего смартфона. ', 'empty_thumb.jpg', 35),
(13454, 'Чехол на iPhone 5 Lamborghini Genuine Leather Slim Wallet Cover (black)', 895, 'Стильный кожаный чехол-крышка с логотипом Lamborghini и отделением для пластиковых карт', 'empty_thumb.jpg', 32),
(13455, 'Чехол на iPhone 5 Lamborghini Policarbonate and TPV 2in1 Back Cover (grey) \"Super leggera stylish D1\"', 895, 'Стильный пластиковый чехол-крышка с логотипом Lamborghini и флагом Италии. Цвет Серый .Идеально прилегает к устройству.Отверстия для камеры и вспышки.Свободный доступ к сенсорному экрану, элементам управления и необходимым разъемам.', 'empty_thumb.jpg', 23),
(13456, 'Чехол на iPhone 5 Lamborghini Policarbonate and TPV 2in1 Back Cover (white) \"Super leggera stylish D1\"', 895, 'Стильный пластиковый чехол-крышка с логотипом Lamborghini и флагом Италии. Цвет белый .Идеально прилегает к устройству.Отверстия для камеры и вспышки.Свободный доступ к сенсорному экрану, элементам управления и необходимым разъемам.', 'empty_thumb.jpg', 23),
(13457, 'Чехол на iPhone 5 Lamborghini Policarbonate and TPV 2in1 Back Cover (orange) \"Super leggera stylish D1\"', 895, 'Стильный пластиковый чехол-крышка с логотипом Lamborghini и флагом Италии. Цвет Оранжевый .Идеально прилегает к устройству.Отверстия для камеры и вспышки.Свободный доступ к сенсорному экрану, элементам управления и необходимым разъемам.', 'empty_thumb.jpg', 23),
(13458, 'Чехол на iPhone 5 Lamborghini Policarbonate Back Cover (black) \"Murcielago stylish D1\"', 895, '', 'empty_thumb.jpg', 25),
(13459, 'Чехол на iPhone 5 Lamborghini Policarbonate Back Cover (white) \"Murcielago stylish D1\"', 895, '', 'empty_thumb.jpg', 25),
(13460, 'Чехол на iPhone 5 Lamborghini Policarbonate Back Cover (black) \"Gallardo Stylish D1\"', 895, '', 'empty_thumb.jpg', 25),
(13461, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black-green) \"Gallardo D2\"', 895, 'Чехол флип-кейс Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи; Чехол очень тонкий и легкий, все порты и разъёмы остаются открытыми. Чехол не увеличит вес и объем вашего смартфона. ', 'empty_thumb.jpg', 35),
(13463, 'Чехол на iPhone 5 Lamborghini Genuine Leather Flip Case & Carbon Fiber (black)  \"Avendator-D2\"', 895, 'Чёрный чехол-флип выполнен из натуральной высококачественной кожи с карбоновой вставкой серии Avendator-D2 для iPhone 5', 'empty_thumb.jpg', 35),
(13464, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover (black) \"Aventador\"', 895, '', 'empty_thumb.jpg', 30),
(13465, 'Чехол на iPhone 5 Lamborghini Leather Back Cover (black) \"Performante D1\"', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'empty_thumb.jpg', 27),
(13466, 'Чехол на iPhone 5 Lamborghini Leather Back Cover (white) \"Performante D1\"', 895, 'Кожаный чехол накладка белого цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'empty_thumb.jpg', 27),
(13467, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black) \"Performante-D1\"', 895, 'Чехол флип-кейс Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи; Чехол очень тонкий и легкий, все порты и разъёмы остаются открытыми. Чехол не увеличит вес и объем вашего смартфона. ', 'empty_thumb.jpg', 35),
(13468, 'Чехол на iPhone 5 Lamborghini Ultra-Slim Leather Flip Case (black)', 895, 'Чёрный ультра-тонкий чехол книжка для iPhone 5 из натуральной высококачественной кожи', 'empty_thumb.jpg', 35),
(13469, 'Чехол на iPhone 5 Lamborghini Ultra-Slim Leather Flip Case (white)', 895, 'Белый ультра-тонкий чехол книжка для iPhone 5 из натуральной высококачественной кожи', 'empty_thumb.jpg', 35),
(13470, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black) \"Gallardo D1\"', 895, 'Чёрный чехол флип-кейс на магните Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи', 'empty_thumb.jpg', 35),
(13471, 'Чехол на iPhone 5 Lamborghini Leather Back Cover + Vertical Wallet Cover iPhone \"Gallardo D1\"', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini с отделом для пластиковых карт', 'empty_thumb.jpg', 32),
(13472, 'Чехол на iPhone 5 Lamborghini Leather Back Cover + Vertical Wallet Cover (white) \"Gallardo D1\"', 895, 'Кожаный чехол накладка белого цвета Lamborghini с отделом для пластиковых карт', 'empty_thumb.jpg', 32),
(13473, 'Чехол на iPhone 5 Lamborghini Leather Back Cover + Vertical Wallet Cover (purple) \"Gallardo D1\"', 895, 'Кожаный чехол накладка фиолетового цвета Lamborghini с отделом для пластиковых карт', 'empty_thumb.jpg', 32),
(13474, 'Чехол на iPhone 5 Lamborghini Leather Back Cover (black) \"Genuine\"', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'empty_thumb.jpg', 30),
(13475, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover (black) \"Gallardo D1\"', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'empty_thumb.jpg', 30),
(13476, 'Чехол на iPhone 5 Lamborghini Leather Sleeve Case (black) \"Gallardo D1\"', 895, 'Кожаный чехол карман чёрного цвета Lamborghini ', 'empty_thumb.jpg', 34),
(13477, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover & Carbon Fiber (black) \"Aventador\"', 895, '', 'empty_thumb.jpg', 31),
(13478, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover & Carbon Fiber (white) \"Aventador\"', 895, '', 'empty_thumb.jpg', 31);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `name`, `role`) VALUES
(2, 'user1', '$2y$10$4efvFQRgObH/LnFPxPymO.QOFg1HoJcMaYRwfdZ/Zy74agBnWdBMu', '1@1.com', 'User1', 'user'),
(4, 'user2', '$2y$10$HY3XizgU.w8/GkOwYhn60.7mXq3ULN/mMJBdq.5Q7A2DVIeUgyTVa', '2@1.com', 'User2', 'user'),
(5, 'user3', '$2y$10$0OYUlv03M01kA0mpGpNoFeuZMkZHMChyWu1m0mBAZPM6gHT7sTEa.', '3@1.com', 'User3', 'user'),
(6, 'user4', '$2y$10$wCxTZpZMqOJIyulNMppOQeO3iyY9hMqGKryhpN5bcWS2ZEZQZJJeu', '4@1.com', 'User4', 'user'),
(7, 'user5', '$2y$10$in14iW1Q9Zy/DwUNf3tsD.dSeHWh2Xdm7yiHg02gCepRl3DY2WnNu', '5@1.com', 'User5', 'user'),
(8, 'user6', '$2y$10$taJhl/2lWGMdOlOCEzNjeOF3P1UVYQYuNhTGmN8g/Gc4hPQPlC48e', '6@1.com', 'User6', 'user'),
(9, 'user7', '$2y$10$VkDzNXw05Cp75T7jBhT67.BLfzjU2aMGWZcm25j5tXSMHO5/fJyDy', '7@1.com', 'User7', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13612;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
