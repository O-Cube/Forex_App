#include "stockinformation.h"

StockInformation::StockInformation(QObject *parent) {
    /* initialize yen, yuan list with zeros */
    for (int i = 0; i < 20; i++) {
        yen_.push_back(0);
        btc_.push_back(0);
    }
    manager_ = new QNetworkAccessManager(this);
    /* activate periodic timer */
    timer_ = new QTimer(this);
    /* connect timer to update all values function */
    QObject::connect(timer_, &QTimer::timeout, this, &StockInformation::scrapStock);
    /* start timer */
    timer_->start(2000);
}

QVariantList StockInformation::yen() const
{
    return yen_;
}

QVariantList StockInformation::btc() const
{
    return btc_;
}

int StockInformation::length() const
{
    return length_;
}

StockInformation::~StockInformation()
{
    delete manager_;
    delete timer_;
}


void StockInformation::doNothing()
{
    // slot does nothing
}

void StockInformation::scrapStock()
{
    /* event loop to be used as delay process */
    QEventLoop loop = QEventLoop(this);

    request_.setUrl(QUrl("https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency=JPY&apikey=demo"));
    request_.setRawHeader("My Stock App", "Japanese Yen");

    /* scrap yen info */
    reply_ = manager_->get(request_);
    /* connect signal to exit loop after download is finished */
    QObject::connect(reply_, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    /* delay for download to complete */
    loop.exec();
    /* handle errors during download process */
    QObject::connect(reply_, &QIODevice::readyRead, this, &StockInformation::doNothing);
    QObject::connect(reply_, &QNetworkReply::errorOccurred, this, []() {
        qDebug("Network reply error occurred!");
    });
    QObject::connect(reply_, &QNetworkReply::sslErrors, this, []() {
        qDebug("SSL errors occurred!");
    });
    // read data from respond
    QByteArray jsonByteArray = reply_->readAll();
    // covert data from qbyte array to json document
    QJsonParseError jsonError;
    QJsonDocument jsonDocument = QJsonDocument::fromJson(jsonByteArray, &jsonError);
    /* convert json document to json object */
    QJsonObject jsonObject = jsonDocument.object();
    /* get exchange rate of yen */
    QString yen = jsonObject[QString("Realtime Currency Exchange Rate")][QString("5. Exchange Rate")].toString();
    /* push value into yen_ and pop out right most value */
    yen_.push_front(yen.toDouble());
    yen_.pop_back();


    /* event loop to be used as delay process */
    //QEventLoop loop = QEventLoop(this);

    request_.setUrl(QUrl("https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=CNY&apikey=demo"));
    request_.setRawHeader("Bit Coin", "Chinese Yen");

    /* scrap yuan info */
    reply_ = manager_->get(request_);
    /* connect signal to exit loop after download is finished */
    QObject::connect(reply_, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    /* delay for download to complete */
    loop.exec();
    /* handle errors during download process */
    QObject::connect(reply_, &QIODevice::readyRead, this, &StockInformation::doNothing);
    QObject::connect(reply_, &QNetworkReply::errorOccurred, this, []() {
        qDebug("Network reply error occurred!");
    });
    QObject::connect(reply_, &QNetworkReply::sslErrors, this, []() {
        qDebug("SSL errors occurred!");
    });
    // read data from respond
    jsonByteArray = reply_->readAll();
    // covert data from qbyte array to json document
    jsonDocument = QJsonDocument::fromJson(jsonByteArray, &jsonError);
    /* convert json document to json object */
    jsonObject = jsonDocument.object();
    /* get exchange rate of BTC */
    QString btc = jsonObject[QString("Realtime Currency Exchange Rate")][QString("5. Exchange Rate")].toString();
    /* push value into btc_ and pop out right most value */
    btc_.push_front(btc.toDouble());
    btc_.pop_back();

    /* emit signal */
    emit stockChanged();
}

