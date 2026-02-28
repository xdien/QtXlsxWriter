TARGET = QtXlsx

QMAKE_DOCS = $$PWD/doc/qtxlsx.qdocconf

load(qt_module)

CONFIG += build_xlsx_lib c++17
CONFIG -= create_cmake
include(qtxlsx.pri)

#Define this macro if you want to run tests, so more AIPs will get exported.
#DEFINES += XLSX_TEST

QMAKE_TARGET_COMPANY = "Debao Zhang"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) 2013-2014 Debao Zhang <hello@debao.me>"
QMAKE_TARGET_DESCRIPTION = ".Xlsx file writer for Qt5/Qt6"
