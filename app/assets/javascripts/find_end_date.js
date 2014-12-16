$(document).ready(function(){
  $("#get-end-date").click(function(event){
    event.preventDefault();
    var date_enetred = $("#leave_request_date_from").val();
    var num_days = $("#leave_request_num_of_days").val();
    $.ajax({
      url: '/leave_requests/get_end_date',
      dataType: 'script',
      data: { date: date_enetred, days: num_days },
    })
  })
});
