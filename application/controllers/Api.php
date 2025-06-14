<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model('Auth_model');
        $this->load->model('Rooms_model');
        $this->load->model('Booking_model');
        
        // API authentication check
        if (!$this->session->userdata('logged_in')) {
            $this->output->set_status_header(401);
            echo json_encode(['error' => 'Unauthorized']);
            exit;
        }
    }

    // GET /api/rooms
    public function rooms() {
        $method = $this->input->method();
        
        switch($method) {
            case 'get':
                $rooms = $this->Rooms_model->getAllRooms();
                $this->output->set_content_type('application/json');
                echo json_encode($rooms);
                break;
                
            case 'post':
                $data = json_decode($this->input->raw_input_stream, true);
                if ($this->Rooms_model->addRoom($data)) {
                    $this->output->set_status_header(201);
                    echo json_encode(['message' => 'Room created successfully']);
                } else {
                    $this->output->set_status_header(400);
                    echo json_encode(['error' => 'Failed to create room']);
                }
                break;
                
            default:
                $this->output->set_status_header(405);
                echo json_encode(['error' => 'Method not allowed']);
                break;
        }
    }

    // GET /api/rooms/{id}
    public function room($id = NULL) {
        if ($id === NULL) {
            $this->output->set_status_header(400);
            echo json_encode(['error' => 'Room ID is required']);
            return;
        }

        $method = $this->input->method();
        
        switch($method) {
            case 'get':
                $room = $this->Rooms_model->getRoomById($id);
                if ($room) {
                    $this->output->set_content_type('application/json');
                    echo json_encode($room);
                } else {
                    $this->output->set_status_header(404);
                    echo json_encode(['error' => 'Room not found']);
                }
                break;
                
            case 'put':
                $data = json_decode($this->input->raw_input_stream, true);
                if ($this->Rooms_model->updateRoom($id, $data)) {
                    echo json_encode(['message' => 'Room updated successfully']);
                } else {
                    $this->output->set_status_header(400);
                    echo json_encode(['error' => 'Failed to update room']);
                }
                break;
                
            case 'delete':
                if ($this->Rooms_model->deleteRoom($id)) {
                    echo json_encode(['message' => 'Room deleted successfully']);
                } else {
                    $this->output->set_status_header(400);
                    echo json_encode(['error' => 'Failed to delete room']);
                }
                break;
                
            default:
                $this->output->set_status_header(405);
                echo json_encode(['error' => 'Method not allowed']);
                break;
        }
    }

    // GET /api/bookings
    public function bookings() {
        $method = $this->input->method();
        
        switch($method) {
            case 'get':
                $bookings = $this->Booking_model->getAllBookings();
                $this->output->set_content_type('application/json');
                echo json_encode($bookings);
                break;
                
            case 'post':
                $data = json_decode($this->input->raw_input_stream, true);
                if ($this->Booking_model->createBooking($data)) {
                    $this->output->set_status_header(201);
                    echo json_encode(['message' => 'Booking created successfully']);
                } else {
                    $this->output->set_status_header(400);
                    echo json_encode(['error' => 'Failed to create booking']);
                }
                break;
                
            default:
                $this->output->set_status_header(405);
                echo json_encode(['error' => 'Method not allowed']);
                break;
        }
    }

    // GET /api/bookings/{id}
    public function booking($id = NULL) {
        if ($id === NULL) {
            $this->output->set_status_header(400);
            echo json_encode(['error' => 'Booking ID is required']);
            return;
        }

        $method = $this->input->method();
        
        switch($method) {
            case 'get':
                $booking = $this->Booking_model->getBookingById($id);
                if ($booking) {
                    $this->output->set_content_type('application/json');
                    echo json_encode($booking);
                } else {
                    $this->output->set_status_header(404);
                    echo json_encode(['error' => 'Booking not found']);
                }
                break;
                
            case 'put':
                $data = json_decode($this->input->raw_input_stream, true);
                if ($this->Booking_model->updateBooking($id, $data)) {
                    echo json_encode(['message' => 'Booking updated successfully']);
                } else {
                    $this->output->set_status_header(400);
                    echo json_encode(['error' => 'Failed to update booking']);
                }
                break;
                
            case 'delete':
                if ($this->Booking_model->deleteBooking($id)) {
                    echo json_encode(['message' => 'Booking deleted successfully']);
                } else {
                    $this->output->set_status_header(400);
                    echo json_encode(['error' => 'Failed to delete booking']);
                }
                break;
                
            default:
                $this->output->set_status_header(405);
                echo json_encode(['error' => 'Method not allowed']);
                break;
        }
    }
} 