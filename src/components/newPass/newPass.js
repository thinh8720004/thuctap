import React, { useState } from 'react';
import './newPass.css'; // Import the CSS file

function NewPasswordForm() {
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (password === confirmPassword) {
      alert('Password has been changed successfully!');
    } else {
      alert('Passwords do not match. Please try again.');
    }
  };

  return (
    <div className="password-form-container">
      <h2>Điền Mật Khẩu Mới</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="password"
          placeholder="Mật Khẩu Mới"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          className="password-input"
          required
        />
        <input
          type="password"
          placeholder="Mật Khẩu Mới"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
          className="password-input"
          required
        />
        <button type="submit" className="submit-button">Xác Nhận</button>
      </form>
    </div>
  );
}

export default NewPasswordForm;
