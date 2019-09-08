import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
Slide 
{
        anchors.fill: parent

        Image {
            id: background
            source: "big-slide.svg"
            anchors.fill: parent
        
            Text {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -125
                font.pixelSize: parent.width *.025
                color: 'blue'
                text: qsTr("Install the system using the Btrfs format <br/>"+"and have daily restore points, making your system much more reliable.<br/>")
                wrapMode: Text.WordWrap
                width: 500
                horizontalAlignment: Text.AlignLeft
            }
        }
}   
Slide 
{
        anchors.fill: parent

        Image {
            id: background1
            source: "big-slide2.svg"
            anchors.fill: parent
        
            Text {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -125
                font.pixelSize: parent.width *.015
                color: 'white'
                text: qsTr("We offer 3 desktop options,<br/>"+"at the login screen you can switch between classic KDE, modern or LXQt.<br/>")
                wrapMode: Text.WordWrap
                width: 500
                horizontalAlignment: Text.AlignLeft
            }
        }
}   
Slide 
{
        anchors.fill: parent

        Image {
            id: background2
            source: "big-slide3.svg"
            anchors.fill: parent
        
            Text {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -125
                font.pixelSize: parent.width *.015
                color: 'white'
                text: qsTr("Our app store supports 3 different program formats: deb, snap and flatpak.<br/>")
                wrapMode: Text.WordWrap
                width: 500
                horizontalAlignment: Text.AlignLeft
        }
    }
}   
Slide 
{
        anchors.fill: parent

        Image {
            id: background3
            source: "big-slide4.svg"
            anchors.fill: parent
        
            Text {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -125
                font.pixelSize: parent.width *.015
                color: 'white'
                text: qsTr("Our Office Suite has a new look <br/>"+"and a new text correction, which is much smarter.<br/>")
                wrapMode: Text.WordWrap
                width: 500
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}
