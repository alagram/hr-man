$(document).ready(function(){
  $("#date_month").change(function(){
    monthSelected = $("#date_month :selected").val();
    if (monthSelected === "") {
      return;
    }
    else {
      $.ajax({
        url: '/calendar_view',
        dataType: 'script',
        data: { month_selected: monthSelected },
      })
    }
  })
})
