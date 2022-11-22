import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({Key? key}) : super(key: key);

  @override
  State<KnowledgePage> createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161A1F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 35,
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }),
                              );
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: Text(
                          "Knowledge Base",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('SMA',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            'Simple Moving Average is the easiest moving average to construct. It is simply the average price over the specified period. The average is called "moving" because it is plotted on the chart bar by bar, forming a line that moves along the chart as the average value changes.\n\nSMAs are often used to determine trend direction. If the SMA is moving up, the trend is up. If the SMA is moving down, the trend is down. A 200-bar SMA is common proxy for the long term trend. 50-bar SMAs are typically used to gauge the intermediate trend. Shorter period SMAs can be used to determine shorter term trends.\n\nSMA is simply the mean, or average, of the stock price values over the specified period.',
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('MACD',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            'The Moving Average Convergence/Divergence indicator is a momentum oscillator primarily used to trade trends. Although it is an oscillator, it is not typically used to identify over bought or oversold conditions. It appears on the chart as two lines which oscillate without boundaries. The crossover of the two lines give trading signals similar to a two moving average system.\n\nMACD crossing above zero is considered bullish, while crossing below zero is bearish. Secondly, when MACD turns up from below zero it is considered bullish. When it turns down from above zero it is considered bearish.\n\nAn approximated MACD can be calculated by subtracting the value of a 26 period Exponential Moving Average (EMA) from a 12 period EMA. The shorter EMA is constantly converging toward, and diverging away from, the longer EMA. This causes MACD to oscillate around the zero level. A signal line is created with a 9 period EMA of the MACD line.',
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('EMA',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            'An exponential moving average (EMA) is a type of moving average (MA) that places a greater weight and significance on the most recent data points.',
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('RSI',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            "The relative strength index (RSI) is a momentum indicator used in technical analysis. RSI measures the speed and magnitude of a security's recent price changes to evaluate overvalued or undervalued conditions in the price of that security. \n\nBeyond identifying overbought and oversold securities, the RSI has other capabilities. It may also signal securities that are poised for a price correction or trend reversal. It can serve as a buying and selling cue. An overbought situation is generally indicated by an RSI reading of 70 or higher. An oversold condition is indicated by a reading of 30 or lower.\n\nThe RSI is a fairly simple formula,RSI = 100 – [100 / ( 1 + (Average of Upward Price Change / Average of Downward Price Change ) ) ]",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Bollinger Band',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            "Bollinger Bands are a type of price envelope.(Price envelopes define upper and lower price range levels.) Bollinger Bands are envelopes plotted at a standard deviation level above and below a simple moving average of the price. Because the distance of the bands is based on standard deviation, they adjust to volatility swings in the underlying price. \n\nBollinger Bands use 2 parameters, Period and Standard Deviations, StdDev. The default values are 20 for the period, and 2 for standard deviations, although you may customize the combinations. \n\nBollinger bands help determine whether prices are high or low on a relative basis. They are used in pairs, both upper and lower bands, and in conjunction with a moving average. Further, the pair of bands is not intended to be used on its own. Use the pair to confirm signals given with other indicators.\n\ncalculate a simple moving average. Next, calculate the standard deviation over the same number of periods as the simple moving average. For the upper band, add the standard deviation to the moving average. For the lower band, subtract the standard deviation from the moving average.",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Maximum Drawdown',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            "A maximum drawdown is the maximum observed loss from a peak to a trough of a portfolio, before a new peak is attained. Maximum drawdown is an indicator of downside risk over a specified time period.\n\nMaximum drawdown is a specific measure of drawdown that looks for the greatest movement from a high point to a low point, before a new peak is achieved. However, it's important to note that it only measures the size of the largest loss, without taking into consideration the frequency of large losses. Because it measures only the largest drawdown, MDD does not indicate how long it took an investor to recover from the loss, or if the investment even recovered at all.",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('R-Square',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            "R-squared is a statistical measure that represents the proportion of the variance for a dependent variable that's explained by an independent variable or variables in a regression model.\n\nIn investing, a high R-squared, between 85% and 100%, indicates the stock or fund's performance moves relatively in line with the index. A fund with a low R-squared, at 70% or less, indicates the security does not generally follow the movements of the index. A higher R-squared value will indicate a more useful beta figure.",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('RMSE',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            "Root Mean Square Error (RMSE) is the standard deviation of the residuals (prediction errors). Residuals are a measure of how far from the regression line data points are; RMSE is a measure of how to spread out these residuals. In other words, it tells you how concentrated the data is around the line of best fit. Root mean square error is commonly used in climatology, forecasting, and regression analysis to verify experimental results.\n\nRMSE is a metric that ranges from 0 to infinity, where the closer the score is to 0 the better performing the model is.",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            child: Card(
                              color: Color(0xff2D3035),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              elevation: 2,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('MAPE',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFffd030))),
                                        Text(
                                            "Mean Absolute Percentage Error (MAPE) is the mean of all absolute percentage errors between the predicted and actual values.\n\nIt is a popular metric to use as it returns the error as a percentage, making it both easy for end users to understand and simple to compare model accuracy across use cases and datasets.\n\nMAPE returns error as a percentage, making it easy to understand the 'goodness' of the error value. It goes without saying that how 'good' your MAPE is depends on your use case and dataset.\n\n< 10 % : very good\n10 % - 20 % : good\n20 % - 50 % : ok\n> 50 % : not good",
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
