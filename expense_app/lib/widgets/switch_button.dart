import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwitchButton extends StatelessWidget {


  final bool showChart;
  final Function onChangeHandler;

  SwitchButton(this.showChart, this.onChangeHandler);

  @override
  Widget build(BuildContext context) {
    return Row(
            children: <Widget>[
                Text('Show Chart', style: Theme.of(context).textTheme.headline6,),
                Switch.adaptive(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: showChart,
                  onChanged: (val){
                  onChangeHandler(val);
                },)
            ],
          );
  }
}