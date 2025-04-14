-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 13 2025 г., 21:01
-- Версия сервера: 5.7.33
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hotel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL COMMENT 'id бронирования комнат',
  `room_id` int(11) NOT NULL COMMENT 'id комнаты, которую бронируют',
  `visitor_id` int(11) NOT NULL COMMENT 'id гостя, который делает бронирование комнаты',
  `start_date` date NOT NULL COMMENT 'Дата начала бронирования',
  `end_date` date NOT NULL COMMENT 'Дата окончания бронирования',
  `num_persons` int(11) NOT NULL COMMENT 'Количество человек, которое будет проживать в бронируемой комнате'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица с информацией о бронировании номеров для проживания';

--
-- Дамп данных таблицы `booking`
--

INSERT INTO `booking` (`id`, `room_id`, `visitor_id`, `start_date`, `end_date`, `num_persons`) VALUES
(1, 4, 2, '2024-03-10', '2024-04-20', 1),
(2, 7, 3, '2024-03-15', '2024-03-17', 1),
(3, 10, 4, '2024-06-13', '2024-06-18', 1),
(4, 9, 6, '2024-08-01', '2024-08-08', 2),
(5, 1, 7, '2025-01-15', '2025-01-21', 2),
(6, 2, 1, '2025-02-10', '2025-02-18', 1),
(7, 3, 10, '2025-05-13', '2025-05-22', 3),
(8, 1, 2, '2025-09-04', '2025-10-11', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL COMMENT 'id корпуса',
  `house_name` varchar(30) NOT NULL COMMENT 'Название корпуса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Информация о корпусах';

--
-- Дамп данных таблицы `building`
--

INSERT INTO `building` (`id`, `house_name`) VALUES
(1, 'Delta'),
(2, 'Betta'),
(3, 'Alpha'),
(4, 'Vega'),
(5, 'Gamma');

-- --------------------------------------------------------

--
-- Структура таблицы `residence`
--

CREATE TABLE `residence` (
  `id` int(11) NOT NULL COMMENT 'id проживания',
  `room_id` int(11) NOT NULL COMMENT 'id комнаты, в которой проживают гости гостиницы',
  `visitor_id` int(11) NOT NULL COMMENT 'Id гостя, проживающего в гостинице',
  `start_date` date NOT NULL COMMENT 'Дата начала проживания в гостинице',
  `end_date` date NOT NULL COMMENT 'Дата окончания проживания в гостинице',
  `num_persons` int(11) NOT NULL COMMENT 'Количество человек, которое проживает в комнате'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица с информацией о проживании гостей в гостинице';

--
-- Дамп данных таблицы `residence`
--

INSERT INTO `residence` (`id`, `room_id`, `visitor_id`, `start_date`, `end_date`, `num_persons`) VALUES
(1, 4, 2, '2024-04-20', '2024-05-10', 1),
(2, 7, 3, '2024-03-17', '2024-03-29', 1),
(3, 10, 4, '2024-06-18', '2024-07-01', 1),
(4, 1, 7, '2025-01-21', '2025-02-05', 2),
(5, 9, 6, '2024-08-08', '2024-08-16', 2),
(6, 2, 1, '2025-02-18', '2025-02-23', 1),
(7, 1, 8, '2025-01-21', '2025-02-05', 2),
(8, 9, 5, '2024-08-08', '2024-08-16', 2),
(9, 3, 10, '2025-05-22', '2025-06-16', 3),
(10, 3, 9, '2025-05-22', '2025-06-16', 3),
(11, 3, 11, '2025-05-22', '2025-06-16', 3),
(12, 1, 2, '2025-10-11', '2025-10-26', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL COMMENT 'id комнаты',
  `building_id` int(11) NOT NULL COMMENT 'id корпуса, где находится комната',
  `room_number` int(11) NOT NULL COMMENT 'Номер комнаты',
  `num_place` int(11) NOT NULL COMMENT 'Количество мест для проживания в комнате',
  `price` int(11) NOT NULL COMMENT 'Стоимость комнаты'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица с информацией о комнатах для бронирования и проживан';

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `building_id`, `room_number`, `num_place`, `price`) VALUES
(1, 1, 183, 2, 3000),
(2, 3, 213, 1, 2000),
(3, 4, 355, 3, 5000),
(4, 2, 144, 2, 2800),
(5, 5, 438, 5, 10000),
(6, 2, 318, 1, 2500),
(7, 4, 581, 2, 3000),
(8, 1, 231, 1, 2000),
(9, 3, 111, 2, 1800),
(10, 5, 155, 1, 2500),
(11, 1, 416, 1, 1800),
(12, 2, 315, 3, 3800),
(13, 3, 216, 2, 2300),
(14, 4, 381, 1, 2000),
(15, 5, 123, 1, 1700);

-- --------------------------------------------------------

--
-- Структура таблицы `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL COMMENT 'id гостя',
  `name` varchar(50) NOT NULL COMMENT 'ФИО гостя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица с информацией о гостях гостиницы';

--
-- Дамп данных таблицы `visitor`
--

INSERT INTO `visitor` (`id`, `name`) VALUES
(1, 'Мечников Георгий Иванович'),
(2, 'Грецкий Олег Алексеевич'),
(3, 'Антонова Дарья Сергеевна'),
(4, 'Моисеева Светлана Степановна'),
(5, 'Миролюбова Валерия Михайловна'),
(6, 'Назаров Дмитрий Валерьевич'),
(7, 'Сергеев Андрей Григорьевич'),
(8, 'Сергеева Екатерина Валерьевна'),
(9, 'Попова Элеонора Дмитриевна'),
(10, 'Попов Алексей Сергеевич'),
(11, 'Попов Кирилл Алексеевич');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_id` (`visitor_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `residence`
--
ALTER TABLE `residence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_id` (`visitor_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_id` (`building_id`);

--
-- Индексы таблицы `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id бронирования комнат', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `building`
--
ALTER TABLE `building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id корпуса', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `residence`
--
ALTER TABLE `residence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id проживания', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id комнаты', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id гостя', AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Ограничения внешнего ключа таблицы `residence`
--
ALTER TABLE `residence`
  ADD CONSTRAINT `residence_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`),
  ADD CONSTRAINT `residence_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Ограничения внешнего ключа таблицы `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
