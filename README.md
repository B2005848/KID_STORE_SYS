# Baby Store Management System

## Giới thiệu

Baby Store Management System là hệ thống website quản lý và kinh doanh đồ dùng trẻ em, được xây dựng nhằm hỗ trợ cửa hàng trong việc quản lý sản phẩm, đơn hàng, khách hàng, thanh toán và tồn kho một cách hiệu quả.

Dự án được thực hiện trong khuôn khổ luận văn tốt nghiệp với mục tiêu áp dụng các kiến thức về phân tích thiết kế hệ thống, cơ sở dữ liệu, phát triển web và quản lý quy trình bán hàng trực tuyến.

---

## Mục tiêu dự án

* Xây dựng hệ thống bán hàng trực tuyến dành cho cửa hàng kinh doanh đồ trẻ em.
* Hỗ trợ quản lý sản phẩm, danh mục, thương hiệu và tồn kho.
* Hỗ trợ khách hàng mua sắm trực tuyến.
* Quản lý đơn hàng và thanh toán.
* Thống kê doanh thu và hoạt động kinh doanh.
* Áp dụng mô hình cơ sở dữ liệu chuẩn hóa và dễ mở rộng.

---

## Chức năng chính

### Quản trị viên (Admin)

* Quản lý người dùng.
* Quản lý danh mục sản phẩm.
* Quản lý thương hiệu.
* Quản lý sản phẩm.
* Quản lý biến thể sản phẩm.
* Quản lý kho hàng.
* Quản lý đơn hàng.
* Quản lý mã giảm giá.
* Xem báo cáo doanh thu.
* Phân quyền hệ thống.

### Nhân viên (Staff)

* Xác nhận đơn hàng.
* Cập nhật trạng thái giao hàng.
* Theo dõi tồn kho.
* Hỗ trợ khách hàng.

### Khách hàng (Customer)

* Đăng ký tài khoản.
* Đăng nhập hệ thống.
* Xem sản phẩm.
* Tìm kiếm sản phẩm.
* Thêm sản phẩm vào giỏ hàng.
* Đặt hàng trực tuyến.
* Áp dụng mã giảm giá.
* Theo dõi đơn hàng.
* Đánh giá sản phẩm.

---

## Công nghệ sử dụng

### Frontend

* Vue.js 3
* Vue Router
* Pinia
* Tailwind CSS
* Axios

### Backend

* Node.js
* Express.js
* JWT Authentication
* RESTful API

### Database

* Microsoft SQL Server

### Lưu trữ hình ảnh

* Cloudinary hoặc AWS S3

---

## Thiết kế cơ sở dữ liệu

### Các bảng chính

| Bảng                  | Chức năng             |
| --------------------- | --------------------- |
| Roles                 | Quản lý phân quyền    |
| Users                 | Quản lý tài khoản     |
| Categories            | Danh mục sản phẩm     |
| Brands                | Thương hiệu           |
| Products              | Thông tin sản phẩm    |
| ProductImages         | Hình ảnh sản phẩm     |
| ProductVariants       | Biến thể sản phẩm     |
| Addresses             | Địa chỉ giao hàng     |
| Cart                  | Giỏ hàng              |
| CartItems             | Chi tiết giỏ hàng     |
| Coupons               | Mã giảm giá           |
| Orders                | Đơn hàng              |
| OrderDetails          | Chi tiết đơn hàng     |
| Payments              | Thanh toán            |
| Reviews               | Đánh giá sản phẩm     |
| InventoryTransactions | Lịch sử nhập xuất kho |

---

## Quy trình đặt hàng

1. Khách hàng đăng nhập.
2. Chọn sản phẩm.
3. Thêm sản phẩm vào giỏ hàng.
4. Tiến hành thanh toán.
5. Tạo đơn hàng.
6. Tạo chi tiết đơn hàng.
7. Cập nhật tồn kho.
8. Thanh toán.
9. Hoàn tất đơn hàng.

---

## Cấu trúc thư mục dự kiến

```text
project-root
│
├── client
│   ├── src
│   ├── assets
│   ├── router
│   ├── stores
│   ├── components
│   └── pages
│
├── server
│   ├── controllers
│   ├── routes
│   ├── middleware
│   ├── models
│   ├── services
│   ├── config
│   └── database
│
├── docs
│   ├── ERD
│   ├── UML
│   └── Report
│
└── README.md
```

---

## Cài đặt dự án

### Clone source

```bash
git clone https://github.com/username/baby-store-management.git
```

### Frontend

```bash
cd client

npm install

npm run dev
```

### Backend

```bash
cd server

npm install

npm run dev
```

---

## Tài khoản mẫu

### Admin

```text
Email: admin@example.com
Password: 123456
```

### Customer

```text
Email: customer@example.com
Password: 123456
```

---

## Hướng phát triển

* Tích hợp thanh toán VNPay.
* Tích hợp MoMo.
* Chat trực tuyến với khách hàng.
* Hệ thống thông báo thời gian thực.
* Gợi ý sản phẩm bằng AI.
* Ứng dụng di động React Native.

---

## Thành viên thực hiện

Họ và tên: [Tên sinh viên]

Ngành: Công nghệ thông tin

Trường: [Tên trường]

Giảng viên hướng dẫn: [Tên giảng viên]

---

## Giấy phép

Dự án được phát triển phục vụ mục đích học tập, nghiên cứu và làm luận văn tốt nghiệp.
