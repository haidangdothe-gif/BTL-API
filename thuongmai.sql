CREATE DATABASE thuongmaidientu ;
GO
USE thuongmaidientu;
GO

CREATE TABLE nguoidung (
id INT IDENTITY(1,1) PRIMARY KEY,
tendangnhap NVARCHAR(50) NOT NULL,
matkhau NVARCHAR(255) NOT NULL,
email NVARCHAR(100),
vaitro NVARCHAR(20) NOT NULL,
daxoa BIT DEFAULT 0
);

CREATE TABLE danhmuc (
id INT IDENTITY(1,1) PRIMARY KEY,
tendanhmuc NVARCHAR(100) NOT NULL,
madanhmuccha INT NULL,
daxoa BIT DEFAULT 0
);

CREATE TABLE sanpham (
id INT IDENTITY(1,1) PRIMARY KEY,
madanhmuc INT NOT NULL,
tensanpham NVARCHAR(255) NOT NULL,
mota NVARCHAR(MAX) ,
gia DECIMAL(18,2) NOT NULL,
daxoa BIT DEFAULT 0,
FOREIGN KEY (madanhmuc) REFERENCES danhmuc(id)
);

CREATE TABLE tonkho (
id INT IDENTITY(1,1) PRIMARY KEY,
masanpham INT NOT NULL,
soluong INT NOT NULL DEFAULT 0,
daxoa BIT DEFAULT 0,
FOREIGN KEY (masanpham) REFERENCES sanpham(id)
);

CREATE TABLE khuyenmai (
id INT IDENTITY(1,1) PRIMARY KEY,
magiamgia NVARCHAR(50) NOT NULL,
ngaybatdau DATETIME,
ngayketthuc DATETIME,
daxoa BIT DEFAULT 0
);

CREATE TABLE giohang(
id INT IDENTITY(1,1) PRIMARY KEY,
manguoidung INT NOT NULL,
masanpham INT NOT NULL,
soluong INT NOT NULL,
FOREIGN KEY (manguoidung) REFERENCES nguoidung(id),
FOREIGN KEY (masanpham) REFERENCES sanpham(id)
);

CREATE TABLE donhang(
id INT IDENTITY(1,1) PRIMARY KEY,
manguoidung INT NOT NULL,
makhuyenmai INT NULL,
tongtien DECIMAL(18,2) NOT NULL,
    trangthaidon NVARCHAR(50),
    trangthaigiao NVARCHAR(50), 
    daxoa BIT DEFAULT 0,
    FOREIGN KEY (manguoidung) REFERENCES nguoidung(id),
    FOREIGN KEY (makhuyenmai) REFERENCES khuyenmai(id)
);

CREATE TABLE chitietdonhang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    madonhang INT NOT NULL,
    masanpham INT NOT NULL,
    soluong INT NOT NULL,
    dongia DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (madonhang) REFERENCES donhang(id),
    FOREIGN KEY (masanpham) REFERENCES sanpham(id)
);

CREATE TABLE thanhtoan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    madonhang INT NOT NULL,
    phuongthucthanhtoan NVARCHAR(50), 
    trangthai NVARCHAR(50),
    FOREIGN KEY (madonhang) REFERENCES donhang(id)
);

CREATE TABLE danhgia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    masanpham INT NOT NULL,
    manguoidung INT NOT NULL,
    sosao INT NOT NULL,
    binhluan NVARCHAR(MAX),
    daxoa BIT DEFAULT 0,
    FOREIGN KEY (masanpham) REFERENCES sanpham(id),
    FOREIGN KEY (manguoidung) REFERENCES nguoidung(id)
);

INSERT INTO nguoidung (tendangnhap, matkhau, email, vaitro) 
VALUES 
('admin', '123456', 'admin@utehy.edu.vn', 'Admin'),
('haidang', '123456', 'haidang@gmail.com', 'KhachHang'),
('nguyenvana', '123456', 'nva@gmail.com', 'NhanVien'),
('tranb', '123456', 'tranb@gmail.com', 'KhachHang'),
('lekhoac', '123456', 'lekhoac@gmail.com', 'KhachHang'),
('phamgia', '123456', 'phamgia@gmail.com', 'KhachHang'),
('hoangminh', '123456', 'hminh@gmail.com', 'NhanVien'),
('vungoc', '123456', 'vngoc@gmail.com', 'KhachHang'),
('doantuan', '123456', 'dtuan@gmail.com', 'KhachHang'),
('buitien', '123456', 'btien@gmail.com', 'KhachHang');