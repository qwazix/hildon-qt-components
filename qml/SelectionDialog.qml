import QtQuick 1.0
import "." 1.0

Dialog {
    id: root

    property Style platformStyle: SelectionDialogStyle {}
    property alias model: list.model
    property Component delegate: defaultDelegate
    property int selectedIndex: -1

    height: Math.min(screen.height - 120, list.count * platformStyle.delegateHeight + 80)
    content: Item {
        anchors.fill: parent

        ListView {
            id: list

            anchors.fill: parent
            delegate: root.delegate
            currentIndex: root.selectedIndex
        }

        ScrollDecorator {
            flickableItem: list
        }
    }

    Component {
        id: defaultDelegate

        SelectionDelegate {
            height: platformStyle.delegateHeight
            text: name
            onClicked: {
                root.selectedIndex = index;
                root.accept();
            }
        }
    }
}
