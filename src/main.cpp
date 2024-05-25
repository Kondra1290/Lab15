// SPDX-FileCopyrightText: 2023 Open Mobile Platform LLC <edu@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause

#include <auroraapp.h>
#include "myservice.h"
#include <QtQuick>
#include <QtDBus/QtDBus>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.auroraos"));
    application->setApplicationName(QStringLiteral("DBusServices"));

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/DBusServices.qml")));
    view->show();
    /*
    MyService myService;

       QDBusConnection connection = QDBusConnection::sessionBus();
       if (!connection.registerService("com.example.MyService")) {
           qFatal("Could not register service on D-Bus");
           return 1;
       }

       if (!connection.registerObject("/com/example/MyService", &myService, QDBusConnection::ExportAllSlots)) {
           qFatal("Could not register object on D-Bus");
           return 1;
       }
    */
    return application->exec();
}
