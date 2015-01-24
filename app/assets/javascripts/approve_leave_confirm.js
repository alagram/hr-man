$(document).ready(function(){
  $(".approve_leave_btn").click(function(){
    var leave_id = $(this).val();
    $('#approve_leave_modal').modal('show');
    $("#approve_leave_yes").click(function(){
      $.ajax({
        url: '/approve_leave',
        type: 'POST',
        dataType: 'script',
        data: { leave_request_id: leave_id }
      })
    })
  })
})
