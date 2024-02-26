create database cosmetic;
use cosmetic;


create table `khachhang`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`hoten` varchar(100) NOT NULL,
	`ngaysinh` date not null,
	`email` varchar(50) NOT NULL,
	`diachi` varchar(200) NOT NULL,
	`matkhau` varchar(255) NOT NULL,
	`sdt` varchar(10) null,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into `khachhang`(`hoten`, `ngaysinh`,`email`,`diachi`, `matkhau`,`sdt`) values
('Hoàng Thị Hường','1999/07/12','hoanghuong1999@gmail.com','Hưng Yên', '1', '0983456789'),
('Bùi Thức Hậu','2001/08/13','Buihau2001@gmail.com','Nghệ An', '1', '0673456789'),
('Nguyễn Văn Như Cương','2001/09/10','Cuongbay@gmail.com','Hải Dương', '1', '0563456789'),
('Nguyễn Ngọc Anh','1998/01/06','Ngocanh@gmail.com','Nghệ An', '1', '0683456789'),
('Nguyễn Thùy Dung','2001/09/18','Dungthuy@gmail.com','Hải Dương', '1', '0145456789'),
('Lý Đức Chính','2001/11/24','Lychinh2411@gmail.com','Hà Nam', '1', '0123458989'),
('Lê Công Minh','2000/10/09','Minhbang@gmail.com','Hà Nam', '1', '0987456789'),
('Nguyễn Thành Đạt','2002/07/18','Datthuyet@gmail.com','Hà Nam', '1', '0973456789'),
('Nguyễn Thị Hường','1995/12/12','Huongthaibinh@gmail.com','Thái Bình', '1', '0963456789'),
('Trần Phương Linh','1992/07/12','Linhhoabinh@gmail.com','Hòa Bình', '1', '0883456789');

select *from cosmetic.khachhang;

CREATE TABLE `admin` (
  `idadmin` INT NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert into `admin` (`user`,`password`) values
('nhom17','12345'),
('nhom17@gmail.com','1');

CREATE TABLE `thuonghieu` (
  `idTH` INT NOT NULL AUTO_INCREMENT,
  `tenTH` varchar(50) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `mota` varchar(255) NOT NULL,
  PRIMARY KEY (`idTH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into `thuonghieu`(`tenTH`,`logo`,`mota`) values
('L’Oréal','logoloreal.png','sứ mệnh mang đến cho phụ nữ trên toàn cầu những sản phẩm mỹ phẩm cải tiến tốt nhất về chất lượng, hiệu quả và an toàn'),
('SENKA','logosenka.jpg','Shiseido sáng tạo và cải tiến ra nhiều dòng sản phẩm đa dạng với nhằm mang đến sự chăm sóc toàn diện cho tất cả phụ nữ trên thế giới.'),
('MERZY','logomerzy.png','MERZY cũng có nghĩa là "Hợp nhất". Hãy cùng tôn vinh sự tự do của "cá tính khác bên trong bạn" cùng MERZY!!!'),
('UNILEVER','logouni.png','Unilever là một trong những công ty đa quốc gia hàng đầu thế giới chuyên về các sản phẩm chăm sóc cá nhân, chăm sóc gia đình và thực phẩm.'),
('LEMONADE','logolemonade.jpg','LEMONADE luôn mong muốn mang đến những sản phẩm chất lượng và phù hợp nhất cho các chị em phụ nữ Việt Nam.'),
('INNISFREE','logoinnisfree.jpg','chúng tôi đại diện cho nỗ lực chân thành của innisfree để mang đến vẻ đẹp khỏe mạnh'),
('MAYBELINE','logomaybeline.png','Maybelline là nhà tài trợ trang điểm chính thức của Tuần lễ thời trang Mercedes-Benz.'),
('LAROCHE POSSAY','logolaroche.jpg','Thương hiệu được ưa chuộng với những sản phẩm phù hợp với da nhạy cảm nhất, được hơn 25.000 bác sĩ da liễu khuyên dùng.');

CREATE TABLE `Loaisp` (
  `idLoai` INT NOT NULL AUTO_INCREMENT,
  `tenloai` varchar(50) NOT NULL,
  PRIMARY KEY (`idLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into `Loaisp`(`tenloai`) values 
('Dưỡng da'),
('Mẹ và bé'),
('Trị mụn'),
('Trang điểmm'),
('Dưỡng tóc'),
('Phụ kiện'),
('Sữa tắm'),
('Nước hoa'),
('Làm sạch');
select *from cosmetic.loaisp;

CREATE TABLE `sanpham` (
  `idSP` INT NOT NULL AUTO_INCREMENT,
  `idTH` INT NOT NULL ,
  `idLoai` INT NOT NULL ,
  `tenSP` varchar(50) NOT NULL,
  `hinhanh` varchar(50) NOT NULL,
  `chitiet` varchar(200) NOT NULL,
  `rate` varchar(10) NOT NULL,
  `gia` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`idSP`),
  FOREIGN KEY (`idTH`) REFERENCES `thuonghieu` (`idTH`),
   FOREIGN KEY (`idLoai`) REFERENCES `loaisp` (`idLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE sanpham
MODIFY COLUMN gia INT;
ALTER TABLE sanpham
MODIFY COLUMN chitiet text;

insert  into `sanpham`(`idTH`,`idLoai`,`tenSP`,`hinhanh`,`chitiet`,`rate`,`gia`,`status`) values 
('8','3','Combo chống nắng','laroche_hotdeal.png','Bộ chống nắng không nhờn La Roche-Posay Anthelios Invisible Fluid 50ml & Gel rửa mặt cho da mụn 50ml','4','389000','1'),
('8','9','Sữa rửa mặt','srmlaroche.png','Gel rửa mặt tạo bọt cho da dầu nhạy cảm La Roche-Posay 400ml','5','525000','1'),
('8','9','Tẩy trang','taytranglaroche.png','Nước làm sạch sâu và tẩy trang cho da nhạy cảm Micellar Water Ultra Sensitive Skin 400ml','5','435000','1'),
('8','3','Kem chống nắng','kcnlaroche.png','Bộ đôi Kem chống nắng kiểm soát bóng nhờn La Roche-Posay Anthelios Dry Touch','5','624000','1'),
('3','4','Son','son_hotdeal.png','Son kem lì Merzy The First Velvet Tint 4,5g [12 màu V1-V12]','5','249000','1'),
('3','4','Son','son2_hotdeal.png','Son kem lì Merzy Bite The Beat Mellow Tint 4g (8 màu M01-M08)','4','249000','1'),
('3','4','Bút kẻ mắt','butkemerzy.png','Bút kẻ mắt Merzy Another Me The First Pen Eyeliner 0,5g','4','209000','1'),
('3','4','Cushion','cushionmerzy.png','Phấn nước Merzy The First Cushion Cover 13g SPF50+/ PA+++ che phủ hoàn hảo lâu trôi','4','549000','1'),
('3','4','Mascara','mascaramerzy.png','Mascara chân mày bền màu, lâu trôi Merzy The First Proof Brow Mascara 3.5g','3','299000','1'),
('2','1','Mặt nạ ngủ','matnasenka.png','Mặt nạ ngủ cấp ẩm chuyên sâu dạng gel Senka Deep moist Gel Cream 50g','4','195000','1'),
('2','1','Nước cân bằng da','tonersenka.png','Nước cân bằng và dưỡng ẩm chuyên sâu Senka deep moist lotion 200ml_15917','4','195000','1'),
('2','1','Kem dưỡng da','kemduongsenka.png','Bộ kem dưỡng trắng da ban đêm Senka (Glow Gel Cream 50gr+ Perfect White Clay 120g)_95079','4','358000','1'),
('2','1','Kem chống nắng','kcnsenka.png','Chống nắng serum 3 trong 1 Senka White Beauty CC 40g 4.9','4','195000','1'),
('2','9','Tẩy Trang','taytrangloreal.png','Nước tẩy trang cho mọi loại da LOreal Paris 3-in-1 Micellar Water 400ml','5','179000','1'),
('1','1','Dưỡng da','duongloreal.png','Dưỡng Chất Căng Mướt Da LOreal Paris Crystal Micro Essence (dưỡng da) 130ml','5','449000','1'),
('1','1','Serum','serumloreal.png','Serum siêu cấp ẩm sáng da LOreal Paris pure Hyaluronic Acid 1.5% 30ml','4','618000','1'),
('1','9','Sữa rửa mặt','rualoreal.png','Sữa rửa mặt trắng da LOreal Paris White Perfect Milk foam purifying & brightening 50ml','4','99000','1'),
('1','1','Nước hoa hồng','tonerloreal.png','Nước hoa hồng se khít lỗ chân lông và trắng mịn da LORÉAL White Perfect 200ml','4','128000','1'),
('6','1','Kem dưỡng','duonginis.png','Kem dưỡng ẩm sáng da từ hoa anh đào đảo Jeju innisfree Cherry Blossom Jelly Cream 50ml','5','500000','1'),
('6','1','Nước cân bằng da','tonerinis.png','Nước cân bằng dành cho da mụn Innisfree Bija Trouble Skin 200ml','3','309000','1'),
('6','9','Sữa rửa mặt','srminis.png','Sữa rửa mặt làm sạch innisfree Green Tea Foam Cleanser 150ml','4','220000','1'),
('3','4','Kem che khuyết điểm','kemmerzy.png','Kem che khuyết điểm Merzy The First Creamy Concealer 5,6g','5','309000','1');


insert  into `sanpham`(`idTH`,`idLoai`,`tenSP`,`hinhanh`,`chitiet`,`rate`,`gia`,`status`) values 
('3','4','Merzy Vetvet Tint','newarrive-1.png','Son Merzy Vetvet Tint VER3 Youthful Color 2020','1','195000','1'),
('8','8','Tẩy trang LA ROCHE POSSAY','newarrive-2.png','Nước làm sạch sâu và tẩy trang da dầu nhạy cảm La Roche-Posay Micellar Water 200ml','1','335000','1'),
('8','1','Serum LA ROCHE POSSAY','newarrive-3.png','Dưỡng chất chuyên sâu giúp hỗ trợ quá trình tái tạo da La Roche-Posay Hyalu B5 Serum 30ml','1','985000','1'),
('8','1','Vitamin LA ROCHE POSSAY','newarrive-4.png','Dưỡng chất cải thiện làm sáng da La Roche Posay Pure Vitamin C10 30ml','1','1069000','1'),
('5','4','Phấn nước LEMONADE','newarrive-5.png','Combo phấn nước kiềm dầu Lemonade Matte Addict Dual Cushion 16g và son lót dưỡng LipFiller 4.5g','1','499000','1'),
('5','4','Son dưỡng LEMONADE','newarrive-6.png','Combo 02 Son lót dưỡng đầy môi Lemonade Lip Filler 4.5g x2','1','286000','1'),
('1','1','Serum LOreal','newarrive-7.png','Serum siêu cấp ẩm sáng da LOreal Paris pure Hyaluronic Acid 1.5% 30ml','1','618000','1'),
('6','9','Sữa rửa mặt INNISFREE','newarrive-8.png','Sữa rửa mặt từ blueberry innisfree Blueberry Rebalancing 5.5 Cleanser 100ml','1','140000','1'),
('6','9','Tẩy trang INNISFREE','newarrive-9.png','Nước tẩy trang từ blueberry innisfree Blueberry Rebalancing Cleansing Water 200ml','1','220000','1'),
('4','5','Dầu gội CLEAR','newarrive-10.png',' DẦU GỘI CLEAR LÀM SẠCH DA ĐẦU NHỜN VÀ NGĂN GÀU CÔNG THỨC MICELLAR 380ML','1','150000','1'),
('7','4','Kem lót Maybeline','newarrive-11.png','Kem lót mịn da che khuyết điểm Maybelline New York Baby Skin Pore Eraser Primer 22ml','1','158000','1');

insert  into `sanpham`(`idTH`,`idLoai`,`tenSP`,`hinhanh`,`chitiet`,`rate`,`gia`,`status`) values 
('6','4','Son INISFREE','bestseller-1.png','Son thỏi mịn môi version Vintage innisfree Edition Smudge Blur Lipstick 0.95g','2','220000','1'),
('6','4','Mascara INISFREE','bestseller-2.png','Mascara phiên bản Vintage Filter innisfree Vintage Filter Edition Color 8g','2','330000','1'),
('6','1','Green Tea Seed Essence','bestseller-3.png','Sữa dưỡng kết hợp tinh chất 2 trong 1 innisfree Green Tea Seed Essence In Lotion 100ml','2','520000','1'),
('1','4','Kem nền LOreal Liquid Foundation','bestseller-4.png','Kem nền dưỡng da dạng lỏng LOreal Paris True match Liquid Foundation 30ml','2','255000','1'),
('1','1','LOreal Crystal Micro Essence','bestseller-5.png','Dưỡng Chất Căng Mướt Da LOreal Paris Crystal Micro Essence 130ml','2','369000','1'),
('3','4','Shadow Palette Pop In Mood','bestseller-6.png','Bảng phấn trang điểm đa năng Merzy Bite The Beat Shadow Palette Pop In Mood 13,1g','2','549000','1'),
('3','4','The First Eye Shadow','bestseller-7.png','Phấn mắt Merzy The First Eye Shadow E1 - Sophie Beige 2,2g','2','129000','1'),
('6','8','My Perfumed Body Lotion','bestseller-8.png','Sữa dưỡng thể hương nước hoa innisfree My Perfumed Body Lotion 330ml','2','340000','1'),
('6','9','Apple Seed Lip & Eye Makeup Remover','bestseller-9.png','Dầu tẩy trang mắt và môi innisfree Apple Seed Lip & Eye Makeup Remover 100ml','2','170000','1'),
('6','9','Green Tea Pure Body Scrub','bestseller-10.png','Tẩy tế bào da chết toàn thân hương trà xanh innisfree Green Tea Pure Body Scrub 150ml','2','200000','1'),
('6','8','Innisfree Bija Trouble Skin','bestseller-1.png','Nước cân bằng dành cho da mụn Innisfree Bija Trouble Skin 200ml','2','390000','1');


update sanpham set `idTH`=1 where idSP=25;
UPDATE sanpham
SET `chitiet`= 'Phấn nước kiềm dầu Lemonade Matte Addict Dual Cushion 16g và son dưỡng LipFiller 4.5g'
WHERE idSP='5';
select * from sanpham;
select * from sanpham where hinhanh like '%newarrive%';

CREATE TABLE `donvivc` (
  `idDVVC`INT NOT NULL AUTO_INCREMENT,
  `tenDVVC` varchar(50) NOT NULL,
  `gia` INT NOT NULL,
  PRIMARY KEY (`idDVVC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into `donvivc`(`tenDVVC`,`gia`) values
('Giao hàng nhanh','50000'),
('Giao hàng tiết kiệm','30000'),
('Bưu điện','45000'),
('J&T Express','33000'),
('Ninja Van','35000');
CREATE TABLE `phuongthuctt` (
  `idPTTT` INT NOT NULL AUTO_INCREMENT,
  `tenPTTT` varchar(50) NOT NULL,
  PRIMARY KEY (`idPTTT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into `phuongthuctt`(`tenPTTT`) values
('Thanh toán khi nhận hàng'),
('Thanh toán bằng Zalopay'),
('Thanh toán bằng thẻ tín dụng / ghi nợ');

CREATE TABLE `donhang` (
  `idDH` INT NOT NULL AUTO_INCREMENT,
  `id` INT NOT NULL,
  `ngaylap`date  NULL,
  `idPTTT` INT  NOT NULL,
  `tongtien` INT NOT NULL,
  PRIMARY KEY (`idDH`),
  FOREIGN KEY (`id`) REFERENCES `khachhang` (`id`),
  FOREIGN KEY (`idPTTT`) REFERENCES `phuongthuctt` (`idPTTT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

alter table donhang
add column trangthai varchar(100);
insert  into `donhang`(`id`,`ngaylap`,`idPTTT`,`tongtien`,`trangthai`) values
	('1','2022/12/21','1','2300000','Đang giao hàng.' ),
    ('3','2022/10/09','2','500000','Đang giao hàng.' ),
    ('6','2022/09/20','1','1500000','Đang giao hàng.' ),
    ('5','2022/10/13','1','4500000','Đang giao hàng.' ),
    ('2','2022/10/12','2','2450000','Đang giao hàng.' ),
    ('2','2022/10/12','2','2450000','Đang giao hàng.' ),
    ('7','2022/10/11','3','1230000','Đang giao hàng.' );
    
insert  into `donhang`(`id`,`ngaylap`,`idPTTT`,`tongtien`,`trangthai`) values
	('4','2021/10/16','1','3460000','Đang giao hàng.' ),
	('8','2022/10/16','2','245000','Đang giao hàng.' ),
	('9','2022/10/16','3','987000','Đang giao hàng.' ),
	('10','2022/10/16','1','1238000','Đang giao hàng.' );
    
CREATE TABLE `chitietDH` (
  `idCTDH` INT NOT NULL AUTO_INCREMENT,
  `idDH` INT NOT NULL,
  `idSP` INT NOT NULL,
  `soluongSP` int NOT NULL,
  PRIMARY KEY (`idCTDH`),
  FOREIGN KEY (`idDH`) REFERENCES `donhang` (`idDH`),
  FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

alter table  `chitietDH`
add column `thanhtien` INT;

insert  into `chitietDH`(`idDH`,`idSP`,`soluongSP`,`thanhtien`) values
('2','1','2','466800'),
('1','3','5','2175000'),
('2','5','4','1827000'),
('2','5','4','1827000'),
('3','6','4','1992000'),
('1','7','1','209000'),
('5','9','3','702000'),
('6','4','3','923000'),
('5','11','3','723000'),
('7','12','3','1200000'),
('7','2','3','570000'),
('4','7','7','4941000');

insert  into `chitietDH`(`idDH`,`idSP`,`soluongSP`,`thanhtien`) values
('1','34','10','2200000'),
('2','35','12','3920000'),
('3','36','15','7800000'),
('4','37','13','3315000'),
('5','38','20','7380000'),
('6','39','17','9333000'),
('7','40','15','1935000'),
('8','41','16','5440000'),
('9','42','23','3910000'),
('10','43','22','4400000'),
('9','44','19','7410000');

CREATE TABLE `review` (
    `id` INT NOT NULL,
    `idSP` INT NOT NULL,
    `noidung` VARCHAR(255) NOT NULL,
    `ngayreview` DATE NOT NULL,
    `anhreview` VARCHAR(30) NULL,
    FOREIGN KEY (`id`)
        REFERENCES `khachhang` (`id`),
    FOREIGN KEY (`idSP`)
        REFERENCES `sanpham` (`idSP`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

insert into review (`id`,`idSP`,`noidung`,`ngayreview`) values 
('3','42','Sản phẩm này còn không ạ???','2021/11/7'),
('9','42','Sản phẩm dùng rất hiệu quả','2021/11/10'),
('7','42','Giá thành hợp lý, chất lượng sản phẩm tốt, mình sẽ ủng hộ lâu dài!','2021/11/11');

insert into review (`id`,`idSP`,`noidung`,`ngayreview`) values 
('1','1','Sản phẩm này còn không ạ???','2022/1/5'),
('7','1','Sản phẩm dùng rất hiệu quả','2022/1/9'),
('10','1','Sản phẩm rất dễ sử dụng','2022/1/10'),
('3','1','Giá thành hợp lý, chất lượng sản phẩm tốt, mình sẽ ủng hộ lâu dài!','2022/1/12');

ALTER TABLE review
MODIFY COLUMN noidung text;
ALTER TABLE khachhang
MODIFY COLUMN matkhau varchar(255) null;