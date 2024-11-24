import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Register from './components/register/register';
import Login from './components/login/login';
import ForgotPassword from './components/forgetPassword/forgetPassword';
import AccountTable from './components/account/AccountTable';
import OTPInput from './components/otp/otp';

function App() {
  return (
    <div>
      {/* Thêm layout hoặc navigation ở đây nếu cần */}
      <Routes>
        <Route path="/" element={<div>Home Page</div>} />
        <Route path="/register" element={<Register />} />
        <Route path="/login" element={<Login />} />
        <Route path="/forgot-password" element={<ForgotPassword />} />
        <Route path="/account-table" element={<AccountTable />} />
        <Route path="/otp" element={<OTPInput />} />

      </Routes>
    </div>
  );
}

export default App;
