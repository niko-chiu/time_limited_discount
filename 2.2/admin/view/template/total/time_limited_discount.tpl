<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-sale" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-sale" class="form-horizontal">
          <!-- status -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-3">
              <select name="time_limited_discount_status" id="input-status" class="form-control">
                <?php if ($time_limited_discount_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

          <!-- start day -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-start-day"><?php echo $entry_start_day; ?></label>
            <div class="col-sm-3">
              <div class="input-group datetime">
                <input type="text" name="time_limited_discount_start_day" value="<?php echo $time_limited_discount_start_day; ?>" placeholder="<?php echo $entry_start_day; ?>" data-date-format="YYYY-MM-DD HH:mm:ss" id="input-start-day" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button">
                  <i class="fa fa-calendar"></i>
                </button>
              </span>
              </div>
            </div>
          </div>

          <!-- end day -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-end-day"><?php echo $entry_end_day; ?></label>
            <div class="col-sm-3">
              <div class="input-group datetime">
                <input type="text" name="time_limited_discount_end_day" value="<?php echo $time_limited_discount_end_day; ?>" placeholder="<?php echo $entry_end_day; ?>" data-date-format="YYYY-MM-DD HH:mm:ss" id="input-end-day" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button">
                  <i class="fa fa-calendar"></i>
                </button>
              </span>
              </div>
            </div>
          </div>

          <!-- sale percentage -->
          <div class="form-group">
            <label for="input-percentage" class="col-sm-2 control-label"><?php echo $entry_percentage; ?></label>
            <div class="col-sm-3">
              <input type="number" step="0.01" max="1" min="0" name="time_limited_discount_percentage" value="<?php echo $time_limited_discount_percentage ? $time_limited_discount_percentage : "1.0"; ?>" placeholder="<?php echo $entry_percentage; ?>" id="input-percentage" class="form-control" />
            </div>
          </div>

          <!-- order -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-3">
              <input type="text" name="time_limited_discount_sort_order" value="<?php echo $time_limited_discount_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
		$('.datetime').datetimepicker({
			pickDate: true,
			pickTime: true,
      icons: {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-arrow-up",
        down: "fa fa-arrow-down"
      },
      inline: true,
      sideBySide: true
		});

    $("#input-percentage").change(function(){
      if($(this).val() > 1.0)
        $(this).val(1.0);
      
      if($(this).val() < 0.0)
        $(this).val(0.0);
    });
</script>

<?php echo $footer; ?>