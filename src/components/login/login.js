import React, { useState } from 'react';
import './login.css';
import axios from 'axios'; // Nếu dùng axios

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState('');

  const handleSubmit = async (event) => {
    event.preventDefault(); // Ngăn form reload trang
    setErrorMessage(''); // Xóa lỗi trước đó (nếu có)

    try {
      // Gửi yêu cầu đăng nhập
      const response = await axios.post('http://127.0.0.1:8000/api/auth/login', {
        email,
        password,
      });

      // Nếu thành công
      console.log('Login success:', response.data);
      alert('Đăng nhập thành công!'); // Hiển thị thông báo hoặc chuyển hướng
    } catch (error) {
      console.error('Login error:', error);
      // Hiển thị thông báo lỗi
      setErrorMessage('Đăng nhập thất bại! Vui lòng kiểm tra email và mật khẩu.');
    }
  };

  return (
    <div className="register-container">
      <h2>ĐĂNG NHẬP</h2>
      <form className="register-form" onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <button type="submit">Đăng Nhập</button>

        {errorMessage && <p className="error-message">{errorMessage}</p>}

        <div className="options">
          <label>
            <input type="checkbox" />
            Ghi nhớ mật khẩu
          </label>
          <a href="http://localhost:3000/forgot-password" className="forgot-password">Quên mật khẩu?</a>
        </div>

        <div className="divider">
          <span>Hoặc</span>
        </div>

        <p className="register-prompt">
          Bạn chưa có tài khoản? <a href="http://localhost:3000/register" className="register-link">Đăng ký.</a>
        </p>
      </form>
    </div>
  );
}

export default Login;
