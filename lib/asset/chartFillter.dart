import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartFilter extends StatelessWidget {
  final VoidCallback? onPressed;
  const ChartFilter({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TextButton(onPressed: onPressed, child: Text(
              "1H",
            style: TextStyle(color: Color(0xFFffd030)),
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "1D"
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "1W"
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "1M"
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "1Y"
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "ALL"
            ),
          ),
        ],
      ),
    );
  }
}
