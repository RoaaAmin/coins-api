import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  var item;
  Item({this.item});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.06, vertical: myHeight * 0.02
      ),

      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  height: myHeight * 0.05, child: Image.network(widget.item.image)),
            ),
            SizedBox(
              width: myWidth * 0.02,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //display name for each currency
                    widget.item.id,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                   widget.item.symbol,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: myWidth * 0.01,
            ),
            // for arrows
            Expanded(
              flex: 2,
              child: Container(
                height: myHeight * 0.05,
                // width: myWidth * 0.2,
                child: Sparkline(
                  data: widget.item.sparklineIn7D.price,
                  lineWidth: 2.0,
                  lineColor: widget.item.marketCapChangePercentage24H >= 0
                      ? Colors.green
                      : Colors.red,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.7],
                      colors: widget.item.marketCapChangePercentage24H >= 0
                          ? [Colors.green, Colors.green.shade100]
                          : [Colors.red, Colors.red.shade100]),
                ),
              ),
            ),
            SizedBox(
              width: myWidth * 0.04,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // price right now
                  Text(
                    '\$ ' + widget.item.currentPrice.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      // Text(
                      //   item.priceChange24H.toString().contains('-')
                      //       ? "-\$" +
                      //           item.priceChange24H
                      //               .toStringAsFixed(2)
                      //               .toString()
                      //               .replaceAll('-', '')
                      //       : "\$" + item.priceChange24H.toStringAsFixed(2),
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.normal,
                      //       color: Colors.grey),
                      // ),
                      // here the price in one houre
                      SizedBox(
                        width: myWidth * 0.03,
                      ),
                      Text(
                        widget.item.marketCapChangePercentage24H.toStringAsFixed(2) +
                            '%',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: widget.item.marketCapChangePercentage24H >= 0
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
