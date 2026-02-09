import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Theme Demo',

      // LIGHT THEME
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 18)),
      ),

      // DARK THEME
      darkTheme: ThemeData.dark(),

      themeMode: _themeMode,

      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Demo'), centerTitle: true),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Container
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 300,
                height: 200,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Mobile App Development Testing',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              const Text('Choose the Theme:', style: TextStyle(fontSize: 16)),

              const SizedBox(height: 10),

              // Switch + Dynamic Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _themeMode == ThemeMode.dark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    size: 28,
                  ),
                  const SizedBox(width: 10),
                  Switch(
                    value: _themeMode == ThemeMode.dark,
                    onChanged: changeTheme,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
