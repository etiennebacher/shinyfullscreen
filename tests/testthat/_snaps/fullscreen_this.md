# fullscreen_this produces the right JS

    Code
      x
    Output
      [1] "<div class=\"shiny-plot-output html-fill-item\" id=\"plot\" style=\"width:100%;height:400px;\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#plot').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; }</style><style>::backdrop { background-color:\", bg_color, \"; }</style>"

# argument click_id works

    Code
      x
    Output
      [1] "<div class=\"shiny-plot-output html-fill-item\" id=\"plot\" style=\"width:100%;height:400px;\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#other_id').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; }</style><style>::backdrop { background-color:\", bg_color, \"; }</style>"

# argument bg_color works

    Code
      x
    Output
      [1] "<div class=\"shiny-plot-output html-fill-item\" id=\"plot\" style=\"width:100%;height:400px;\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#plot').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; }</style><style>::backdrop { background-color:\", bg_color, \"; }</style>"

