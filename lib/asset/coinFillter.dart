import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CoinFillter extends StatelessWidget {
  final VoidCallback? onPressed;
  const CoinFillter({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TextButton(onPressed: onPressed,
            child: Text(
              "Hot",
              style: TextStyle(color: Colors.black,fontSize: 18),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFffd030),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            minimumSize: Size(10, 5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "Loser",
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
            style: TextButton.styleFrom(
              // backgroundColor: Color(0xFFffd030),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              minimumSize: Size(10, 5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
          ),
          TextButton(onPressed: onPressed, child: Text(
              "Gainer",
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
            style: TextButton.styleFrom(
              // backgroundColor: Color(0xFFffd030),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              minimumSize: Size(10, 5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
          ),
        ],
      ),
    );
  }
}
