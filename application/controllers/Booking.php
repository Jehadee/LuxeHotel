<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Booking extends CI_Controller
{
    public function index($ci, $co)
    {
        $data['judul'] = 'Booking';
        $data['user'] = $this->User_model->getUserBySessionEmail();
        $data['ci'] = $ci;
        $data['co'] = $co;
        $data['rooms'] = $this->Home_model->getDisplayRoom();
        $data['count_days'] = ceil(($co - $ci) / 86400);
        $data['allRooms'] = $this->Rooms_model->allRoomCount();
        $data['allBookings'] = $this->Booking_model->getBookings();

        $this->load->view('templates/header', $data);
        $this->load->view('booking/index', $data);
        $this->load->view('templates/footer');
    }

    public function checkAvailability()
    {
        $ci = $this->input->post('ci', true);
        $co = $this->input->post('co', true);

        redirect('booking/index/' . strtotime($ci) . '/' . strtotime($co));
    }

    public function details($id_jenis_kamar, $ci, $co)
    {
        $data['judul'] = 'Booking Details';
        $data['title'] = ['Dr.', 'Mr.', 'Mrs.', 'Ms.'];
        $data['rooms'] = $this->Rooms_model->getDisplayRoom();

        $data['ci_s'] = $ci;
        $data['co_s'] = $co;
        $data['ci'] = date('D, d M, Y', $ci);
        $data['co'] = date('D, d M, Y', $co);
        $data['count_days'] = ceil(($co - $ci) / 86400);

        $data['user'] = $this->User_model->getUserBySessionEmail();
        $data['room'] = $this->Rooms_model->getRoomById($id_jenis_kamar);
        $data['allBookings'] = $this->Booking_model->getBookings();
        $data['allRooms'] = $this->Rooms_model->allRoomCount();

        // Null checks for room fields
        $harga_kamar = isset($data['room']['price']) ? $data['room']['price'] : 0;
        $data['harga_kamar'] = ($harga_kamar * $data['count_days']);
        $data['service_charge'] = ceil($data['harga_kamar'] * 0.05);
        $data['tax'] = ceil(($data['harga_kamar'] + $data['service_charge']) * 0.1);
        $data['total_harga'] = $data['harga_kamar'] + $data['service_charge'] + $data['tax'];

        $this->load->view('templates/header', $data);
        $this->load->view('booking/details', $data);
        $this->load->view('templates/footer');
    }

    public function bookingRoom()
    {
        $price_per_night = $this->input->post('price_per_night', true);
        $jumlah_malam = $this->input->post('jumlah_malam', true);

        $sub_total = $price_per_night * $jumlah_malam;
        $service = ceil($sub_total * 0.05);
        $tax = ceil(($sub_total + $service) * 0.1);
        $total_harga = $sub_total + $service + $tax;

        $data = [
            'id_customer' => htmlspecialchars($this->input->post('id_customer', true)),
            'id_kamar' => htmlspecialchars($this->input->post('id_kamar', true)),
            'id_pembayaran' => 1,
            'check_in' => htmlspecialchars($this->input->post('check_in', true)),
            'check_out' => htmlspecialchars($this->input->post('check_out', true)),
            'harga_kamar' => $price_per_night,
            'jumlah_malam' => $jumlah_malam,
            'service' => $service,
            'pajak' => $tax,
            'total_harga' => $total_harga
        ];

        $this->Booking_model->insertDataBooking($data);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Booking success. Thank you!</div>');

        redirect('user/bookings');
    }

    public function submit() {
        // You can access form data with $this->input->post('fieldname')
        // Example: $customer_id = $this->input->post('id_customer');
        // Add your booking logic here

        // For now, just redirect to a success page or show a message
        $this->session->set_flashdata('message', '<div class="alert alert-success">Booking submitted!</div>');
        redirect('booking/success');
    }

    public function success() {
        $this->load->view('booking/success');
    }
}
