import React, { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';

const AccountModal = ({ show, type, account, onHide, onSave }) => {
  const [formData, setFormData] = useState(account || {});

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = () => {
    onSave(formData);
  };

  return (
    <Modal show={show} onHide={onHide}>
      <Modal.Header closeButton>
        <Modal.Title>
          {type === 'view' ? 'Thông tin tài khoản' : 'Chỉnh sửa tài khoản'}
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        {type === 'view' ? (
          <>
            <p><strong>ID:</strong> {account?.id}</p>
            <p><strong>Tên:</strong> {account?.name}</p>
            <p><strong>Email:</strong> {account?.email}</p>
            <p><strong>Địa chỉ:</strong> {account?.address}</p>
            <p><strong>Điện thoại:</strong> {account?.phone}</p>
            <p><strong>Trạng thái:</strong> {account?.status ? 'Hoạt động' : 'Không hoạt động'}</p>
          </>
        ) : (
          <Form>
            <Form.Group>
              <Form.Label>Tên</Form.Label>
              <Form.Control
                name="name"
                value={formData.name || ''}
                onChange={handleChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Email</Form.Label>
              <Form.Control
                name="email"
                value={formData.email || ''}
                onChange={handleChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Địa chỉ</Form.Label>
              <Form.Control
                name="address"
                value={formData.address || ''}
                onChange={handleChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Điện thoại</Form.Label>
              <Form.Control
                name="phone"
                value={formData.phone || ''}
                onChange={handleChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Trạng thái</Form.Label>
              <Form.Control
                as="select"
                name="status"
                value={formData.status || 0}
                onChange={handleChange}
              >
                <option value={1}>Hoạt động</option>
                <option value={0}>Không hoạt động</option>
              </Form.Control>
            </Form.Group>
          </Form>
        )}
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={onHide}>
          Đóng
        </Button>
        {type === 'edit' && (
          <Button variant="primary" onClick={handleSubmit}>
            Lưu
          </Button>
        )}
      </Modal.Footer>
    </Modal>
  );
};

export default AccountModal;
