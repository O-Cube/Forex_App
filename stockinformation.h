#ifndef STOCKINFORMATION_H
#define STOCKINFORMATION_H

#include <QObject>
#include <QQmlEngine>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QEventLoop>
#include <QTimer>

class StockInformation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList yen READ yen NOTIFY stockChanged)
    Q_PROPERTY(QVariantList btc READ btc NOTIFY stockChanged)
    Q_PROPERTY(int length READ length CONSTANT)
    QML_ELEMENT
public:
    explicit StockInformation(QObject *parent = nullptr);
    QVariantList yen() const;
    QVariantList btc() const;
    int length() const;
    ~StockInformation();

public slots:
    void doNothing();
signals:
    void stockChanged();
private:
    void scrapStock();

    QNetworkAccessManager *manager_;
    QNetworkRequest request_;
    QNetworkReply *reply_;
    QTimer *timer_;
    QVariantList yen_;
    QVariantList btc_;
    const int length_ = 20;
};

#endif // STOCKINFORMATION_H
