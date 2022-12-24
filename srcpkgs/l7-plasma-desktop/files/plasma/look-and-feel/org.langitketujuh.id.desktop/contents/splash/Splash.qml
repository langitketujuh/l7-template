/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }
    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height /3
        source: "images/rectangle.svg"

        Image {
            id: logo
            source: "images/splash.svg"
            anchors.centerIn: parent
        }

        Rectangle {
            radius: 5
            color: "#1b1e20"
            anchors {
                bottom: parent.bottom
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            height: 6
            width: height*40

            Rectangle {
                radius: 3
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 6) * (stage)
                color: "#3daee9"
                Behavior on width {
                    PropertyAnimation {
                        duration: 1500
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false
        ParallelAnimation {
            PropertyAnimation {
                property: "opacity"
                target: topRect
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "opacity"
                target: bottomRect
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
