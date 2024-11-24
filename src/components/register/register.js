import React, { useState } from 'react';
import './register.css';
import axios from 'axios'; // Nếu bạn sử dụng axios

function Register() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
  });
  const [errorMessage, setErrorMessage] = useState('');
  const [successMessage, setSuccessMessage] = useState('');

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault(); // Ngăn form reload trang
    setErrorMessage(''); // Xóa lỗi trước đó
    setSuccessMessage(''); // Xóa thông báo thành công trước đó

    try {
      // Gửi yêu cầu đăng kí
      const response = await axios.post('https://trung.io.vn/api/auth/register', formData);

      // Nếu thành công
      console.log('Register success:', response.data);
      setSuccessMessage('Đăng kí thành công! Bạn có thể đăng nhập ngay.');
    } catch (error) {
      console.error('Register error:', error.response?.data || error);
      // Hiển thị thông báo lỗi
      setErrorMessage(
        error.response?.data?.message || 'Có lỗi xảy ra. Vui lòng thử lại!'
      );
    }
  };

  return (
    <div className="register-container">
      <h2>ĐĂNG KÍ</h2>
      <form className="register-form" onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Username"
          name="name"
          value={formData.name}
          onChange={handleChange}
          required
        />
        <input
          type="text"
          placeholder="Email"
          name="email"
          value={formData.email}
          onChange={handleChange}
          required
        />
        <input
          type="password"
          placeholder="Password"
          name="password"
          value={formData.password}
          onChange={handleChange}
          required
        />
        <input
          type="password"
          placeholder="Confirm Password"
          name="password_confirmation"
          value={formData.password_confirmation}
          onChange={handleChange}
          required
        />
        <button type="submit">Đăng Kí</button>

        {/* Hiển thị lỗi nếu có */}
        {errorMessage && <p className="error-message">{errorMessage}</p>}

        {/* Hiển thị thông báo thành công */}
        {successMessage && <p className="success-message">{successMessage}</p>}

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

        <div className="social-login">
          <img src="facebook-icon.png" alt="Facebook" className="social-icon" />
          <img src="google-icon.png" alt="Google" className="social-icon" />
        </div>

        <p className="login-prompt">
          Bạn đã có tài khoản? <a href="#" className="login-link">Đăng nhập.</a>
        </p>
      </form>
    </div>
  );
}

export default Register;
