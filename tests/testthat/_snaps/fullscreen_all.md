# fullscreen_all produces the right JS

    [1] "<script> $(function () { if (!screenfull.isEnabled) { return false; } $('#&lt;button id=\"click\" type=\"button\" class=\"btn btn-default action-button\"&gt;Click&lt;/button&gt;').click(function () { screenfull.request(); }); });</script><style>::backdrop { background-color:#fff; }</style>"

# argument bg_color works

    [1] "<script> $(function () { if (!screenfull.isEnabled) { return false; } $('#&lt;button id=\"click\" type=\"button\" class=\"btn btn-default action-button\"&gt;Click&lt;/button&gt;').click(function () { screenfull.request(); }); });</script><style>::backdrop { background-color:pink; }</style>"

