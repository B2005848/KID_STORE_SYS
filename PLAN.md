# HỆ THỐNG QUẢN LÝ VÀ KINH DOANH ĐỒ DÙNG TRẺ EM (BABY STORE MANAGEMENT SYSTEM)

---

# 1. Giới thiệu dự án

## 1.1 Tổng quan

Baby Store Management System là hệ thống website thương mại điện tử kết hợp quản lý cửa hàng đồ dùng trẻ em, được xây dựng nhằm hỗ trợ doanh nghiệp trong việc quản lý sản phẩm, khách hàng, đơn hàng, thanh toán và tồn kho trên một nền tảng tập trung.

Hệ thống cho phép khách hàng mua sắm trực tuyến, đồng thời cung cấp công cụ quản trị giúp cửa hàng kiểm soát hoạt động kinh doanh một cách hiệu quả và chính xác.

---

## 1.2 Mục tiêu xây dựng hệ thống

### Mục tiêu nghiệp vụ

* Xây dựng website bán hàng trực tuyến dành cho cửa hàng đồ dùng trẻ em.
* Tối ưu hóa quy trình quản lý sản phẩm và đơn hàng.
* Hỗ trợ khách hàng mua sắm trực tuyến thuận tiện.
* Theo dõi doanh thu và hoạt động kinh doanh.
* Quản lý tồn kho chính xác.

### Mục tiêu kỹ thuật

* Thiết kế cơ sở dữ liệu chuẩn hóa.
* Xây dựng hệ thống theo mô hình Client – Server.
* Phát triển RESTful API.
* Đảm bảo khả năng mở rộng trong tương lai.
* Áp dụng các công nghệ phát triển web hiện đại.

---

# 2. Phạm vi hệ thống

Hệ thống tập trung giải quyết các nghiệp vụ:

* Quản lý người dùng.
* Quản lý sản phẩm.
* Quản lý danh mục.
* Quản lý thương hiệu.
* Quản lý kho hàng.
* Quản lý đơn hàng.
* Quản lý thanh toán.
* Quản lý đánh giá sản phẩm.
* Quản lý chương trình giảm giá.
* Báo cáo và thống kê.

---

# 3. Các tác nhân trong hệ thống

## 3.1 Quản trị viên (Admin)

Quản trị viên có quyền cao nhất trong hệ thống.

### Chức năng

* Quản lý người dùng.
* Quản lý danh mục.
* Quản lý thương hiệu.
* Quản lý sản phẩm.
* Quản lý biến thể sản phẩm.
* Quản lý kho hàng.
* Quản lý đơn hàng.
* Quản lý mã giảm giá.
* Xem báo cáo doanh thu.
* Phân quyền hệ thống.

---

## 3.2 Nhân viên (Staff)

Nhân viên phụ trách xử lý các hoạt động vận hành.

### Chức năng

* Xác nhận đơn hàng.
* Cập nhật trạng thái giao hàng.
* Theo dõi tồn kho.
* Hỗ trợ khách hàng.

---

## 3.3 Khách hàng (Customer)

Khách hàng sử dụng hệ thống để mua sắm.

### Chức năng

* Đăng ký tài khoản.
* Đăng nhập.
* Xem sản phẩm.
* Tìm kiếm sản phẩm.
* Thêm vào giỏ hàng.
* Áp dụng mã giảm giá.
* Đặt hàng.
* Theo dõi đơn hàng.
* Đánh giá sản phẩm.

---

# 4. Yêu cầu chức năng

## 4.1 Quản lý tài khoản

* Đăng ký tài khoản.
* Đăng nhập.
* Đăng xuất.
* Cập nhật thông tin cá nhân.
* Đổi mật khẩu.
* Phân quyền người dùng.

---

## 4.2 Quản lý sản phẩm

* Thêm sản phẩm.
* Cập nhật sản phẩm.
* Xóa sản phẩm.
* Quản lý hình ảnh.
* Quản lý biến thể.
* Quản lý tồn kho.

---

## 4.3 Quản lý danh mục

* Thêm danh mục.
* Sửa danh mục.
* Xóa danh mục.
* Hỗ trợ danh mục nhiều cấp.

---

## 4.4 Quản lý thương hiệu

* Thêm thương hiệu.
* Cập nhật thương hiệu.
* Quản lý logo thương hiệu.

---

## 4.5 Quản lý giỏ hàng

* Thêm sản phẩm vào giỏ hàng.
* Cập nhật số lượng.
* Xóa sản phẩm khỏi giỏ hàng.
* Xem tổng tiền.

---

## 4.6 Quản lý đơn hàng

* Tạo đơn hàng.
* Xác nhận đơn hàng.
* Cập nhật trạng thái.
* Hủy đơn hàng.
* Theo dõi lịch sử đơn hàng.

---

## 4.7 Quản lý thanh toán

* Thanh toán COD.
* Ghi nhận giao dịch thanh toán.
* Theo dõi trạng thái thanh toán.

---

## 4.8 Quản lý đánh giá

* Đánh giá sản phẩm.
* Chấm điểm sản phẩm.
* Xem đánh giá.

---

## 4.9 Quản lý mã giảm giá

* Tạo mã giảm giá.
* Kích hoạt mã giảm giá.
* Vô hiệu hóa mã giảm giá.
* Áp dụng mã giảm giá cho đơn hàng.

---

# 5. Yêu cầu phi chức năng

## Hiệu năng

* Thời gian phản hồi API dưới 2 giây.
* Hỗ trợ nhiều người dùng đồng thời.

## Bảo mật

* Mã hóa mật khẩu.
* Xác thực JWT.
* Phân quyền người dùng.
* Chống SQL Injection.

## Khả năng mở rộng

* Dễ dàng bổ sung phương thức thanh toán.
* Dễ dàng phát triển ứng dụng di động.
* Dễ dàng tích hợp AI trong tương lai.

## Khả năng bảo trì

* Cấu trúc module rõ ràng.
* Tách biệt Frontend và Backend.
* Dễ dàng nâng cấp và sửa lỗi.

---

# 6. Công nghệ sử dụng

## Frontend

* Vue.js 3
* Vue Router
* Pinia
* Tailwind CSS
* Axios

## Backend

* Node.js
* Express.js
* JWT Authentication
* RESTful API

## Cơ sở dữ liệu

* Microsoft SQL Server

## Lưu trữ hình ảnh

* Cloudinary
* AWS S3 (Tùy chọn)

---

# 7. Thiết kế cơ sở dữ liệu

## Các bảng chính

| Bảng                  | Chức năng             |
| --------------------- | --------------------- |
| Roles                 | Phân quyền            |
| Users                 | Người dùng            |
| Categories            | Danh mục              |
| Brands                | Thương hiệu           |
| Products              | Sản phẩm              |
| ProductImages         | Hình ảnh sản phẩm     |
| ProductVariants       | Biến thể sản phẩm     |
| Addresses             | Địa chỉ giao hàng     |
| Cart                  | Giỏ hàng              |
| CartItems             | Chi tiết giỏ hàng     |
| Coupons               | Mã giảm giá           |
| Orders                | Đơn hàng              |
| OrderDetails          | Chi tiết đơn hàng     |
| Payments              | Thanh toán            |
| Reviews               | Đánh giá              |
| InventoryTransactions | Lịch sử nhập xuất kho |

---

# 8. Luồng xử lý đặt hàng

```text
Khách hàng
      │
      ▼
Xem sản phẩm
      │
      ▼
Thêm vào giỏ hàng
      │
      ▼
Tiến hành thanh toán
      │
      ▼
Áp dụng mã giảm giá
      │
      ▼
Tạo đơn hàng
      │
      ▼
Tạo chi tiết đơn hàng
      │
      ▼
Cập nhật tồn kho
      │
      ▼
Ghi nhận thanh toán
      │
      ▼
Xác nhận đơn hàng
      │
      ▼
Giao hàng
      │
      ▼
Hoàn tất
```

---

# 9. Kiến trúc hệ thống

```text
Frontend (Vue.js)
        │
        ▼
REST API (Express.js)
        │
        ▼
Business Layer
        │
        ▼
SQL Server Database
```

---

# 10. Cấu trúc thư mục dự kiến

```text
project-root
│
├── client
│
├── server
│
├── database
│
├── docs
│
└── README.md
```

---

# 11. Hướng phát triển trong tương lai

## Giai đoạn 2

* Tích hợp VNPay.
* Tích hợp MoMo.
* Thông báo thời gian thực.
* Chat trực tuyến.

## Giai đoạn 3

* Ứng dụng di động.
* Gợi ý sản phẩm bằng AI.
* Dashboard nâng cao.
* Phân tích dữ liệu kinh doanh.

---

# 12. Thông tin thực hiện

Sinh viên thực hiện:

* Họ và tên: [Tên sinh viên]
* Ngành: Công nghệ thông tin
* Trường: [Tên trường]

Giảng viên hướng dẫn:

* [Tên giảng viên]

---

# 13. Giấy phép

Dự án được phát triển phục vụ mục đích học tập, nghiên cứu và thực hiện luận văn tốt nghiệp.
