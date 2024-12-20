import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor, textColor;
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    super.key,
  });
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
        ),
        child: Text(text),
      );
}
void main() {   
  runApp(MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Example')),
          body: Center(
            child: CustomButton(
              text: 'Click Me',
              onPressed: () => print('Button Pressed'),
            ),
          ),
        ),
      );
}
