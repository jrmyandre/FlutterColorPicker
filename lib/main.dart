import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
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

  void changeColor(Color color) {
    setState(() {
      pickColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(

        child: ListView(
          
          children: [
            Center(
              child: Container(
              padding: EdgeInsets.all(5),
              child: ColorPicker(
              pickerColor: pickColor, 
              onColorChanged: changeColor,
              showLabel: true,
              hexInputBar: true,
              colorPickerWidth: 300,
              paletteType: PaletteType.hueWheel,
              displayThumbColor: true,),
            )
            ),
            Center(
              child: FloatingActionButton(
                onPressed: (){},
                backgroundColor: pickColor,
              
              ),
            )
            
            

            
          ],
        ),
      ),

    );
  }
}
