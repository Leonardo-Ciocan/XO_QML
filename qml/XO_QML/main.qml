import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import "Game.js" as Game

Rectangle {

    width: 600
    height: 600

    Item{
        id:root
    }

    Rectangle {
        id: wonSheet
        x: 0
        y: 0
        width: 600
        height: 600
        color: "#ffffff"
        scale:0

        Text {
            id: text1
            x: 99
            y: 22
            text: qsTr("You won")
            font.family: "Pointfree"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 80
        }

        Button {
            id: button1
            x: 175
            y: 420
            width: 250
            height: 117
            text: "Play again?"
            scale: 1
            onClicked:{
                Game.DestroyGameBoard();
                Game.init(root,won);
                restartAnimation.start();
            }
        }
    }

    Component.onCompleted: {
        Game.init(root , won);
        Application.setName("Hello world");
    }

    function won(){
        winAnimation.start();
    }

    SequentialAnimation{
        id:winAnimation
        NumberAnimation { id:hideRoot; target: root; property: "scale"; duration: 300; easing.type: Easing.InOutQuad ; from:1 ; to :0 ;}
        NumberAnimation { id:showWon; target: wonSheet; property: "scale"; duration: 300; easing.type: Easing.InOutQuad ; from:0 ; to :1 }
    }

    SequentialAnimation{
        id:restartAnimation
        NumberAnimation {  target: root; property: "scale"; duration: 300; easing.type: Easing.InOutQuad ; from:0 ; to :1 ;}
        NumberAnimation {  target: wonSheet; property: "scale"; duration: 300; easing.type: Easing.InOutQuad ; from:1 ; to :0 }
    }


}
