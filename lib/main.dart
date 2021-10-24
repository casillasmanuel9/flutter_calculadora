import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final num1Crtl = TextEditingController();
  final num2Crtl = TextEditingController();
  String opcion = "suma";
  double resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora App'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                TextField(
                  controller: num1Crtl,
                  decoration: InputDecoration(
                    hintText: 'Numero 1',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                TextField(
                  controller: num2Crtl,
                  decoration: InputDecoration(
                    hintText: 'Numero 2',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text("Suma"),
                  leading: Radio(
                    value: "suma",
                    groupValue: opcion,
                    onChanged: (value) {
                      setState(() {
                        opcion = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("Resta"),
                  leading: Radio(
                    value: "resta",
                    groupValue: opcion,
                    onChanged: (value) {
                      setState(() {
                        opcion = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("Multiplicación"),
                  leading: Radio(
                    value: "multiplicacion",
                    groupValue: opcion,
                    onChanged: (value) {
                      setState(() {
                        opcion = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("División"),
                  leading: Radio(
                    value: "division",
                    groupValue: opcion,
                    onChanged: (value) {
                      setState(() {
                        opcion = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Text(
                      "$resultado",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                    child: Text('Calcular', style: TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      if (num1Crtl.text.isNotEmpty &&
                          num2Crtl.text.isNotEmpty) {
                        double num1Double = double.parse(num1Crtl.text);
                        double num2Double = double.parse(num2Crtl.text);
                        setState(() {
                          if (opcion == 'suma') {
                            resultado = num1Double + num2Double;
                          } else if (opcion == 'resta') {
                            resultado = num1Double - num2Double;
                          } else if (opcion == 'multiplicacion') {
                            resultado = num1Double * num2Double;
                          } else {
                            if (num2Double == 0) {
                              Fluttertoast.showToast(
                                  msg: "No se puede dividir por 0",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                            } else {
                              resultado = num1Double / num2Double;
                            }
                          }
                        });
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
