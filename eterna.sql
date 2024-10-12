-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Eki 2024, 19:33:00
-- Sunucu sürümü: 10.4.24-MariaDB
-- PHP Sürümü: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `eterna`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'Technology', 'category_photo/tech.jpg', NULL, NULL),
(2, 'Car', 'category_photo/car.jpg', NULL, NULL),
(3, 'Health', 'category_photo/health.jpg', NULL, NULL),
(4, 'Science', 'category_photo/science.jpg', NULL, NULL),
(5, 'DIY', 'category_photo/diy.jpg', NULL, NULL),
(6, 'Game', 'category_photo/game.jpg', NULL, NULL),
(7, 'Food', 'category_photo/food.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'İçerik çok başarılı Tebrik Ederim.', '2024-10-12 13:50:32', NULL),
(2, 3, 2, 'bcxbncn', '2024-10-12 11:46:26', '2024-10-12 11:46:26'),
(3, 5, 1, 'Thx!', '2024-10-12 11:57:39', '2024-10-12 11:57:39'),
(4, 3, 3, 'fgsdfgdf', '2024-10-12 11:59:00', '2024-10-12 11:59:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_12_083442_create_categories_table', 2),
(6, '2024_10_12_083619_create_posts_table', 2),
(7, '2024_10_12_083913_add_profile_photo_to_users_table', 3),
(8, '2024_10_12_113157_add_image_path_to_categories_table', 4),
(9, '2024_10_12_134944_create_comments_table', 5),
(10, '2024_10_12_155450_create_newsletters_table', 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'emiraksoy10@gmail.com', NULL, NULL),
(2, 'aksoyticaret100@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `image_path`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Voltaj Regülatörü | Regülatör Ne İşe Yarar?', 'Günlük hayatta kullandığımız birçok elektronik cihaz, sabit ve güvenli bir voltaj seviyesine ihtiyaç duyar. İşte burada voltaj regülatörü devreye girer! Bu yazıda, voltaj regülatörlerinin ne işe yaradığını, nasıl çalıştığını ve nasıl seçilmesi gerektiğini öğreneceksiniz. Hem eğlenceli hem de öğretici bir şekilde konuyu ele alacağız, hadi başlayalım! ', 'post_photos/reg.jpg\r\n', 1, 1, '2024-10-12 12:40:30', NULL),
(3, 'Robotik Kodlama ve Algoritma Nedir?', 'Günümüzde teknolojinin her alanında karşımıza çıkan robotik kodlama ve algoritmalar, tıpkı bir orkestra şefi ve müzisyenler gibi mükemmel bir uyum içinde çalışırlar. Robotik kodlama, bir robotun belirli görevleri yerine getirebilmesi için gerekli komutların bir dizi algoritma ile oluşturulması sürecidir. Peki algoritma nedir? Algoritmalar, tıpkı şefin müzisyenlere ne çalacaklarını söylemesi gibi, bir robotun ne yapacağını belirleyen adımlardır. Bu iki unsur bir araya geldiğinde, karmaşık işlemleri basit hale getirir ve teknolojiye hayat verir.', 'post_photos/post1.jpg\r\n', 1, 1, '2024-10-12 12:41:18', NULL),
(4, 'How Porsche Became a Symbol of Prestige and Performance', 'Have you ever dreamed of cruising down the highway in a sleek, powerful machine that turns heads at every corner? Welcome to the world of Porsche, where automotive excellence meets unparalleled prestige and performance. \r\n\r\nUnravel how Porsche evolved from a visionary idea into a global emblem of luxury and speed. Before you start picturing yourself in a used Porsche convertible, take a look into the roots of this iconic brand and learn more about its history of excellence.', 'post_photos/car.jpg\r\n', 2, 1, '2024-10-12 12:46:40', NULL),
(5, 'What is Human Flourishing?', 'Even if the term \"human flourishing\" is new to some, the principles underlying it have been widely discussed for centuries and well before Martin Seligman, the founder of positive psychology, coined the phrase in the 1990s. Lao Tzu, ancient Chinese philosopher spoke of being content and having appreciation in what we have, he said, \"When you realize nothing is lacking, the whole world belongs to you.\" Today, as a society, we are increasingly focused on understanding well-being and the true meaning of happiness.\r\n\r\nFlourishing is a concept in positive psychology. Compared to the centuries-old discipline of psychology, positive psychology is relatively recent, introduced by Seligman during his inaugural speech as president of the American Psychological Society in 1998. Seligman highlighted that psychology had adopted a disease model, which focused primarily on alleviating human suffering. Precious little scientific research was devoted to discovering what makes life worth living.\r\n\r\n\"In our rush to address people in trouble and to repair damage, it never occurred to us to develop interventions to make people happier—positive interventions,\" *Martin Seligman, 2004.', 'post_photos/health_post.jpg\r\n', 3, 1, '2024-10-12 13:25:40', NULL),
(9, 'Call of Duty Black Ops 6 : une annonce qui va faire plaisir aux fans', '<p><strong>Call of Duty Black Ops 6 va faire des heureux avec cette annonce. Ce n\'est pas une vraie surprise, mais les fans sont ravis.</strong></p><p>Nouvelle année, nouveau Call of Duty. Pour cette cuvée 2024, c\'est Treyarch qui est à la tête de ce <a href=\"https://www.gameblog.fr/jeu-video/ed/news/call-of-duty-black-ops-6-explose-tout-618220\"><strong>Call of Duty Black Ops 6</strong></a>, épaulé bien évidemment par une myriade d\'autres studios d\'Activision. Plus que n\'importe quel autre rendez-vous annuel, ce Black Ops mise gros et compte mettre un grand coup dans la fourmilière en changeant non pas son essence, mais ses mécaniques de gameplay avec une nouveauté qu\'il nous vend comme révolutionnaire : l\'omnimovement. Cette fonctionnalité nous permettra de nous mouvoir dans toutes les directions avec aisance, de plonger ou encore de faire un peu de Parkour bien plus facilement. Un changement important qui accentue le dynamisme. Une décision qui divise grandement les fans. En revanche s\'il y a bien quelque chose qui met tout le monde d\'accord, c\'est cette nouvelle annonce du studio.</p>', 'post_photos/1728748221.jpg', 6, 3, '2024-10-12 12:50:21', '2024-10-12 12:50:21'),
(24, 'Citroen C5 Aircross Hybrid 136 review', '<p>We test the mild hybrid version of Citroen’s comfy family-sized SUV…</p><p>How time flies. The first time I drove a Citroen C5 Aircross was way back in 2019, shortly after its UK launch.</p><p>At that stage it was available with petrol or diesel power. A plug-in hybrid joined the range in 2022, and now there’s a mild hybrid version – the Aircross ë-series Hybrid 136, to be exact.</p>', 'post_photos/1728751818.jpg', 2, 3, '2024-10-12 13:50:18', '2024-10-12 13:50:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_photo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `profile_photo_path`) VALUES
(1, 'Emir', 'emiraksoy10@gmail.com', NULL, '$2y$10$G0OMSzVvyiIMGz33tSV.ZuqdXFcK64dteTgJeGyN7k4aBw6L/JjtK', NULL, '2024-10-12 05:33:36', '2024-10-12 05:33:36', 'profile_photos/1728722996.jpg'),
(2, 'user', 'user@gmail.com', NULL, '$2y$10$zZOQtipxRb1LKRotEvPXDurK.LNMiIo/cD/zjTMTmkwfZvL6aXDr.', NULL, '2024-10-12 05:49:56', '2024-10-12 05:49:56', ''),
(3, 'deneme', 'deeneme@gmail.com', NULL, '$2y$10$GJ6KSrZJ9tCnejJ1lzE1nurxUcBfi449XmZsX/a4mQoqv4ZY0rILu', NULL, '2024-10-12 11:58:51', '2024-10-12 11:58:51', NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Tablo kısıtlamaları `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
