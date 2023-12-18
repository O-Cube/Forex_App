
// calculates currency value with respect to USD
function convertCurrencyValue(value) {
    return 1 / value;
}
// add most recent forex value / stock value into 100 recent values array
function addValue(value) {
    for (var i = 99; i > 0; i--) {
        lastHundredValues[i] = lastHundredValues[i-1];
    }
    // add value to 0 index
    lastHundredValues[0] = value;
}
// percentage change in value
function percentageChangeInValue() {
    return ((lastHundredValues[0] - lastHundredValues[1]) / lastHundredValues[1]) * 100;
}
// change text color of display
function changeTextColor() {
    if ((lastHundredValues[0] - lastHundredValues[1]) > 0) {
        changeColor = true;
    }
    else
        changeColor = false;
}
