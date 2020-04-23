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
            source: "00.jpg"
            anchors.fill: parent
        
        }
}   
Slide 
{
        anchors.fill: parent

        Image {
            id: background1
            source: "01.jpg"
            anchors.fill: parent
        
        }
}   
Slide 
{
        anchors.fill: parent

        Image {
            id: background2
            source: "02.jpg"
            anchors.fill: parent
        
    }
}   
Slide 
{
        anchors.fill: parent

        Image {
            id: background3
            source: "03.jpg"
            anchors.fill: parent
        
        }
    }

Slide 
{
        anchors.fill: parent

        Image {
            id: background4
            source: "04.jpg"
            anchors.fill: parent
        
    }
}   


Slide 
{
        anchors.fill: parent

        Image {
            id: background5
            source: "05.jpg"
            anchors.fill: parent
        
    }
}   


Slide 
{
        anchors.fill: parent

        Image {
            id: background6
            source: "06.jpg"
            anchors.fill: parent
        
    }
}   


Slide 
{
        anchors.fill: parent

        Image {
            id: background7
            source: "07.jpg"
            anchors.fill: parent
        
    }
}   

    
    
}
