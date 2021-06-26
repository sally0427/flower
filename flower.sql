-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-06-23 11:54:26
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `flower`
--

-- --------------------------------------------------------

--
-- 資料表結構 `festivals`
--

CREATE TABLE `festivals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `flower` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `festivals`
--

INSERT INTO `festivals` (`id`, `name`, `date`, `flower`, `created_at`, `updated_at`) VALUES
(1, '七夕', '2021-08-14', '玫瑰，滿天星，繡球花，鬱金香', NULL, NULL),
(2, '端午節', '2021-06-14', '百合，茉莉，蝴蝶蘭', NULL, NULL),
(3, '中元節', '2021-08-22', '蓮花，小菊，大菊，百合，海芋，茉莉', NULL, NULL),
(4, '重陽節', '2021-10-14', '小菊，大菊', NULL, NULL),
(5, '教師節', '2021-09-10', '康乃馨，百合，劍蘭', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `meanings`
--

CREATE TABLE `meanings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `meanings`
--

INSERT INTO `meanings` (`id`, `name`, `label`, `description`, `created_at`, `updated_at`) VALUES
(1, '百合花', '百合', '百分之百合而為一、純潔、神聖、順利、心想事成、祝福、高貴、高雅、財富、榮譽', NULL, NULL),
(2, '水仙百合', '百合', '喜悅、期待相逢', NULL, NULL),
(3, '香水百合', '百合', '永不磨滅的愛情、純潔、婚禮的祝福、高貴、偉大的愛', NULL, NULL),
(4, '玉米百合', '百合', '執著的愛、勇敢', NULL, NULL),
(5, '編笠百合', '百合', '才能、威嚴、傑出', NULL, NULL),
(6, '葵百合', '百合', '勝利、榮譽、富貴', NULL, NULL),
(7, '白百合', '百合', '純潔、莊嚴、心心相印、聖母之花', NULL, NULL),
(8, '野百合', '百合', '永遠幸福', NULL, NULL),
(9, '黃百合', '百合', '感激、快樂', NULL, NULL),
(10, '狐尾百合', '百合', '尊貴、欣欣向榮、傑出', NULL, NULL),
(11, '聖誕百合', '百合', '溫暖的心、喜洋洋、慶祝、真情', NULL, NULL),
(12, '水仙百合', '百合', '喜悅、期待相逢', NULL, NULL),
(13, '火百合、紅色百合', '百合', '熱烈的愛', NULL, NULL),
(14, '玫瑰', '玫瑰', '我愛你、愛情、高貴、愛與美、容光煥發、純潔的愛、美麗的愛情、美好常在', NULL, NULL),
(15, '紅玫瑰', '玫瑰', '愛、熱情、熱愛著你、求愛、我愛你、熱戀、希望與你泛起激情的愛、真誠的愛、真心真意', NULL, NULL),
(16, '粉紅玫瑰', '玫瑰', '初戀、求愛、喜歡你那燦爛的笑容、銘記於心、愛心與特別的關懷、動情在心、愛的宣言、感動', NULL, NULL),
(17, '淡紅玫瑰', '玫瑰', '同情、仰慕、明艷照人、感動、愛的宣言', NULL, NULL),
(18, '橙玫瑰', '玫瑰', '青春初戀、友情、羞怯的心情、獻給你一份神秘的愛', NULL, NULL),
(19, '橘玫瑰', '玫瑰', '友情、感性、青春美麗', NULL, NULL),
(20, '黃玫瑰', '玫瑰', '高貴、珍重祝福，另有不貞、嫉妒、失戀、腿色的愛、歉意、友情', NULL, NULL),
(21, '綠玫瑰', '玫瑰', '純真簡樸、青春長駐、希望', NULL, NULL),
(22, '藍玫瑰', '玫瑰', '奇跡、不可能、敦厚善良、無法得到的東西', NULL, NULL),
(23, '紫玫瑰', '玫瑰', '永恆的愛、浪漫真情、珍貴獨特、珍惜的愛、憂鬱、夢幻、愛做夢', NULL, NULL),
(24, '白玫瑰', '玫瑰', '天真、純潔、尊敬、謙卑、美麗、我們的愛情是純潔的、你我堪稱絕配、我足以與你相配', NULL, NULL),
(25, '黑玫瑰', '玫瑰', '神秘高貴、溫柔真心、你是惡魔，且為我所有、求愛、愛我好嗎？', NULL, NULL),
(26, '沙漠玫瑰', '玫瑰', '永恆不變的愛情', NULL, NULL),
(27, '香檳玫瑰', '玫瑰', '夢幻的感覺、我只鍾情你一個、愛上你是我今生最大的幸福、想你是我最甜蜜的痛苦、和你在一起是我的驕傲、沒有你的我就像一隻迷失了航線的船', NULL, NULL),
(28, '麝香玫瑰', '玫瑰', '善變', NULL, NULL),
(29, '聖誕玫瑰', '玫瑰', '我無法給你任何東西', NULL, NULL),
(30, '彩虹玫瑰', '玫瑰', '浪漫、夢幻、幸福、開心、華麗與高貴', NULL, NULL),
(31, '菊花', '菊花', '幽香暗藏，清淨、高潔、我愛你、真情', NULL, NULL),
(32, '翠菊', '菊花', '追想、可靠的愛情、請相信我', NULL, NULL),
(33, '春菊', '菊花', '為愛情占卜', NULL, NULL),
(34, '六月菊\r\n', '菊花\r\n', '別離\r\n', NULL, NULL),
(35, '冬菊', '菊花', '別離', NULL, NULL),
(36, '法國小菊', '菊花', '忍耐', NULL, NULL),
(37, '木茼蒿', '菊花', '藏在心中的愛', NULL, NULL),
(38, '瓜葉菊', '菊花', '快樂', NULL, NULL),
(39, '波斯菊', '菊花', '野性美、天天快樂、永遠快樂', NULL, NULL),
(40, '大波斯菊', '菊花', '少女的真心、少女的純情、清淨、高潔、自由、爽朗、永遠快樂', NULL, NULL),
(41, '萬壽菊', '菊花', '友情、健康', NULL, NULL),
(42, '矢車菊', '菊花', '纖細、優雅、幸福、單身的幸福', NULL, NULL),
(43, '麥杆菊', '菊花', '永恆的記憶、刻畫在心', NULL, NULL),
(44, '鱗托菊', '菊花', '永遠的愛', NULL, NULL),
(45, '甘菊', '菊花', '不畏艱苦', NULL, NULL),
(46, '雛菊', '菊花', '開朗、暗戀、快樂、離別、清純、隱藏愛情', NULL, NULL),
(47, '非洲菊', '菊花', '神秘、興奮、永遠快樂', NULL, NULL),
(48, '白日菊', '菊花', '永失我愛', NULL, NULL),
(49, '白色菊花', '菊花', '真實坦誠', NULL, NULL),
(50, '紅色素菊', '菊花', '我愛你', NULL, NULL),
(51, '菊苣', '菊花', '慎重', NULL, NULL),
(52, '瑪格烈菊', '菊花', '驕傲、滿意、喜悅', NULL, NULL),
(53, '藍色水菊', '菊花', '善變固執無情的你', NULL, NULL),
(54, '薔薇', '薔薇', '你的一切都很可愛、愛的思念、愛、美、熱情', NULL, NULL),
(55, '白薔薇', '薔薇', '純潔的愛情', NULL, NULL),
(56, '紅薔薇', '薔薇', '熱戀', NULL, NULL),
(57, '粉薔薇', '薔薇', '愛的誓言、我要與你過你輩子', NULL, NULL),
(58, '深紅薔薇', '薔薇', '只想和你在一起', NULL, NULL),
(59, '野薔薇', '薔薇', '浪漫的愛情', NULL, NULL),
(60, '黃薔薇', '薔薇', '永恆的微笑', NULL, NULL),
(61, '藍薔薇', '薔薇', '虛無飄渺的幻想、奇蹟', NULL, NULL),
(62, '聖誕薔薇', '薔薇', '追憶的愛情', NULL, NULL),
(64, '曼陀羅花', '曼陀羅花', '不可預知的愛與死亡', NULL, NULL),
(65, '白色曼陀羅花', '曼陀羅花', '純潔', NULL, NULL),
(66, '金色曼陀羅花', '曼陀羅花', '幸福', NULL, NULL),
(67, '紅色曼陀羅花', '曼陀羅花', '血腥的愛', NULL, NULL),
(68, '粉色曼陀羅花', '曼陀羅花', '適意', NULL, NULL),
(69, '紫色曼陀羅花', '曼陀羅花', '恐怖', NULL, NULL),
(70, '黑色曼陀羅花', '曼陀羅花', '死亡以及顛沛流離的愛', NULL, NULL),
(71, '綠色曼陀羅花', '曼陀羅花', '生生不息的希望', NULL, NULL),
(72, '藍色曼陀羅花', '曼陀羅花', '詐情、騙愛', NULL, NULL),
(73, '鬱金香', '鬱金香', '熱情的愛、愛的表白、榮譽、祝福、永恆', NULL, NULL),
(74, '白色鬱金香', '鬱金香', '不懂愛的愛、失戀、純情、純潔', NULL, NULL),
(75, '紅色鬱金香', '鬱金香', '永恆的祝福、愛的告白、愛的宣言、喜悅、熱愛', NULL, NULL),
(76, '粉色鬱金香', '鬱金香', '美人、熱愛、幸福', NULL, NULL),
(77, '紫色鬱金香', '鬱金香', '永恆的愛、唯一的愛、無盡的愛、最愛', NULL, NULL),
(78, '黃色鬱金香', '鬱金香', '沒有希望的愛、高貴、珍重、財富', NULL, NULL),
(79, '雜色鬱金香', '鬱金香', '美麗的你', NULL, NULL),
(80, '櫻花', '櫻花', '生命補充、生命、等你回來', NULL, NULL),
(81, '日本櫻花', '櫻花', '生命', NULL, NULL),
(82, '冬櫻花', '櫻花', '東方的神秘', NULL, NULL),
(83, '重瓣櫻花', '櫻花', '文靜', NULL, NULL),
(84, '西洋櫻花', '櫻花', '善良的教育', NULL, NULL),
(85, '櫻花草', '櫻花', '青春、除你以外，別無他愛', NULL, NULL),
(86, '山櫻花', '櫻花', '純潔、高尚、淡薄、向你微笑、精神美、熱烈', NULL, NULL),
(87, '紫羅蘭', '紫羅蘭', '永恆的美、我喜歡你', NULL, NULL),
(88, '三色紫羅蘭', '紫羅蘭', '純愛', NULL, NULL),
(89, '白色紫羅蘭', '紫羅蘭', '讓我們抓住幸福的機會吧', NULL, NULL),
(90, '粉色紫羅蘭', '紫羅蘭', '誓言', NULL, NULL),
(91, '紫色紫羅蘭', '紫羅蘭', '在夢境中愛上你、對我而言你永遠那麼美、小心翼翼守護的愛', NULL, NULL),
(92, '黃色紫羅蘭', '紫羅蘭', '純樸', NULL, NULL),
(93, '藍色紫羅蘭', '紫羅蘭', '警戒、忠誠，我將永遠忠誠', NULL, NULL),
(94, '水仙', '水仙', '堅貞的愛情、想念、思念', NULL, NULL),
(95, '中國水仙', '水仙', '多情、想你', NULL, NULL),
(96, '西洋水仙', '水仙', '期盼愛情、愛你、純潔', NULL, NULL),
(97, '黃水仙', '水仙', '重溫愛情、神秘、慾望', NULL, NULL),
(98, '山水仙', '水仙', '美好時光、欣欣向榮', NULL, NULL),
(99, '秋水仙', '水仙', '我最美好的時光已經結束', NULL, NULL),
(102, '風信子', '風信子', '永遠的懷念、喜悅、競賽、賭注、遊戲、勝負、悲傷的愛', NULL, NULL),
(103, '白色風信子', '風信子', '遊戲人間', NULL, NULL),
(104, '紅色風信子', '風信子', '讓人感動的愛', NULL, NULL),
(105, '黃色風信子', '風信子', '有你我很幸福', NULL, NULL),
(106, '三色堇', '三色堇', '思慮', NULL, NULL),
(107, '三色堇', '紫色三色堇', '沉默不語', NULL, NULL),
(108, '三色堇', '黃色三色堇', '憂喜參半', NULL, NULL),
(109, '天竺葵', '天竺葵', '偶然的相遇', NULL, NULL),
(110, '天竺葵', '紅色天竺葵', '你在我的腦海揮之不去', NULL, NULL),
(111, '天竺葵', '粉紅色天竺葵', '很高興能陪在你身邊', NULL, NULL),
(112, '杜鵑花', '杜鵑花', '為了我保重你自己、溫暖的、脆的、強烈的感情、節制、喜悅、永遠屬於你', NULL, NULL),
(113, '杜鵑花', '白色杜鵑花', '被愛的喜悅', NULL, NULL),
(114, '杜鵑花', '紅色杜鵑花', '愛的喜悅', NULL, NULL),
(115, '藍色妖姬', '藍色妖姬', '相守是一種承諾，輪迴人世中，怎樣才能擁有一份溫柔的情意。', NULL, NULL),
(116, '兩枝藍色妖姬', '藍色妖姬', '相遇是一種宿命，心靈的交匯讓我們有訴不盡的浪漫情懷。', NULL, NULL),
(117, '三枝藍色妖姬', '藍色妖姬', '你是我最深的愛戀，希望永遠銘記我們這段美麗的愛情故事。', NULL, NULL),
(118, '丁香', '丁香', '回憶', NULL, NULL),
(119, '紫丁香', '丁香', '光榮', NULL, NULL),
(120, '白楊', '白楊', '無所畏懼（正向）；莫名而未知的恐懼（負面）', NULL, NULL),
(121, '黑色白楊木', '白楊', '勇氣', NULL, NULL),
(122, '番紅花', '番紅花', '進退得宜、執著', NULL, NULL),
(123, '黃色番紅花', '番紅花', '青春喜悅', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_06_07_063120_create_festivals_table', 1),
(4, '2021_06_07_063135_create_meanings_table', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `festivals`
--
ALTER TABLE `festivals`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `meanings`
--
ALTER TABLE `meanings`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `festivals`
--
ALTER TABLE `festivals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `meanings`
--
ALTER TABLE `meanings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
