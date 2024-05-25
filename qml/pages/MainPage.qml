// SPDX-FileCopyrightText: 2023 Open Mobile Platform LLC <edu@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause

import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.DBus 2.0

Page {
    objectName: "MainPage"

    Column{
        objectName: "layout"
        anchors.fill: parent

        PageHeader {
            id: header
            objectName: "header"
            title: "D-Bus Services"
        }

        BackgroundItem{
            objectName: "settingsItem"

            DBusInterface {
                id: settingsInterface
                objectName: "settingsInterface"
                service: 'com.jolla.settings'
                path: '/com/jolla/settings/ui'
                iface: 'com.jolla.settings.ui'
            }

            Label{
                objectName: "settingsLabel"
                anchors.centerIn: parent
                text: "Show settings"
            }

            onClicked: settingsInterface.call('showSettings', undefined)
        }

        BackgroundItem{
            objectName: "profileItem"

            DBusInterface {
                id: profileInterface
                objectName: "profileInterface"
                service: "com.nokia.profiled"
                path: "/com/nokia/profiled"
                iface: "com.nokia.profiled"
            }

            Label {
                objectName: "profileLabel"
                anchors.centerIn: parent
                text: "Set silent mode"
            }

            onClicked: profileInterface.call("set_profile", ["silent"]);
        }

        BackgroundItem{
            objectName: "pulseAudioItem"

            DBusInterface {
                id: pulseAudioInterface
                objectName: "pulseAudioInterface"
                service: "org.PulseAudio1"
                path: "/org/pulseaudio/server_lookup1"
                iface: "org.PulseAudio.ServerLookup1"
            }

            Label {
                objectName: "pulseAudioLabel"
                anchors.centerIn: parent
                text: "Get PulseAudio address"
            }

            onClicked: {
                // unix:path=/run/user/100000/pulse/dbus-socket
                var address = pulseAudioInterface.getProperty("Address")
                console.log(address)
            }
        }

        BackgroundItem{
            objectName: "profileItem"

            DBusInterface {
                id: profileInterface1
                objectName: "profileInterface"
                service: "com.nokia.profiled"
                path: "/com/nokia/profiled"
                iface: "com.nokia.profiled"
            }

            Label {
                objectName: "profileLabel"
                anchors.centerIn: parent
                text: "Get profils"
            }

            onClicked: profileInterface1.typedCall("get_profile", [], function(result){
               console.log(result)
            });
        }

        BackgroundItem{
            objectName: "profileItem"

            DBusInterface {
                id: profileInterface2
                objectName: "profileInterface"
                service: "com.nokia.profiled"
                path: "/com/nokia/profiled"
                iface: "com.nokia.profiled"
            }

            Label {
                objectName: "profileLabel"
                anchors.centerIn: parent
                text: "Set outdors"
            }

            onClicked: profileInterface2.call("set_profile", ["outdoors"]);
        }

        /*
        BackgroundItem{
            objectName: "appItem"

            DBusInterface {
                id: settingsInterface2
                objectName: "settingsInterface"
                service: 'com.jolla.settings'
                path: '/com/jolla/settings/ui'
                iface: 'com.jolla.settings.ui'
            }

            Label{
                objectName: "settingsLabel"
                anchors.centerIn: parent
                text: "Show Apps"
            }

            onClicked: settingsInterface2.call('showAccounts', undefined)
        }


            TextField {
                id: firstNumField
            }
            TextField {
                id: secondNumField
            }
            BackgroundItem{
                objectName: "laba13Item2"
                DBusInterface {
                    id: laba13Interface2
                    objectName: "laba13Interface2"
                    service: 'ru.auroraos.laba13'
                    path: '/ru/auroraos/laba13'
                    iface: 'ru.auroraos.laba13'
                }

                Label{
                    objectName: "laba13Label"
                    anchors.centerIn: parent
                    text: "Slozh laba13"
                }
                onClicked: laba13Interface.call('shura', [parseInt(firstNumField.text), parseInt(secondNumField.text)])

            }
        */


    /*

        TextField {
            id: firstNumField
        }
        TextField {
            id: secondNumField
        }

        BackgroundItem
        {
            objectName: "laba15Item"
            DBusInterface {
                id: laba13Interface
                objectName: "laba13Interface"

                signalsEnabled: true

                service: 'ru.auroraos.calc13'
                path: '/ru/auroraos/calc13'
                iface: 'ru.auroraos.calc13'
            }

            Label{
                objectName: "laba13Label"
                anchors.centerIn: parent
                text: "Laba13"
            }
            onClicked: {
                //laba13Interface.call('someaction', [parseInt(firstNumField.text), parseInt(secondNumField.text)])
                //console.log('45658')

                laba13Interface.typedCall('someaction', [parseInt(firstNumField.text), parseInt(secondNumField.text)], function(result)
                {
                    console.log('45658')
                    console.log(result)
                });

                var address = laba13Interface.getProperty("result")
                console.log(address)
            }
            //onClicked: laba13Interface.call('handleButtonClick', undefined)
        }
    */
    }
}
