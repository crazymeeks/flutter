import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './widgets/switch_button.dart';
import './models/transaction.dart';


void main() {

  // Need to do this for new flutter version
  // before we can set the device orientation
  /*WidgetsFlutterBinding.ensureInitialized();
  // Controlling device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          button: TextStyle(
            color: Colors.white,
          ),
          
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  final List<Transaction> _userTransactions = [
    /*Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Grocery', amount: 16.53, date: DateTime.now()),*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    // We're telling flutter that, hey whenever my life cycle state
    // changes, I want you to go to a certain observer
    // and call didChangeAppLifecycleState()
    WidgetsBinding.instance.addObserver(this);
  }

  // provided by mixin WidgetsBindingObserver
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

  }

  @override
  void dispose() {
    // clear the listeners we have
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime choosenDate) {

    setState(() {
        _userTransactions.add(Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: choosenDate));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewTransaction(this._addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }


  void _switchButtonHandler(bool val){
    setState(() {
      _showChart = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Check device platform(dart.io)
    final isIos = Platform.isIOS;
    final PreferredSizeWidget appBar = isIos 
      ? CupertinoNavigationBar(
        middle: Text('Personal Expenses'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Shrink the row to be only as big as its children(from left -> right)
          children: <Widget>[
            GestureDetector(
              child: Icon(CupertinoIcons.add),
              onTap: () => _startAddNewTransaction(context),
            )
          ],
        ),
      )
      : AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context),)
        ],
      );

    final calcHeight = mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top;

    final txListWidget = Container(
              height: calcHeight * 0.7,
              child: TransactionList(_userTransactions, _deleteTransaction)
            );

    final pageBody = SafeArea( // SafeArea Widget is for iOS to respect the reserve areas on the screen
      child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              SwitchButton(_showChart, _switchButtonHandler),

            if (!isLandscape)
              Container(
                  height: calcHeight * 0.3,
                  child: Chart(_recentTransactions)
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape) _showChart ?
              Container(
                  height: calcHeight * 0.7,
                  child: Chart(_recentTransactions)
              ) : txListWidget,
          ],
        )
      )
    );

    return isIos ? CupertinoPageScaffold(child: pageBody, navigationBar: appBar,) : Scaffold(
      appBar: appBar,
      body: pageBody,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: isIos ? Container() :  FloatingActionButton(child: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context),),
      );
  }
}
