<?php
class ModelTotalTimeLimitedDiscount extends Model {
	public function getTotal($total) {
		$this->load->language('total/time_limited_discount');

		$discountedTotal = $total['total'] * (float) $this->config->get('time_limited_discount_percentage');
		$reduced         = -($total['total'] - $discountedTotal);
		$total['total']  = $discountedTotal;

		$startDay = strtotime($this->config->get("time_limited_discount_start_day"));
		$endDay = strtotime($this->config->get("time_limited_discount_end_day"));
		$today = time();

		if(($startDay && $endDay) && $today > $startDay && $today < $endDay){
			$total['totals'][] = array(
				'code'       => 'time_limited_discount',
				'title'      => sprintf($this->language->get('text_time_limited_discount'), date('Y-m-d H:i', $startDay), date('Y-m-d H:i', $endDay)),
				'value'      => $reduced,
				'sort_order' => $this->config->get('time_limited_discount_sort_order')
			);	
		}
	}
}