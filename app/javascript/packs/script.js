$(function(){
  $('input[type="checkbox"]').on('change', function(){
    /// チェックされたvalue値を配列として取得
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
    /// チェックされたvalue値を配列として取得
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