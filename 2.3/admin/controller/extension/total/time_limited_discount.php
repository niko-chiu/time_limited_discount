<?php
class ControllerTotalTimeLimitedDiscount extends Controller{
    public function index(){
        $this->load->language('total/time_limited_discount');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
            $this->model_setting_setting->editSetting('time_limited_discount', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/total', 'token='.$this->session->data['token'], true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit']     = $this->language->get('text_edit');
		$data['text_enabled']  = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status']     = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_start_day']  = $this->language->get('entry_start_day');
        $data['entry_end_day']    = $this->language->get('entry_end_day');
        $data['entry_percentage']    = $this->language->get('entry_percentage');

        $data['button_save']   = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_total'),
			'href' => $this->url->link('extension/total', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('total/time_limited_discount', 'token=' . $this->session->data['token'], true)
		);

        $data['action'] = $this->url->link('total/time_limited_discount', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], true);

        $data['time_limited_discount_status']     = isset($this->request->post['time_limited_discount_status']) ? $this->$data['time_limited_discount_status'] : $this->config->get('time_limited_discount_status');
        $data['time_limited_discount_sort_order'] = isset($this->request->post['time_limited_discount_sort_order']) ? $this->data['time_limited_discount_sort_order'] : $this->config->get('time_limited_discount_sort_order');
        $data['time_limited_discount_start_day']  = isset($this->request->post['time_limited_discount_start_day']) ? $this->data['time_limited_discount_start_day'] : $this->config->get('time_limited_discount_start_day');
        $data['time_limited_discount_end_day']    = isset($this->request->post['time_limited_discount_end_day']) ? $this->data['time_limited_discount_end_day'] : $this->config->get('time_limited_discount_end_day');
        $data['time_limited_discount_percentage'] = isset($this->request->post['time_limited_discount_percentage']) ? $this->data['time_limited_discount_percentage'] : $this->config->get("time_limited_discount_percentage");

        $data['header']       = $this->load->controller('common/header');
		$data['column_left']  = $this->load->controller('common/column_left');
		$data['footer']       = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('total/time_limited_discount', $data));
    }

    protected function validate(){
        if (!$this->user->hasPermission('modify', 'total/time_limited_discount')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
    }
}