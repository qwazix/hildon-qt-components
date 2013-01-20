import QtQuick 1.0

ListItem {
    id: root

    height: 60

    Image {
        id: icon

        anchors { left: parent.left; leftMargin: platformStyle.paddingNormal; verticalCenter: parent.verticalCenter }
        source: fileIsDir ? "image://theme/icon/general_folder" : "image://theme/icon/general_video_file"
    }

    Label {
        anchors { left: icon.right; leftMargin: platformStyle.paddingNormal; right: parent.right; rightMargin: platformStyle.paddingNormal; verticalCenter: parent.verticalCenter }
        elide: platformStyle.elideMode
        clip: true
        text: !fileName ? "" : fileName
    }
}
