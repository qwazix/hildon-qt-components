import QtQuick 1.0
import "." 1.0

Dialog {
    id: root

    property alias folder: folderModel.folder
    property alias showDirs: folderModel.showDirs
    property bool showFiles: true
    property variant nameFilters: ["*.*"]
    property alias acceptButtonText: acceptButton.text
    property bool allowNewFolders: false

    signal fileChosen(string filePath)

    function __newFolder(name) {
        folderModel.newFolder(name);
        textField.visible = false;
    }

    titleText: qsTr("File browser")
    content: Item {
        anchors.fill: parent

        Flow {
            id: flow

            anchors { top: parent.top; left: parent.left; right: parent.right }
            spacing: 10

            Button {
                id: backButton

                width: 70
                platformIconId: "filemanager_folder_up"
                enabled: folderModel.folder.toString() !== "file:///"
                onClicked: folderModel.folder = folderModel.parentFolder
            }

            Button {
                id: newButton

                width: 70
                platformIconId: "general_add_folder"
                visible: root.allowNewFolders
                onClicked: textField.visible = !textField.visible
            }

            TextField {
                id: textField

                visible: false
                placeholderText: qsTr("Folder name")
                validator: RegExpValidator {
                    regExp: /[^\"'@&~=\\/:?#!|<>*^]+/
                }

                onVisibleChanged: {
                    if (!visible) {
                        text = "";
                        fileList.forceActiveFocus();
                    }
                }
                Keys.onReturnPressed: if (acceptableInput) root.__newFolder(text);
                Keys.onEnterPressed: if (acceptableInput) root.__newFolder(text);
            }

            Button {
                id: submitButton

                width: 70
                platformIconId: "widgets_tickmark_list"
                enabled: textField.acceptableInput
                visible: textField.visible
                onClicked: root.__newFolder(textField.text)
            }

            Label {
                id: fileLabel

                height: backButton.height
                text: root.folder.toString().slice(7)
                verticalAlignment: Text.AlignVCenter
            }
        }

        FilterListView {
            id: fileList

            onFilterTextChanged: folderModel.query = filterText
            anchors { top: flow.bottom; topMargin: platformStyle.paddingNormal; bottom: parent.bottom; left: parent.left; right: parent.right }
            clip: true
            model: FileSystemModel {
                id: folderModel

                folder: "/"
                showDirs: root.showDirs
                showDirsFirst: true
                showDotAndDotDot: false
                nameFilters: !root.showFiles ? ["*.no_files"] : root.nameFilters
                onFolderChanged: fileList.filterText = ""
            }
            delegate: FileBrowserDelegate {
                onClicked: fileIsDir ? folderModel.folder = filePath : root.fileChosen(filePath)
            }

            ScrollDecorator {
                flickableItem: fileList
            }
        }        
    }

    buttons: DialogButton {
        id: acceptButton

        visible: text != ""
        onClicked: root.accept()
    }

    onFileChosen: root.accept()
}
