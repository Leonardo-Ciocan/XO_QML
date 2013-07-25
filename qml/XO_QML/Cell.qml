import QtQuick 2.0
import "Game.js" as Game

Rectangle {
    id:root
    width: 200
    height: 200
    color:"white"
    border.width:1
    border.color: "black"
    Text{
        id:value
        text:chosen
        font.pointSize: 78
        anchors.centerIn: parent
        visible: true
    }

    property var changed : false
    property var chosen : ""
    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(!root.changed){
                chosen = ((Game.turn == 0) ? "X" : "O");
                anim.start();
                animateColor.to =(Game.turn==0) ? "Blue" :"Red";
                animateColor.start();
                root.changed=true;
                Game.turn = (Game.turn==0) ? 1 : 0;
                Game.checkWin();
            }
        }
    }

    NumberAnimation {
        id:anim
        target: root
        property: "opacity"
        duration: 1000
        easing.type: Easing.InOutQuad
        from:0
        to :1

    }

    PropertyAnimation {id: animateColor; target: value; properties: "color"; duration: 1000}

}
