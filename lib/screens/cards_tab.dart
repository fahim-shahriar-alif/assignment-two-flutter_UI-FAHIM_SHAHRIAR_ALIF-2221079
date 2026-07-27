import 'package:flutter/material.dart';
import '../widgets/top_bar_widget.dart';

class CardsTab extends StatelessWidget {
  const CardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBarWidget(),
              const SizedBox(height: 20.00),
              const Text('My Cards',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.00)),
            ],
          ),
        ),
      ),
    );
  }
}
