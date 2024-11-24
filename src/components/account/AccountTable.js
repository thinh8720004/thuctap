// import React, { useState } from 'react';
// import { Button, Table } from 'react-bootstrap';
// import AccountModal from './AccountModal';

// const AccountTable = () => {
//   const [accounts, setAccounts] = useState([
//     { id: 1, name: 'Nguyễn Văn A', email: 'nguyenvana@example.com' },
//     { id: 2, name: 'Trần Thị B', email: 'tranthib@example.com' },
//     { id: 3, name: 'Lê Văn C', email: 'levanc@example.com' },
//   ]);

//   const [selectedAccount, setSelectedAccount] = useState(null);
//   const [modalType, setModalType] = useState(''); // 'view', 'edit'

//   // Delete an account
//   const handleDelete = (id) => {
//     if (!window.confirm('Bạn có chắc chắn muốn xóa tài khoản này không?')) return;
//     setAccounts(accounts.filter(account => account.id !== id));
//   };

//   // Open modal for viewing or editing
//   const handleModal = (type, account = null) => {
//     setModalType(type);
//     setSelectedAccount(account);
//   };

//   // Save changes for an account
//   const handleSave = (updatedAccount) => {
//     setAccounts(accounts.map(account =>
//       account.id === updatedAccount.id ? updatedAccount : account
//     ));
//     setModalType('');
//   };

//   return (
//     <div className="container mt-5">
//       <h2>Quản lý tài khoản</h2>

//       <Table striped bordered hover>
//         <thead>
//           <tr>
//             <th>ID</th>
//             <th>Tên</th>
//             <th>Email</th>
//             <th>Hành động</th>
//           </tr>
//         </thead>
//         <tbody>
//           {accounts.map(account => (
//             <tr key={account.id}>
//               <td>{account.id}</td>
//               <td>{account.name}</td>
//               <td>{account.email}</td>
//               <td>
//                 <Button
//                   variant="info"
//                   className="me-2"
//                   onClick={() => handleModal('view', account)}
//                 >
//                   Xem
//                 </Button>
//                 <Button
//                   variant="warning"
//                   className="me-2"
//                   onClick={() => handleModal('edit', account)}
//                 >
//                   Sửa
//                 </Button>
//                 <Button
//                   variant="danger"
//                   onClick={() => handleDelete(account.id)}
//                 >
//                   Xóa
//                 </Button>
//               </td>
//             </tr>
//           ))}
//         </tbody>
//       </Table>

//       {/* Modal */}
//       {modalType && (
//         <AccountModal
//           show={!!modalType}
//           type={modalType}
//           account={selectedAccount}
//           onHide={() => setModalType('')}
//           onSave={handleSave}
//         />
//       )}
//     </div>
//   );
// };

// export default AccountTable;


import React, { useState, useEffect } from 'react';
import { Button, Table } from 'react-bootstrap';
import AccountModal from './AccountModal';
import axios from 'axios';

const AccountTable = () => {
  const [accounts, setAccounts] = useState([]);
  const [selectedAccount, setSelectedAccount] = useState(null);
  const [modalType, setModalType] = useState(''); // 'view', 'edit'
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // Load all accounts from API
  const fetchAccounts = async () => {
    try {
      setLoading(true);
      const response = await axios.get('https://trung.io.vn/api/users');
      setAccounts(response.data); // Assuming response.data is the list of users
    } catch (err) {
      console.error('Failed to fetch accounts:', err);
      setError('Không thể tải danh sách tài khoản!');
    } finally {
      setLoading(false);
    }
  };

  // Delete an account
  const handleDelete = async (id) => {
    if (!window.confirm('Bạn có chắc chắn muốn xóa tài khoản này không?')) return;

    try {
      await axios.delete(`https://trung.io.vn/api/users/${id}`);
      setAccounts(accounts.filter(account => account.id !== id));
    } catch (err) {
      console.error('Failed to delete account:', err);
      alert('Xóa tài khoản thất bại!');
    }
  };

  // Open modal for viewing or editing
  const handleModal = async (type, accountId = null) => {
    setError('');
    setModalType(type);

    if (accountId) {
      try {
        const response = await axios.get(`https://trung.io.vn/api/users/${accountId}`);
        setSelectedAccount(response.data);
      } catch (err) {
        console.error('Failed to fetch account details:', err);
        setError('Không thể tải thông tin tài khoản!');
      }
    } else {
      setSelectedAccount(null);
    }
  };

  // Save changes for an account
  const handleSave = async (updatedAccount) => {
    try {
      const response = await axios.put(
        `https://trung.io.vn/api/users/${updatedAccount.id}`,
        updatedAccount
      );

      // Update accounts list
      setAccounts(accounts.map(account =>
        account.id === updatedAccount.id ? response.data : account
      ));
      setModalType('');
    } catch (err) {
      console.error('Failed to update account:', err);
      alert('Cập nhật tài khoản thất bại!');
    }
  };

  // Fetch accounts on mount
  useEffect(() => {
    fetchAccounts();
  }, []);

  return (
    <div className="container mt-5">
      <h2>Quản lý tài khoản</h2>

      {loading ? (
        <p>Đang tải...</p>
      ) : error ? (
        <p className="text-danger">{error}</p>
      ) : (
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>ID</th>
              <th>Tên</th>
              <th>Email</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            {accounts.map(account => (
              <tr key={account.id}>
                <td>{account.id}</td>
                <td>{account.name}</td>
                <td>{account.email}</td>
                <td>
                  <Button
                    variant="info"
                    className="me-2"
                    onClick={() => handleModal('view', account.id)}
                  >
                    Xem
                  </Button>
                  <Button
                    variant="warning"
                    className="me-2"
                    onClick={() => handleModal('edit', account.id)}
                  >
                    Sửa
                  </Button>
                  <Button
                    variant="danger"
                    onClick={() => handleDelete(account.id)}
                  >
                    Xóa
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </Table>
      )}

      {/* Modal */}
      {modalType && (
        <AccountModal
          show={!!modalType}
          type={modalType}
          account={selectedAccount}
          onHide={() => setModalType('')}
          onSave={handleSave}
        />
      )}
    </div>
  );
};

export default AccountTable;
