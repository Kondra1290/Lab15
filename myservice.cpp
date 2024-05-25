#include "myservice.h"

MyService::MyService(QObject *parent) : QObject(parent)
{

}

QString MyService::Hello(const QString &name)
{
    return QString("Hello, %1!").arg(name);
}
