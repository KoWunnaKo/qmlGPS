import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import qiuyuhan.org.MyGps 1.0
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
/*

*/
    MyGps{
        id:gps
        onUpdate:{
            lab.text=latitude.toString()+","+longtitude.toString();

        }//暴露信号的时候需要注意大小写
    }
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page{
            Label{
                id:lab
                text:"正在加载"
                anchors.centerIn: parent
                Component.onCompleted: {
                    gps.StartGPS();
                }
            }
        }
        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
}
