TARGET = qterminal
TEMPLATE = app
# qt5 only. Please use cmake - it's an official build tool for this software
QT += widgets

CONFIG += link_pkgconfig \
          depend_includepath

# PKGCONFIG += qtermwidget5

DEFINES += STR_VERSION=\\\"0.7.0\\\"
DEFINES += BUNDLE_COLORSCHEMES

SOURCES += $$files(src/*.cpp)
HEADERS += $$files(src/*.h)

INCLUDEPATH += src
INCLUDEPATH += src/third-party
INCLUDEPATH += src/third-party/qtermwidget/

SOURCES += src/third-party/qxtglobalshortcut.cpp
HEADERS += src/third-party/qxtglobalshortcut.h
HEADERS += src/third-party/qxtglobalshortcut_p.h

SOURCES += src/third-party/qtermwidget/*.cpp
HEADERS += src/third-party/qtermwidget/*.h

win32 {
    SOURCES += src/third-party/qxtglobalshortcut_win.cpp
}

#unix:!macx {
#    SOURCES += src/third-party/qxtglobalshortcut_x11.cpp
#    LIBS += -L/usr/X11/lib -lX11
#    QT += x11extras
#}

macx: {
    SOURCES += src/third-party/qxtglobalshortcut_mac.cpp
}

RESOURCES += src/icons.qrc
RESOURCES += src/fonts.qrc
RESOURCES += src/colorschemes.qrc

FORMS += $$files(src/forms/*.ui)

unix {
    isEmpty(PREFIX) {
        PREFIX = /usr/local
    }
    BINDIR = $$PREFIX/bin

    INSTALLS += target shortcut
    target.path = $$BINDIR

    DATADIR = $$PREFIX/share
    shortcut.path = $$DATADIR/applications
    shortcut.files = qterminal.desktop
}

