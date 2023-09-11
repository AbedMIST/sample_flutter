import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  var isChecked = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {

    super.initState();

    getReq();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "This is toast message",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: const Text('Show Toast'),
            ),

            ElevatedButton(
              child: const Text('showModalBottomSheet'),
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                        height: 400,
                        color: Colors.cyan,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              },

            ),

            ListTile(
              tileColor: Colors.green,
              leading: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),

                ),

                side: BorderSide(color: Colors.grey, width: 1),

                value: isChecked,
                onChanged: (bool? value) { //called when state changes
                  setState(() {
                    isChecked = value!;
                  });
                },
                activeColor: Colors.red,

              ),

              title: Text("ListTile Title"),
              trailing: Icon(Icons.accessibility),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // GridView.count(
            //   crossAxisCount: 2,
            //   childAspectRatio: (195 / 54),
            //   children: [
            //     AdvantageLabel(svg_img: 'assets/Union.svg', txt: '30 mins delivery'),
            //     AdvantageLabel(svg_img: 'assets/authorize.svg', txt: 'Authorized Products'),
            //     AdvantageLabel(svg_img: 'assets/phone.svg', txt: '24/7 online support'),
            //     AdvantageLabel(svg_img: 'assets/payment.svg', txt: 'Flexible payments'),
            //   ],
            // ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> getReq() async {
    final Dio _dio = Dio();
    try{

      const url = "https://demo460.nop-station.com/api/home/featureproducts";
      var headers = {
        'DeviceId': '44b4d8cd-7a2d-4a5f-a0e2-798021f1e294',
        'Content-Type': 'application/json',
      };

      var response = await _dio.get(url , options: Options(headers: headers));

      print(response.statusCode);
      print(response);

    }
    catch(e){
      print(e);
    }
  }
}
