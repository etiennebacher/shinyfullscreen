# fullscreen_this produces the right JS

    [1] "<div id=\"plot\" class=\"shiny-plot-output\" style=\"width: 100% ; height: 400px\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#plot').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; } ::backdrop { background-color:#fff; }</style>"

# argument click_id works

    [1] "<div id=\"plot\" class=\"shiny-plot-output\" style=\"width: 100% ; height: 400px\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#other_id').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; } ::backdrop { background-color:#fff; }</style>"

# argument bg_color works

    [1] "<div id=\"plot\" class=\"shiny-plot-output\" style=\"width: 100% ; height: 400px\"></div><script> $(function () { if (!screenfull.isEnabled) { return false; } $('#plot').click(function () { screenfull.request($('#plot')[0]); }); });</script><style>#plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; } ::backdrop { background-color:pink; }</style>"

