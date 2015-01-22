$(document).ready(function(){
  $(":button").click(function(){
    var leave_id = $(this).val();
    $("#confirm_modal").modal('show');
    $("#leave_approval_yes").click(function(){
      $.ajax({
        url: '/book_leave',
        type: 'POST',
        dataType: 'script',
        data: { leave_request_id: leave_id },
      })
    })
  })
})
