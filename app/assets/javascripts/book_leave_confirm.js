$(document).ready(function(){
  $(".book_leave_btn").click(function(){
    var leave_id = $(this).val();
    $("#confirm_modal").modal('show');
    $("#book_leave_yes").click(function(){
      $.ajax({
        url: '/book_leave',
        type: 'POST',
        dataType: 'script',
        data: { leave_request_id: leave_id },
      })
    })
  })
})
