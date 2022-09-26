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
              "TIME",
            style: TextStyle(color: Color(0xFFffd030)),
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "1W",
            style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "1M",
            style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "ALL",
            style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
