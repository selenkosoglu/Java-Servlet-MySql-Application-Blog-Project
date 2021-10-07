-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 13 Ağu 2021, 11:38:52
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `author`
--

CREATE TABLE `author` (
  `aid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `author`
--

INSERT INTO `author` (`aid`, `name`, `email`, `password`) VALUES
(1, 'Selen Kösoğlu', 'selen@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'İrem Özgenkip', 'irem@mail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blogs`
--

CREATE TABLE `blogs` (
  `bid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `blog` text NOT NULL,
  `detail` varchar(255) NOT NULL,
  `aid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `blogs`
--

INSERT INTO `blogs` (`bid`, `title`, `blog`, `detail`, `aid`, `date`) VALUES
(9, 'Rihanna', 'Gerçek adı Robyn Fenty olan dünyaca ünlü şarkıcı Rihanna, Forbes dergisi tarafından resmen milyarder ilan edildi.\r\n2017’de kurduğu Fenty Beauty markasıyla müzikten sonra güzellik dünyasında da başarıyı yakalayan Barbadoslu şarkıcı, artık milyarderler kulübünde.\r\nHaberler Foto Galeri Yaşam Haberleri Forbes dergisi Rihanna\'yı resmen milyarder ilan etti\r\nForbes dergisi Rihanna\'yı resmen milyarder ilan etti\r\nÜnlü şarkıcı Rihanna artık resmen milyarder! Forbes dergisi, Rihanna\'nın 1,7 milyar dolarlık servetiyle milyarderler kulübüne girdiğini duyurdu.\r\nAbone ol \r\nPaylaş \r\n \r\n \r\n \r\nntv.com.tr 04.08.2021 - 14:22\r\n\r\nForbes dergisi Rihanna\'yı resmen milyarder ilan etti - 1\r\nRESMEN MİLYARDER\r\n\r\nGerçek adı Robyn Fenty olan dünyaca ünlü şarkıcı Rihanna, Forbes dergisi tarafından resmen milyarder ilan edildi.\r\n\r\n2017’de kurduğu Fenty Beauty markasıyla müzikten sonra güzellik dünyasında da başarıyı yakalayan Barbadoslu şarkıcı, artık milyarderler kulübünde.\r\n\r\nForbes dergisi Rihanna\'yı resmen milyarder ilan etti - 2\r\nForbes dergisine göre 1,7 milyar dolarlık serveti olan 33 yaşındaki Rihanna, dünyanın en zengin kadın müzisyeni ve televizyoncu Oprah Winfrey’den sonra eğlence dünyasının en zengin kadın yıldızı.Rihanna, zenginliğinin kaynağını sadece müziğe borçlu değil. Servetinin 1,4 milyar dolarlık kısmı, şu anda yüzde 50’lik hisse sahibi olduğu Fenty Beauty markasından geldi. Rihanna, servetinin kalanını da sahibi olduğu iç çamaşırı markası Savage x Fenty’den ve tabii müzik ve oyunculuk kariyerindeki gelirlerinden elde etti.Rihanna, Fenty Beauty markasının yarısını dünyanın ikinci en zengin insanı Bernard Arnault’un sahibi olduğu LVMH şirketine sattı. 2018’de marka, 550 milyon dolarlık gelir elde etti.\r\n\r\nLVMH şirketi, Rihanna dışında başka ünlülerin de markalarından hisse satın aldı. LVMH, aynı zamanda Kylie Jenner’ın Kylie Cosmetics, Kim Kardashian’ın KKW Beauty ve Jessica Alba’nın Honest Company şirketlerinde de çatı görevi görüyor.Forbes’a göre Fenty Beauty’nin parasal değeri 2,8 milyar dolar. Rihanna’nın milyar dolarlık değeri olan tek markası Fenty Beauty değil. İç çamaşırı markası Savage X Fenty de 115 milyon dolarlık değerini 1 milyar dolara çıkardı. Rihanna 2018’de kurduğu markanın yüzde 70’lik hissesini sattı.101 milyonluk Instagram takipçisinin yanı sıra 102,5 milyon Twitter takipçisi olan Rihanna, sosyal medyanın da yıldız isimlerinden. Markalarının reklamı için zaman zaman kamera karşısına geçen sanatçı, sosyal medya hesaplarını koleksiyon tanıtımları için de kullanıyor. İş dünyasında başarıyı yakalayan Rihanna’nın hayranları bu durumdan pek memnun değil. En son albümü Anti’yi 2016’da çıkaran ünlü şarkıcının ticari işlerden müziğe fırsat bulamayıp yeni albüm hazırlamaması, hayranlarını üzüyor. Hayranları, Rihanna’ya her fırsatta, yeni albüm beklediklerini hatırlatıyor.', 'Forbes', 1, '2021-08-13'),
(10, 'Ethereum', 'Geliştirdiği Blockhain teknolojisi ile birlikte Ethereum gibi birçok kripto para ile rekabet halinde olan ve kripto paralar arasında en yüksek hacimli 5. Kripto para olan Cardano (ADA) son bir haftada yüzde 42 oranında değer kazandı.\r\nGeçtiğimiz hafta salı günü itibarıyla 1.2613 dolar seviyesinden işlem gören Cardano (ADA), bugün 1.7948 dolar seviyesine kadar yükselerek haftalık bazda kazancını yüzde 42 oranında artırdı.\r\n\r\nTSİ 14.30 itibarıyla ADA yüzde 13.80 oranında yükselişle 1.7862 dolar seviyesinde işlem görüyor.', '%87 Kazandırdı!', 1, '2021-08-13'),
(11, 'Beyoncé Knowles', 'Beyonce’nin Black is King filmi için seslendirdiği şarkıyla en iyi film müziği kategorisinde aday gösterilirken, Brown Skin Girl klibi en iyi müzik videosu olmaya aday gösterildi. Şarkıcı ayrıca, Megan Thee Stallion’un Savage şarkısındaki düeti ile yılın en iyi rap performansı, en iyi kaydı ve en iyi rap şarkısı dahil olmak üzere üç farklı adaylık daha kazandı. ABD\'li pop yıldızı Beyonce\'un şu anda 79 adaylığı ve 24 ödülü var. Beyonce eğer bu yıl dört Grammy kazanırsa, en çok ödül kazanan kadın şarkıcı unvanını alacak. Beyonce eğer Grammy\'deki dokuz adaylığından sekizini kazanırsa, tüm zamanların en çok ödül alan sanatçı olarak tarihe geçecek.', '2021 Grammy Ödülleri', 1, '2021-08-13'),
(12, 'Kova', 'Beyonce’nin Black is King filmi için seslendirdiği şarkıyla en iyi film müziği kategorisinde aday gösterilirken, Brown Skin Girl klibi en iyi müzik videosu olmaya aday gösterildi. Şarkıcı ayrıca, Megan Thee Stallion’un Savage şarkısındaki düeti ile yılın en iyi rap performansı, en iyi kaydı ve en iyi rap şarkısı dahil olmak üzere üç farklı adaylık daha kazandı. ABD\'li pop yıldızı Beyonce\'un şu anda 79 adaylığı ve 24 ödülü var. Beyonce eğer bu yıl dört Grammy kazanırsa, en çok ödül kazanan kadın şarkıcı unvanını alacak. Beyonce eğer Grammy\'deki dokuz adaylığından sekizini kazanırsa, tüm zamanların en çok ödül alan sanatçı olarak tarihe geçecek.', '2021 Ağustos Ayı Burç Yorumu', 1, '2021-08-13'),
(13, 'Deneme', 'Blablabla', 'İrem kullanıcısı deneme1', 2, '2021-08-13'),
(17, 'SELEN DENEME', 'SELEN DENEME', 'SELEN ', 1, '2021-08-13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact_table`
--

CREATE TABLE `contact_table` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `contact_table`
--

INSERT INTO `contact_table` (`cid`, `name`, `email`, `phoneNumber`, `message`) VALUES
(1, 'name', 'email', 'phoneNumber', 'message'),
(2, 'Selen', 'selen@mail.com', '123', 'merhaba'),
(3, 'Selen', 'selen@mail.com', '123', 'hello'),
(4, 'Selen', 'selen@mail.com', '123', 'hello'),
(5, 'Selen', 'selen@mail.com', '123', 'hello'),
(6, 'Selen', 'selen@mail.com', '123', 'hello'),
(7, 'Selen', 'selen@mail.com', '123', 'hello'),
(8, 'İrem', 'irem@mail.com', '12345', 'hi');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`aid`);

--
-- Tablo için indeksler `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`bid`);

--
-- Tablo için indeksler `contact_table`
--
ALTER TABLE `contact_table`
  ADD PRIMARY KEY (`cid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `author`
--
ALTER TABLE `author`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `blogs`
--
ALTER TABLE `blogs`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `contact_table`
--
ALTER TABLE `contact_table`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
