import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import './models/button.dart';
import './screens/buttonGridView.dart';
import './screens/buttonList.dart';
import './screens/button_add_screen.dart';
import './utils/buttonData.dart';

void main() {
  Hive.registerAdapter(ButtonAdapter());

  runApp(PowerTapPowerApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
}

class PowerTapPowerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ButtonData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Power Tap Power App',
        theme: ThemeData(
          primaryColor: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
              future: _initHive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.error != null) {
                    print(snapshot.error);
                    return Scaffold(
                      body: Center(
                        child:
                            Text('Error Establishing Connection To Hive! :('),
                      ),
                    );
                  } else {
                    return ButtonGridView();
                  }
                } else
                  return Scaffold();
              }),
          '/bas': (context) => ButtonAddScreen(),
          '/bls': (context) => ButtonListScreen(),
        },
      ),
    );
  }
}
