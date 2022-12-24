import QtQuick 2.5
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    color: "black"
    Item{
        anchors.fill: parent
        id: background
        Image {
            id: background_image
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "images/rectangle.svg"
            visible: false
            smooth: false
        }
        BrightnessContrast {
            id: background_contrast
            anchors.fill: background_image
            source: background_image
            brightness: -0.5
            contrast: 0
        }
        FastBlur {
            anchors.fill: background_contrast
            source: background_contrast
            radius: 32
        }
    }

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            anchors.centerIn: parent
            source: "images/splash.svg"
        }

        Item {
            id: progressbar
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - units.gridUnit * 6
            width: parent.width
            Rectangle{
                id: border
                width: parent.width
                height: units.gridUnit * 0.6
                color: "#1b1e20"
            }

            Rectangle{
                id: progress
                height: border.height
                color: "#3daee9"
                width: border.width / 6 * (stage)
                Behavior on width {
                    PropertyAnimation {
                        duration: 1500
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
