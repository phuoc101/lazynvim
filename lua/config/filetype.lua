local ft = require("vim.filetype")

ft.add({
  extension = {
    -- ROS filetypes
    launch = "xml",
    sdf = "xml",
    jinja = "xml",
    xacro = "xml",
    rviz = "yaml",
    msg = "conf",
    srv = "conf",
    -- default tex flavor
    tex = "tex",
  },
})
