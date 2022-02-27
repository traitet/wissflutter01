import 'package:flutter/material.dart';
import 'package:wissflutter01/pages/InterfaceSapPoPage.dart';
import 'pages/InterfaceSapPoOneRecordPage.dart';
import 'pages/SampleApiAlbumPage.dart';
import 'pages/SampleDataTablePage.dart';

void main() {
  runApp(MyApp());
}
//==============================================================================
//  DEPLOY FLUTTER INTO APACHE WEB SERVER
//==============================================================================
// https://gist.github.com/felagund18/4ea58e1b4d6646797e866d1c583ca1b0 (CALL API)

//==============================================================================
// DECLEARE VARIABLE
//==============================================================================
enum MenuOptions {
  app,
  infra,
  general,
  dashboard,
}

//==============================================================================
// MAIN CLASS
//==============================================================================
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WISS Flutter 2022 Demo',
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
//==============================================================================
// APP BAR
//==============================================================================
      appBar: AppBar(title: Text(widget.title), actions: [
//==============================================================================
// ACTIONS: RIGHT MENU (POPUP MENU BUTTON)
//==============================================================================
        PopupMenuButton(
//==============================================================================
// ON SELECTED
//==============================================================================
          onSelected: (MenuOptions result) {
            // setState(() {
            //   _selection = result;
            // });
          },
          icon: Icon(Icons.view_headline),
//==============================================================================
// ITEM BUILDER OF MENU
//==============================================================================
          itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuOptions>>[
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.app,
              child: Text('Business App'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.infra,
              child: Text('Infra'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.general,
              child: Text('General'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.dashboard,
              child: Text('Dashboard'),
            ),
          ],
        )
      ]),

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
                    title: 'Dashboard (Data Table)',
                    subTitle: 'Aisin Asia Pacific',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SampleDataTablePage(),
                        ),
                      );
                    },
                  ),

//==============================================================================
// CARD#2
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.input,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.red.shade400,
                    title: 'Call API Album (Sample)',
                    subTitle: 'https://jsonplaceholder.typicode.com/albums/1',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SampleApiAlbumPage(),
                        ),
                      );
                    },
                  ),
//==============================================================================
// CARD#3
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.money,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.green.shade700,
                    title: 'Interface SAP PO - One Record',
                    subTitle:
                        'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_po',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterfaceSapPoOneRecordPage(),
                        ),
                      );
                    },
                  ),
//==============================================================================
// CARD#4
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.money,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.green.shade900,
                    title: 'Interface SAP PO - All Record',
                    subTitle:
                        'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_po',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterfaceSapPoPage(),
                        ),
                      );
                    },
                  ),
//==============================================================================
// CARD#4
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.wallet_giftcard_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.yellow.shade800,
                    title: 'Interface SAP RC ',
                    subTitle:
                        'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_rec',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SampleApiAlbumPage(),
                        ),
                      );
                    },
                  ),
//==============================================================================
// CARD#5
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.wallet_membership_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.orange.shade800,
                    title: 'Interface SAP Receipt',
                    subTitle:
                        'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_rec',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SampleApiAlbumPage(),
                        ),
                      );
                    },
                  ),
//==============================================================================
// CARD#6
//==============================================================================
                  WidgetCard(
                    icon: Icon(
                      Icons.wallet_travel,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.blue.shade800,
                    title: 'Interface SAP Invoice ',
                    subTitle:
                        'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_inv',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SampleApiAlbumPage(),
                        ),
                      );
                    },
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

//=============================================================
// BUILD CARD
//=============================================================
class WidgetCard extends StatelessWidget {
//=============================================================
// DECLARE VARIABLE
//=============================================================
  final Icon icon;
  final Color color;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  // final Key key;

  WidgetCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
//=============================================================
// ONTAB EVENT
//=============================================================
        onTap: onTap,
//=============================================================
// BUILD CARD
//=============================================================
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, top: 8, bottom: 0),
          child: Card(
            color: color,
            child: ListTile(
              leading: icon,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(title, style: TextStyle(color: Colors.white)),
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              // trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ));
  }
}
