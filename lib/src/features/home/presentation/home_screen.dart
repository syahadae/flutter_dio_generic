import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class myHomepage extends StatelessWidget {
  const myHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text('data1'),
                Text('data2'),
                Text('data3'),
                Text('data4'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('GET'),
          ),
        ],
      ),
    );
  }
}
