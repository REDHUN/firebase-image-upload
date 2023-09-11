import 'package:firebaseimageupload/screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var KcolorScheme = ColorScheme.fromSeed(
  // brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 7, 39, 223),
);
final theme = ThemeData(
    useMaterial3: true,
    colorScheme: KcolorScheme,
    textTheme: GoogleFonts.latoTextTheme(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    cardTheme: CardTheme(color: KcolorScheme.secondaryContainer));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const UploadScreen());
  }
}
