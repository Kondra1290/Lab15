#SPDX-FileCopyrightText: 2023 Open Mobile Platform LLC <edu@omp.ru>
#SPDX-License-Identifier: BSD-3-Clause

TARGET = ru.auroraos.DBusServices

CONFIG += \
    auroraapp \

PKGCONFIG += \

SOURCES += \
    myservice.cpp \
    src/main.cpp \

HEADERS += \
    myservice.h

DISTFILES += \
    rpm/ru.auroraos.DBusServices.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172
