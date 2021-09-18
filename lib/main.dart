import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<int> hesapla(int sayi) async {
    int sonuc = 1;

    for (var i = 1; i <= sayi; i++) {
      sonuc = sonuc * i;
    }
    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<int>(
                future: hesapla(39),
                builder: (contex, snapshot) {
                  if (snapshot.hasError) {
                    print('hata sonucu: ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return Text('sonuc:${snapshot.data}');
                  } else {
                    return Text("sonuc da hata oldu veri yok");
                  }
                })
          ],
        ),
      ),
    );
  }
}
