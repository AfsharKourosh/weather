import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('data')),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 40,
          children: [
            Text('data'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                CupertinoButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text('decrease'),
                ),
                CupertinoButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text('increase'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
