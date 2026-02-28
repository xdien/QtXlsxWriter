TARGET = QtXlsx

QMAKE_DOCS = $$PWD/doc/qtxlsx.qdocconf

TEMPLATE = lib
CONFIG += shared
CONFIG += build_xlsx_lib c++17
DEFINES += QT_BUILD_XLSX_LIB
CONFIG -= create_cmake
include(qtxlsx.pri)

#Define this macro if you want to run tests, so more AIPs will get exported.
#DEFINES += XLSX_TEST

Q_XLSX_HEADERS = \
    xlsxabstractooxmlfile.h \
    xlsxabstractsheet.h \
    xlsxcell.h \
    xlsxcellformula.h \
    xlsxcellrange.h \
    xlsxcellreference.h \
    xlsxchart.h \
    xlsxchartsheet.h \
    xlsxconditionalformatting.h \
    xlsxdatavalidation.h \
    xlsxdocument.h \
    xlsxformat.h \
    xlsxglobal.h \
    xlsxrichstring.h \
    xlsxworkbook.h \
    xlsxworksheet.h

target.path = $$[QT_INSTALL_LIBS]
header.path = $$[QT_INSTALL_HEADERS]/QtXlsx
header.files = $$Q_XLSX_HEADERS QtXlsx

modules.path = $$[QT_HOST_DATA]/mkspecs/modules
modules.files = qt_lib_xlsx.pri

INSTALLS += target header modules

# Special rule for windows DLL
win32: {
    dlltarget.path = $$[QT_INSTALL_BINS]
    INSTALLS += dlltarget
}

QMAKE_TARGET_COMPANY = "Debao Zhang"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) 2013-2014 Debao Zhang <hello@debao.me>"
QMAKE_TARGET_DESCRIPTION = ".Xlsx file writer for Qt5/Qt6"
