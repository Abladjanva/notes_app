import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await context.setLocale(const Locale('uz'));
      }),
      body: Center(
        child: Text(context.tr('greeting')),
      ),
    );
  }
}
