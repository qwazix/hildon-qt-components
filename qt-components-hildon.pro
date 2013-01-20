TEMPLATE = lib
TARGET = $$qtLibraryTarget(hildonplugin)
#TARGETPATH = org/hildon/components
#INCLUDEPATH += $$PWD/qml $$PWD/src

QT += declarative
CONFIG += qt plugin copy_native install_native mobility
MOBILITY += systeminfo

qml_files.files += $$files(qml/*)
qml_files.path = /opt/lib/qt4/imports/org/hildon/components
target.path = /opt/lib/qt4/imports/org/hildon/components

OTHER_FILES += qtc_packaging/debian_fremantle/rules \
    qtc_packaging/debian_fremantle/README \
    qtc_packaging/debian_fremantle/copyright \
    qtc_packaging/debian_fremantle/control \
    qtc_packaging/debian_fremantle/compat \
    qtc_packaging/debian_fremantle/changelog \
    qtc_packaging/debian_fremantle/postinst \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog

SOURCES += src/fileinfothread.cpp \
    src/filesystemmodel.cpp \
    src/hildonimageprovider.cpp \
    src/hildonscreenplugin.cpp \
    src/hildonsystemplugin.cpp \
    src/hildonthemeplugin.cpp \
    src/maskeditem.cpp \
    src/maskeffect.cpp \
    src/plugin.cpp \
    src/effects.cpp \
    src/hildonwindowplugin.cpp \
    src/qdeclarativefolderlistmodel.cpp

HEADERS += src/fileinfothread_p.h \
    src/fileproperty_p.h \
    src/filesystemmodel.h \
    src/hildonimageprovider.h \
    src/hildonscreenplugin.h \
    src/hildonsystemplugin.h \
    src/hildonthemeplugin.h \
    src/maskeditem.h \
    src/maskeffect.h \
    src/effects.h \
    src/hildonenums.h \
    src/hildonwindowplugin.h \
    src/qdeclarativefolderlistmodel.h \
    src/plugin.h

INSTALLS += target qml_files

