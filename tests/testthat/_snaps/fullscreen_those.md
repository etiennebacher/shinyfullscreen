# fullscreen_those works with 1 item

    Code
      x
    Output
      [1] "<script> var ids = [\"#plot\"]; $(ids.join(',')).click(function () { screenfull.request(this); });</script><style>##plot{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; }</style><style>::backdrop { background-color:\", bg_color, \"; }</style>"

# fullscreen_those works with several items

    Code
      x
    Output
      [1] "<script> var ids = [\"#plot\",\"#plot2\"]; $(ids.join(',')).click(function () { screenfull.request(this); });</script><style>##plot, #plot2{ cursor: -webkit-zoom-in; cursor: -moz-zoom-in; }</style><style>::backdrop { background-color:\", bg_color, \"; }</style>"

