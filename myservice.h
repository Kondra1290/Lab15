#ifndef MYSERVICE_H
#define MYSERVICE_H

#include <QObject>

class MyService : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("D-Bus Interface", "com.example.MyService")
public:
    explicit MyService(QObject *parent = nullptr);

public slots:
    QString Hello(const QString &name);
};

#endif // MYSERVICE_H
