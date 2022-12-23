var statusbar = new Panel
var statusbarScreen = statusbar.screen

statusbar.location = "top"
statusbar.height = 2 * Math.floor(gridUnit * 13 / 18)
statusbar.width = screenGeometry(statusbarScreen).width

statusbar.addWidget("org.kde.activeWindowControl")
statusbar.addWidget("org.kde.plasma.appmenu")
statusbar.addWidget("org.kde.plasma.panelspacer")
statusbar.addWidget("org.kde.plasma.marginsseparator")

/* Next up is determining whether to add the Input Method Panel
 * widget to the panel or not. This is done based on whether
 * the system locale's language id is a member of the following
 * white list of languages which are known to pull in one of
 * our supported IME backends when chosen during installation
 * of common distributions. */

var langIds = ["as",    // Assamese
               "bn",    // Bengali
               "bo",    // Tibetan
               "brx",   // Bodo
               "doi",   // Dogri
               "gu",    // Gujarati
               "hi",    // Hindi
               "ja",    // Japanese
               "kn",    // Kannada
               "ko",    // Korean
               "kok",   // Konkani
               "ks",    // Kashmiri
               "lep",   // Lepcha
               "mai",   // Maithili
               "ml",    // Malayalam
               "mni",   // Manipuri
               "mr",    // Marathi
               "ne",    // Nepali
               "or",    // Odia
               "pa",    // Punjabi
               "sa",    // Sanskrit
               "sat",   // Santali
               "sd",    // Sindhi
               "si",    // Sinhala
               "ta",    // Tamil
               "te",    // Telugu
               "th",    // Thai
               "ur",    // Urdu
               "vi",    // Vietnamese
               "zh_CN", // Simplified Chinese
               "zh_TW"] // Traditional Chinese

if (langIds.indexOf(languageId) != -1) {
    statusbar.addWidget("org.kde.plasma.kimpanel");
}

statusbar.addWidget("org.kde.plasma.colorpicker")
statusbar.addWidget("org.kde.plasma.systemtray")
statusbar.addWidget("org.kde.plasma.digitalclock")

var panel = new Panel
var panelScreen = panel.screen

panel.location = "left"
panel.offset=statusbar.height

panel.height = 2 * Math.floor(gridUnit * 2.5 / 2)
panel.width = screenGeometry(panelScreen).width

const maximumAspectRatio = 21/9;
if (panel.formFactor === "horizontal") {
    const geo = screenGeometry(panelScreen);
    const maximumWidth = Math.ceil(geo.height * maximumAspectRatio);

    if (geo.width > maximumWidth) {
        panel.alignment = "center";
        panel.minimumLength = maximumWidth - panel.offset;
        panel.maximumLength = maximumWidth - panel.offset;
    }
}

var kickoff = panel.addWidget("org.kde.plasma.kickerdash")
kickoff.currentConfigGroup = ["Shortcuts"]
kickoff.writeConfig("global", "Alt+F1")

panel.addWidget("org.kde.plasma.marginsseparator")
panel.addWidget("org.kde.plasma.icontasks")
panel.addWidget("org.kde.plasma.trash")
panel.addWidget("org.kde.paneltransparencybutton")
panel.addWidget("org.kde.plasma.panelspacer")
