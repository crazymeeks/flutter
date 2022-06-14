import 'package:flutter/material.dart';

class NoTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Text(
              'No transactions has been added yet!',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
            ),
          ],
        );
    });
  }
}
