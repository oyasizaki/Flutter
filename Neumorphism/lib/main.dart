import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isPressed = true;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Listener(
          onPointerUp: (_) => setState(() => isPressed = false),
          onPointerDown: (_) => setState(() => isPressed = true),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: backgroundColor,
                boxShadow: isPressed
                    ? []
                    : [
                        BoxShadow(
                          blurRadius: blur,
                          offset: -distance,
                          color: isDarkMode ? Color(0xFF35393F) : Colors.white,
                          inset: isPressed,
                        ),
                        BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: isDarkMode
                              ? Color(0xFF23262A)
                              : Color(0xFFA7A9AF),
                          inset: isPressed,
                        )
                      ]),
            child: SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
