var panel = new Panel
panel.location = "bottom"
panel.height = 2 * Math.floor(gridUnit * 2.9 / 2)
panel.hiding = "windowscover"
panel.minimumLength = 2 * Math.floor(gridUnit * 4)
panel.alignment = "center"
panel.offset = 0

panel.addWidget("org.kde.plasma.onzemenu")
panel.addWidget("org.kde.plasma.icontasks")
panel.addWidget("org.kde.plasma.trash")
panel.addWidget("org.kde.paneltransparencybutton")

var statusbar = new Panel
var statusbarScreen = statusbar.screen

statusbar.location = "top"
statusbar.height = 2 * Math.floor(gridUnit * 13 / 18)
statusbar.width = screenGeometry(statusbarScreen).width

statusbar.addWidget("org.kde.activeWindowControl")
statusbar.addWidget("org.kde.plasma.appmenu")
statusbar.addWidget("org.kde.plasma.panelspacer")
statusbar.addWidget("org.kde.plasma.colorpicker")
statusbar.addWidget("org.kde.plasma.systemtray")
statusbar.addWidget("org.kde.plasma.digitalclock")
