import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const ForgotPassword = () => {
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!validateEmail(email)) {
      setMessage('Vui lòng nhập một địa chỉ email hợp lệ.');
      return;
    }

    setLoading(true);
    setMessage('');

    // Giả lập quá trình gửi yêu cầu đặt lại mật khẩu
    setTimeout(() => {
      setLoading(false);
      navigate('/otp'); // Điều hướng đến trang OTP
    }, 2000);
  };

  const validateEmail = (email) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  };

  return (
    <div style={styles.container}>
      <h2>Quên mật khẩu</h2>
      <form onSubmit={handleSubmit} style={styles.form}>
        <label htmlFor="email">Nhập email của bạn:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Email của bạn"
          style={styles.input}
          required
        />
        <button type="submit" style={styles.button} disabled={loading}>
          {loading ? 'Đang gửi yêu cầu...' : 'Gửi yêu cầu đặt lại mật khẩu'}
        </button>
      </form>
      {message && <p style={styles.message}>{message}</p>}
    </div>
  );
};

const styles = {
  container: {
    width: '800px',
    margin: '0 auto',
    padding: '20px',
    textAlign: 'center',
    borderRadius: '8px',
    boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
  },
  form: {
    display: 'flex',
    flexDirection: 'column',
    gap: '10px',
  },
  input: {
    padding: '10px',
    fontSize: '16px',
    borderRadius: '4px',
    border: '1px solid #ccc',
  },
  button: {
    padding: '10px',
    fontSize: '16px',
    borderRadius: '4px',
    backgroundColor: '#007bff',
    color: '#fff',
    border: 'none',
    cursor: 'pointer',
  },
  message: {
    marginTop: '10px',
    fontSize: '14px',
    color: 'green',
  },
};

export default ForgotPassword;
