#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
    qputenv("QT_QUICK_CONTROLS_STYLE", QByteArray("Basic"));
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/AEShopping/assets/logo.png"));

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/AEShopping/qml/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
