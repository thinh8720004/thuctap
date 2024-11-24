import React, { useState } from 'react';

function OTPInput() {
  const [otp, setOtp] = useState(new Array(4).fill("")); // 4-digit OTP
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleChange = (element, index) => {
    if (isNaN(element.value)) return; // Only allow numbers

    const newOtp = [...otp];
    newOtp[index] = element.value;
    setOtp(newOtp);

    // Focus on the next input
    if (element.nextSibling) {
      element.nextSibling.focus();
    }
  };

  const handleSubmit = () => {
    setIsSubmitting(true);
    const otpCode = otp.join('');
    console.log('Entered OTP:', otpCode);

    // Simulate an API call
    setTimeout(() => {
      setIsSubmitting(false);
      alert(`Submitted OTP: ${otpCode}`);
    }, 1000);
  };

  const handleResendCode = () => {
    alert("OTP code resent!");
  };

  return (
    <div style={{ textAlign: "center", padding: "20px", fontFamily: "Arial, sans-serif" }}>
      <h2>Nhập mã xác nhận</h2>
      <p>Mã xác minh của bạn sẽ được gửi bằng cuộc gọi thoại đến</p>
      <div style={{ display: "flex", justifyContent: "center", gap: "10px" }}>
        {otp.map((data, index) => (
          <input
            key={index}
            type="text"
            maxLength="1"
            value={data}
            onChange={(e) => handleChange(e.target, index)}
            onFocus={(e) => e.target.select()}
            style={{
              width: "50px",
              height: "50px",
              textAlign: "center",
              fontSize: "24px",
              borderRadius: "5px",
              border: "1px solid #ccc",
            }}
          />
        ))}
      </div>
      <p>
        Bạn vẫn chưa nhận được? <span onClick={handleResendCode} style={{ color: "blue", cursor: "pointer" }}>Gửi lại</span>
      </p>
      <button
        onClick={handleSubmit}
        disabled={isSubmitting}
        style={{
          marginTop: "20px",
          padding: "10px 20px",
          backgroundColor: "#ff5c5c",
          color: "#fff",
          fontSize: "16px",
          border: "none",
          borderRadius: "5px",
          cursor: "pointer",
        }}
      >
        {isSubmitting ? "Đang gửi..." : "TIẾP TỤC"}
      </button>
    </div>
  );
}

export default OTPInput;
