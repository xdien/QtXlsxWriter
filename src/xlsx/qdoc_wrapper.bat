@echo off
SetLocal EnableDelayedExpansion
(set QT_VERSION=0.3.0)
(set QT_VER=0.3)
(set QT_VERSION_TAG=030)
(set QT_INSTALL_DOCS=D:/Qt/Docs/Qt-5.15.2)
(set BUILDDIR=D:/nhansu/qtxlsx-qt6/src/xlsx)
D:\Qt\5.15.2\mingw81_32\bin\qdoc.exe %*
EndLocal
