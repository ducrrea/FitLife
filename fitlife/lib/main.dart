import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/CONTROLLER/fit_controller.dart';
import 'package:fitlife/VIEW/tela_inicial.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FitnessController(),
      child: Consumer<FitnessController>(
        builder: (context, controller, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // Permite alternar dinamicamente entre tema claro e escuro
            theme: controller.isDarkMode
                ? ThemeData.dark(useMaterial3: true)
                : ThemeData.light(useMaterial3: true).copyWith(
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      selectedItemColor: Colors.green,
                    ),
                  ),
            home: const TelaInicial(),
          );
        },
      ),
    ),
  );
}