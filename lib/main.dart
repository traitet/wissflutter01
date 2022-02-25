import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// https://gist.github.com/felagund18/4ea58e1b4d6646797e866d1c583ca1b0 (CALL API)

//==============================================================================
// MAIN CLASS
//==============================================================================
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WISS Flutter 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Wiss Flutter 2022'),
    );
  }
}

//==============================================================================
// STATE CLASS
//==============================================================================
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
//==============================================================================
// OVERRIDE STATE CLASS
//==============================================================================
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//==============================================================================
// MY HOME PAGE STATE
//==============================================================================
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
//==============================================================================
// SCAFFOLD
//==============================================================================
    return Scaffold(
      // backgroundColor: Colors.lightBlue[40],
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                Icons.view_headline,
                size: 40,
              ),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
        ],
      ),
//==============================================================================
// SCAFFOLD BODY
//==============================================================================
      body: Column(
        children: [
//==============================================================================
// 1. CONTAINER
//==============================================================================
          Container(
              alignment: Alignment.centerLeft,
              color: Colors.black54,
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select Company',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
//==============================================================================
// 2. CONTAINER
//==============================================================================
          Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Dashboard',
                        style: TextStyle(color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Let's get a quick overview",
                      style: TextStyle(color: Colors.black38),
                    ),
                  )
                ],
              )),
//==============================================================================
// CONTAINER: LISTVIEW
//==============================================================================
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: ListView(
                children: [
//==============================================================================
// CARD#1
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.blue,
                    title: 'Dashboard',
                    subtitle: '35',
                    key: null,
                  ),
//==============================================================================
// CARD#2
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.input,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Colors.red,
                    title: 'Fiscal Year',
                    subtitle: '01 Apr 2014 - 31 Mar 2022',
                    key: null,
                  ),
//==============================================================================
// CARD#3
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.money,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Colors.green,
                    title: 'Last Payment',
                    subtitle: '14-04-2021',
                    key: null,
                  ),
//==============================================================================
// CARD#4
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.wallet_giftcard,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Colors.black54,
                    title: 'PO-Invoice Status',
                    subtitle: 'Vendor Siam Shimotogo',
                    key: null,
                  ),
//==============================================================================
// CARD#5
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.wallet_membership_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Colors.orange,
                    title: 'PO-REC Status',
                    subtitle: 'Last updated 3 Feb 2022',
                    key: null,
                  ),
//==============================================================================
// CARD#6
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.wallet_travel,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Colors.pink,
                    title: 'PO-PR Status',
                    subtitle: 'PO050001, PR040002',
                    key: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//==============================================================================
// CARD WIDGET
//==============================================================================
class WidgetCard extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String title;
  final String subtitle;
  const WidgetCard(
      {required Key? key,
      required this.icon,
      required this.color,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8, bottom: 0),
      child: Card(
        color: color,
        child: ListTile(
          leading: icon,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          // trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
