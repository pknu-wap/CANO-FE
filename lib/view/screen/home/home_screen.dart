import 'package:flutter/material.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(200)),
          CustomButton(
            text: "home",
            height: 40,
            width: 100,
            onPressed: () {
              context.push('/menu');
            },
          ),
        ],
      ),
    );
  }
}
