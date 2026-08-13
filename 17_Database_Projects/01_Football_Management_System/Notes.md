Bài 1. Cơ sở dữ liệu về Quản lý giải bóng đá (QLBongDa) 
1. MÔ TẢ CƠ SỞ DỮ LIỆU 
 CAUTHU(MACT, HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO)  
Mỗi cầu thủ có một mã số duy nhất (MACT), một họ tên (HOTEN), một ngày sinh 
(NGAYSINH), địa chỉ (DIACHI), thuộc một câu lạc bộ (MACLB), thuộc một quốc gia 
(MAQG), giữ một vị trí trên sân (VITRI), vị trí trên sân của cần thủ chỉ thuộc một 
trong các vị trí sau: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ; số áo (SO), cầu 
thủ thuộc cùng một câu lạc bộ phải có số áo khác nhau.  
 QUOCGIA(MAQG, TENQG)  
Mỗi quốc gia có một mã số duy nhất (MAQG) để phân biệt với các quốc gia khác, 
một tên duy nhất (TENQG).  
 CAULACBO(MACLB, TENCLB, MASAN, MATINH) 
Mỗi câu lạc bộ có một mã duy nhất (MACLB), một tên (TENCLB), quản lý một sân 
bóng (MASAN), thuộc một tỉnh thành (MATINH). Mỗi câu lạc bộ chỉ được phép đăng 
ký tối đa 8 cầu thủ nước ngoài.  
 TINH(MATINH, TENTINH) 
Mỗi tỉnh/thành có một duy nhất (MATINH), tên tỉnh/thành (TENTINH) duy nhất. 
 SANVD(MASAN, TENSAN, DIACHI)  
Mỗi sân bóng có một mã số duy nhất (MASAN), một tên sân duy nhất (TENSAN), một 
địa chỉ (DIACHI).  
 HUANLV(MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG)  
Mỗi huấn luyện viên có một mã số duy nhất (MAHLV), một họ tên (TENHLV), một 
ngày sinh (NGAYSINH), một ðịa chỉ (DIACHI), một ðiện thoại, thuộc một quốc gia 
(MAQG).  
 HLV_CLB(MAHLV, MACLB, VAITRO)
Một câu lạc bộ có thể có nhiều huấn luyên viên (MAHLV), một huấn luyện viên có 
thể tham gia huấn luyện cho nhiều câu lạc bộ (MACLB) với một vai trò (VAITRO) cụ 
thể, vai trò của huấn luyện viên trong một câu lạc bộ thuộc một trong các vai trò sau: 
HLV chính, HLV phụ, HLV thể lực, HLV thủ môn. Mỗi câu lạc bộ chỉ có tối đa 2 HLV 
chísnh.  
 TRANDAU(MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, 
KETQUA)  
Mỗi trận đấu của một vòng đấu (VONG) trong mùa giải (NAM) có một mã số duy 
nhất (MATRAN), được tổ chức thi đấu trên sân (MASAN) vào một ngày (NGAYTD) 
với sự tham gia của 2 câu lạc bộ có mã MACLB1, MACLB2, có kết quả (KETQUA).  
 BANGXH(MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, 
DIEM, HANG)  
Bảng xếp hạng cho biết kết quả xếp hạng vòng đấu (VONG) trong mùa giải (NAM) 
của đội bóng (MACLB) với số trận đã đấu (SOTRAN), trong đó số trận thắng 
(THANG), số trận hòa (HOA), số trận thua (THUA), có hiệu số bàn thắng - thua 
(HIEUSO), tổng điểm (DIEM), xếp hạng (HANG). 
 CAUTHU(MACT, HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO)  
Images/HInh
Tăng tự động: Ở phần Column Properties, ở thuộc tính Identity Specification: - (Is Identity): Yes - Identity Increment: (mức tăng, mặc định là 1) - Identity Seed: (giá trị đầu, mặc định là 1) 
 QUOCGIA(MAQG, TENQG)
images/hinh
CAULACBO(MACLB, TENCLB, MASAN, MATINH)
images/hinh
TINH(MATINH, TENTINH)
img
SANVD(MASAN, TENSAN, DIACHI) 
img
HUANLV(MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG)
img
HLV_CLB(MAHLV, MACLB, VAITRO)
img
TRANDAU(MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, 
KETQUA)
img
BANGXH(MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, 
DIEM, HANG) 
img
2. YÊU CẦU 
1. Tạo CSDL có tên QLBongDa.  
2. Tạo các Table CAUTHU, QUOCGIA, CAULACBO, TINH, HUANLV, SANVD, 
HLV_CLB, TRANDAU, BANGXH.  
3. Tạo liên kết cho các Table trong CSDL trên. 

---

Bài 1: Sử dụng CSDL QLBongDa (ở phần I) thực hiện các yêu cầu sau: 
1. Nhập dữ liệu vào các table như sau: 
CAUTHU(MACT, HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, 
img
 QUOCGIA(MAQG, TENQG) 
img
CAULACBO(MACLB, TENCLB, MASAN, MATINH)
img
TINH(MATINH, TENTINH)
img
SANVD(MASAN, TENSAN, DIACHI)
img
HUANLV(MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG) 
img
HLV_CLB(MAHLV, MACLB, VAITRO)
img
TRANDAU(MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, 
KETQUA)
img
BANGXH(MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, 
DIEM, HANG) 
img
2. Xóa cầu thủ ‘Nguyễn Vũ Phong’. 
3. Xóa các cầu thủ có tuổi trên 40. 
4. Xóa các cầu thủ có tuổi trên 35 ở câu lạc bộ ‘BBD’. 
5. Xóa các cầu thủ có tuổi trên 35 ở câu lạc bộ ‘BECAMEX BÌNH DƯƠNG’. 
6. Đổi vị trí thi đấu của cầu thủ ‘Nguyễn Trường Sơn’ thành ‘Tiền đạo’. 
7. Ghi nhận địa chỉ của huấn luyện viên ‘Lê Huỳnh Đức’ là ‘TP.HCM’ 
8. Đổi vị trí của cầu thủ ‘Nguyễn Công Vinh’ với cầu thủ ‘Trần Tấn Tài’. 
9. Thay huấn luyện viên mới của ‘GẠCH ĐỒNG TÂM LONG AN’ là ‘Nguyễn Đức 
Thắng’. 
10. Đổi tên câu lạc bộ ‘BECAMEX BÌNH DƯƠNG’ thành ‘BÌNH DƯƠNG’. 
