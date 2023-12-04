import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:led_color_picker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColorPickerPage(),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color pickColor = Colors.blue;
  final dbRef = FirebaseDatabase.instance.ref();
  bool ledIsOn = false;
  bool relayIsOn = false;
  Map<dynamic, dynamic> data = {};
  List<Map<dynamic, dynamic>> datalist = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    DataSnapshot snapshot = await dbRef.child("led").get();
    data = snapshot.value as Map<dynamic, dynamic>;
    data.forEach((key, value) {
      datalist.add(value);
    });
    setState(() {
      pickColor = Color.fromRGBO(data["color"]["r"], data["color"]["g"],
          data["color"]["b"], data["color"]["o"]);
      ledIsOn = data["ledIsOn"];
      relayIsOn = data["relayIsOn"];
    });
  }

  void sendColor() async {
    await dbRef.child("led/color").set({
      "r": pickColor.red,
      "g": pickColor.green,
      "b": pickColor.blue,
      "a": pickColor.alpha,
      "o": pickColor.opacity,
      "hex": pickColor.value.toRadixString(16).substring(2).toUpperCase(),
    });
  }

  void changeColor(Color color) {
    setState(() {
      pickColor = color;
      sendColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Home"),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: HSLColor.fromColor(pickColor).withLightness(0.95).toColor(),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ColorPicker(
                  pickerColor: pickColor,
                  onColorChanged: changeColor,
                  hexInputBar: true,
                  colorPickerWidth: MediaQuery.of(context).size.width * 0.6,
                  paletteType: PaletteType.hueWheel,
                  displayThumbColor: true,
                  labelTypes: const [
                    ColorLabelType.hex,
                    ColorLabelType.hsl,
                    ColorLabelType.rgb,
                    ColorLabelType.hsv
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          ledIsOn = !ledIsOn;
                          dbRef.child("led").update({"ledIsOn": ledIsOn});
                        });
                      },
                      backgroundColor: ledIsOn ? pickColor : Colors.grey,
                      child: Icon(
                          ledIsOn ? Icons.lightbulb : Icons.lightbulb_outline),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          relayIsOn = !relayIsOn;
                          dbRef.child("relay").update({"relayIsOn": relayIsOn});
                        });
                      },
                      backgroundColor: relayIsOn ? Colors.green : Colors.grey,
                      child: Icon(relayIsOn ? Icons.power : Icons.power_off),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}