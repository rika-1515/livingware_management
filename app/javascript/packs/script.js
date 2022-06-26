document.addEventListener("turbolinks:load", () => {
  $(function(){
    $('input[type="checkbox"]').on('change', function(){
      var vals = $('input[type="checkbox"]:checked').map(function(){
        return $(this).val();
      }).get();
      if (vals.length > 0) {
        $('#submit-btn').prop('disabled', false);
        $('#submit-btn').addClass('btn-stitch-green');
        $('#submit-btn').removeClass('btn-stitch-gray');
      }else{
        $('#submit-btn').prop('disabled', true);
        $('#submit-btn').addClass('btn-stitch-gray');
        $('#submit-btn').removeClass('btn-stitch-green');
      }
    });
  });

  $(function(){
    $('input[type="checkbox"]').on('change', function(){
      var vals = $('input[type="checkbox"]:checked').map(function(){
        return $(this).val();
      }).get();
      if (vals.length > 0) {
        $('#submit-btn2').prop('disabled', false);
        $('#submit-btn2').addClass('btn-stitch-orange');
        $('#submit-btn2').removeClass('btn-stitch-gray');
      }else{
        $('#submit-btn2').prop('disabled', true);
        $('#submit-btn2').addClass('btn-stitch-gray');
        $('#submit-btn2').removeClass('btn-stitch-orange');
      }
    });
  });

  $(function(){
    $('input[type="checkbox"]').on('change', function(){
      var vals = $('input[type="checkbox"]:checked').map(function(){
        return $(this).val();
      }).get();
      if (vals.length > 0) {
        $('#submit-btn3').prop('disabled', false);
        $('#submit-btn3').addClass('btn-stitch-green');
        $('#submit-btn3').removeClass('btn-stitch-gray');
      }else{
        $('#submit-btn3').prop('disabled', true);
        $('#submit-btn3').addClass('btn-stitch-gray');
        $('#submit-btn3').removeClass('btn-stitch-green');
      }
    });
  });

  $(function(){
    $('input[type="checkbox"]').on('change', function(){
      var vals = $('input[type="checkbox"]:checked').map(function(){
        return $(this).val();
      }).get();
      if (vals.length > 0) {
        $('#submit-btn4').prop('disabled', false);
        $('#submit-btn4').addClass('btn-stitch-orange');
        $('#submit-btn4').removeClass('btn-stitch-gray');
      }else{
        $('#submit-btn4').prop('disabled', true);
        $('#submit-btn4').addClass('btn-stitch-gray');
        $('#submit-btn4').removeClass('btn-stitch-orange');
      }
    });
  });
});