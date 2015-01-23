$(document).ready(function(){
  $('.reject_leave_btn').click(function(){
    var leave_id = $(this).val();

    $("#reject_leave_modal").modal('show');
    $("#reject_leave_yes").click(function(){
      $.ajax({
        url: '/reject_leave',
        type: 'POST',
        dataType: 'script',
        data: { leave_request_id: leave_id },
      })
    })
  })
})
