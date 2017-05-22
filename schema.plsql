# TAO USER dbaDUAN 
--TAO USER 
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER dbaDuAn IDENTIFIED BY 123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
ACCOUNT UNLOCK;

--CAP QUYEN CHO USER 
GRANT dba TO dbaDuAn;

# CAU TRUC
--TAO MOI CAC BANG
--CHINHANH
CREATE TABLE ChiNhanh (
  maCN varchar2(5),
  tenCN nvarchar2(100) not null enable,
  truongChiNhanh varchar2(6) not null enable,
  primary key (maCN)
);

--CHITIEU
CREATE TABLE ChiTieu (
  maChiTieu varchar2(5),
  tenChiTieu nvarchar2(100) not null enable,
  soTien integer,
  duAn varchar2(5) not null enable,
  primary key (maChiTieu)
);

--NHANVIEN
CREATE TABLE NhanVien (
  maNV varchar2(6),
  hoTen nvarchar2(50) not null enable,
  diaChi nvarchar2(100),
  dienThoai varchar2(12),
  email varchar2(30),
  maPhong varchar2(5) not null enable,
  chiNhanh varchar2(5) not null enable,
  luong float not null enable,
  primary key (maNV)
);

--PHANCONG
CREATE TABLE PhanCong (
  maNV varchar2(6),
  duAn varchar2(5),
  vaiTro nvarchar2(50),
  phuCap float,
  primary key (maNV, duAn)
);

--PHONGBAN
CREATE TABLE PhongBan (
  maPhong varchar2(5),
  tenPhong nvarchar2(30) not null enable,
  truongPhong varchar2(6) not null enable,
  ngayNhanChuc date not null enable,
  soNhanVien smallint not null enable,
  chiNhanh varchar2(5) not null enable,
  primary key (maPhong)
);

--DUAN
CREATE TABLE DuAn (
  maDA varchar2(5),
  tenDA nvarchar2(50) not null enable,
  kinhPhi float,
  phongChuTri varchar2(5) not null enable,
  truongDA varchar2(6) not null enable,
  primary key (maDA)
);

--TAO KHOA NGOAI CHO CAC BANG
--CHINHANH
ALTER TABLE CHINHANH
ADD CONSTRAINT FK_CN_NV FOREIGN KEY (truongChiNhanh) REFERENCES NHANVIEN(maNV);

--CHITIEU
ALTER TABLE CHITIEU
ADD CONSTRAINT FK_CT_DA FOREIGN KEY (duAn) REFERENCES DUAN(maDA);

--NHANVIEN
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_CN FOREIGN KEY (chiNhanh) REFERENCES CHINHANH(maCN);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_PB FOREIGN KEY (maPhong) REFERENCES PHONGBAN(maPhong);

--PHANCONG
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_NV FOREIGN KEY (maNV) REFERENCES NHANVIEN(maNV);

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_DA FOREIGN KEY (duAn) REFERENCES DUAN(maDA);

--PHONGBAN
ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PB_CN FOREIGN KEY (chiNhanh) REFERENCES CHINHANH(maCN);

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PB_NV FOREIGN KEY (truongPhong) REFERENCES NHANVIEN(maNV);

--DUAN
ALTER TABLE DUAN
ADD CONSTRAINT FK_DA_NV FOREIGN KEY (truongDA) REFERENCES NHANVIEN(maNV);

ALTER TABLE DUAN
ADD CONSTRAINT FK_DA_PB FOREIGN KEY (phongChuTri) REFERENCES PHONGBAN(maPhong);

# NHAP LIEU CHO CAC BANG
--CHINHANH 
INSERT INTO dbaDuAn.CHINHANH VALUES ('CN001', N'TP. Hồ Chí Minh', 'TCN001');
INSERT INTO dbaDuAn.CHINHANH VALUES ('CN002', N'Hà Nội', 'TCN002');
INSERT INTO dbaDuAn.CHINHANH VALUES ('CN003', N'Đà Nẵng', 'TCN003');
INSERT INTO dbaDuAn.CHINHANH VALUES ('CN004', N'Cần Thơ', 'TCN004');
INSERT INTO dbaDuAn.CHINHANH VALUES ('CN005', N'Hải Phòng', 'TCN005');

--CHITIEU
INSERT INTO dbaDuAn.CHITIEU VALUES ('CT001', N'In khảo sát', 1000, 'DA001');
INSERT INTO dbaDuAn.CHITIEU VALUES ('CT002', N'Gọi điện cho ứng viên', 500, 'DA002');
INSERT INTO dbaDuAn.CHITIEU VALUES ('CT003', N'Kiểm định giờ làm', 400, 'DA003');
INSERT INTO dbaDuAn.CHITIEU VALUES ('CT004', N'Phân tích kiểm định sản phẩm', 500, 'DA004');
INSERT INTO dbaDuAn.CHITIEU VALUES ('CT005', N'Thuê công ty kiểm toán', 500, 'DA005');

--NHANVIEN
INSERT INTO dbaDuAn.NHANVIEN VALUES ('GD001', N'Chung Bá Vinh', N'234 Nguyễn Xí', '0123456789', 'GD001@gmail.com', 'PCSKH', 'CN001', 4500);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('GD002', N'Đào Bá Vinh', N'234 Nơ Trang Long', '0123456789', 'GD002@gmail.com', 'PKH', 'CN002', 5000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('GD003', N'Đinh Mạnh Ninh', N'56 Điện Biên Phủ', '0123456789', 'GD003@gmail.com', 'PKT', 'CN003', 5500);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('GD004', N'Trịnh Duẫn Hạo', N'85 Nguyễn Đình Chiểu', '0123456789', 'GD004@gmail.com', 'PNS', 'CN004', 6000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('GD005', N'Thẩm Xương Mân', N'415 Phạm Văn Đồng', '0123456789', 'GD005@gmail.com', 'PKDCL', 'CN005', 6500);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TDA001', N'Trần Ngọc Việt', N'123 Ung Văn Khiêm', '0123456789', 'TDA001@gmail.com', 'PCSKH', 'CN001', 5000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TDA002', N'Kim Tuấn Tú', N'115 Nguyễn Kiệm', '0123456789', 'TDA002@gmail.com', 'PKH', 'CN002', 5100);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TDA003', N'Vương Khải Hoành', N'451 Lê Văn Sĩ', '0123456789', 'TDA003@gmail.com', 'PKT', 'CN003', 5200);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TDA004', N'Lưu Hạo Nhân', N'127 Đinh Tiên Hoàng', '0123456789', 'TDA004@gmail.com', 'PNS', 'CN004', 5300);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TDA005', N'Phạm Minh Hoàng', N'54 Phan Đăng Lưu', '0123456789', 'TDA005@gmail.com', 'PKDCL', 'CN005', 5400);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TP001', N'Đoàn Ngọc Lân', N'1Bis Paster', '0123456789', 'TP001@gmail.com', 'PCSKH', 'CN001', 6000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TP002', N'Trịnh Sang Sang', N'45 Võ Thị Sáu', '0123456789', 'TP002@gmail.com', 'PKH', 'CN002', 6500);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TP003', N'Nguyễn Chí Nhân', N'30 Trần Phú', '0123456789', 'TP003@gmail.com', 'PKT', 'CN003', 6900);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TP004', N'Trần Minh Hạo', N'12 Nguyễn Văn Cừ', '0123456789', 'TP004@gmail.com', 'PNS', 'CN004', 6400);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TP005', N'Lưu Bội Bội', N'67 Hoàng Hoa Thám', '0123456789', 'TP005@gmail.com', 'PKDCL', 'CN005', 6700);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TCN001', N'Bối Vy Vy', N'73 Hoàng Văn Thụ', '0123456789', 'TCN001@gmail.com', 'PCSKH', 'CN001', 4000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TCN002', N'Tiêu Nại', '82 Phan Đình Phùng', '0123456789', 'TCN002@gmail.com', 'PKH', 'CN002', 4600);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TCN003', N'Doãn Minh', N'42 Trần Huy Liệu', '0123456789', 'TCN003@gmail.com', 'PKT', 'CN003', 5000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TCN004', N'Diệp Nhật Thi', N'503 Trần Quang Diệu', '0123456789', 'TCN004@gmail.com', 'PNS', 'CN004', 4800);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('TCN005', N'Tống An Thần', N'134 Nguyễn Văn Trỗi', '0123456789', 'TCN005@gmail.com', 'PKDCL', 'CN005', 4900);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV001', N'Lâm Minh Vỹ', N'113 Huỳnh Văn Bánh', '0123456789', 'NV001@gmail.com', 'PCSKH', 'CN001', 3000);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV002', N'Châu Gia Thành', N'387 Nguyễn Văn Đậu', '0123456789', 'NV002@gmail.com', 'PKH', 'CN002', 3100);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV003', N'Tùy Phát', N'256 Nguyễn Thị Minh Khai', '0123456789', 'NV003@gmail.com', 'PKT', 'CN003', 3200);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV004', N'Mạc Thị Hân', N'467 Trương Định', '0123456789', 'NV004@gmail.com', 'PNS', 'CN004', 3500);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV005', N'Cát Tường', N'245 Võ Văn Tần', '0123456789', 'NV005@gmail.com', 'PKDCL', 'CN005', 3300);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV006', N'Lê Hữu Phước', N'106 Huỳnh Văn Bánh', '0123456789', 'NV006@gmail.com', 'PCSKH', 'CN001', 3300);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV007', N'Trần Minh Vỹ', N'387 Lê Quang Định', '0123456789', 'NV007@gmail.com', 'PKH', 'CN002', 3700);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV008', N'Hân Hân', N'256 Lý Thái Tổ', '0123456789', 'NV008@gmail.com', 'PKT', 'CN003', 3200);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV009', N'Lý Mạc Sầu', N'467 Cách Mạng Tháng 8', '0123456789', 'NV009@gmail.com', 'PNS', 'CN004', 3900);
INSERT INTO dbaDuAn.NHANVIEN VALUES ('NV010', N'Nguyễn Hồng Gấm', N'245 Hòa Hưng', '0123456789', 'NV010@gmail.com', 'PKDCL', 'CN005', 3800);

--PHANCONG
INSERT INTO dbaDuAn.PHANCONG VALUES ('NV001', 'DA001', N'Thu thập báo cáo', 100);
INSERT INTO dbaDuAn.PHANCONG VALUES ('NV002', 'DA002', N'Gọi điện cho các ứng cử viên dưới 25 tuổi ở TP HCM', 100);
INSERT INTO dbaDuAn.PHANCONG VALUES ('NV003', 'DA003', N'Phân tích số liệu làm việc của nhân viên', 100);
INSERT INTO dbaDuAn.PHANCONG VALUES ('NV004', 'DA004', N'Phân tích mẫu sản phẩm', 100);
INSERT INTO dbaDuAn.PHANCONG VALUES ('NV005', 'DA005', N'Tổng kết các số liệu kế toán', 100);

--PHONGBAN
INSERT INTO dbaDuAn.PHONGBAN VALUES ('PCSKH', N'Chăm sóc khách hàng', 'TP001', TO_DATE('08-08-2016','MM-DD-YYYY'), 2, 'CN001');
INSERT INTO dbaDuAn.PHONGBAN VALUES ('PKH', N'Kế hoạch', 'TP002', TO_DATE('01-01-2013','MM-DD-YYYY'), 2, 'CN002');
INSERT INTO dbaDuAn.PHONGBAN VALUES ('PKT', N'Kế toán', 'TP003', TO_DATE('02-07-2013','MM-DD-YYYY'), 2, 'CN003');
INSERT INTO dbaDuAn.PHONGBAN VALUES ('PNS', N'Nhân sự', 'TP004', TO_DATE('07-01-2014','MM-DD-YYYY'), 2, 'CN004');
INSERT INTO dbaDuAn.PHONGBAN VALUES ('PKDCL', N'Kiểm định chất lượng', 'TP005', TO_DATE('05-03-2007','MM-DD-YYYY'), 2, 'CN005');

--DUAN
INSERT INTO dbaDuAn.DUAN VALUES ('DA001', N'Rà soát thị trường', 10000, 'PKH', 'TDA001');
INSERT INTO dbaDuAn.DUAN VALUES ('DA002', N'Tuyển nhân viên 2017', 1000, 'PNS', 'TDA002');
INSERT INTO dbaDuAn.DUAN VALUES ('DA003', N'Kế hoạch tăng lương', 100000, 'PKT', 'TDA003');
INSERT INTO dbaDuAn.DUAN VALUES ('DA004', N'Nghiên cứu sản phẩm mới', 2000, 'PKDCL', 'TDA004');
INSERT INTO dbaDuAn.DUAN VALUES ('DA005', N'Kiểm kê tài chính 2017', 1200, 'PKT', 'TDA005');
