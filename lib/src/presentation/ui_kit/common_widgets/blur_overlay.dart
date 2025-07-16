import 'package:flutter/material.dart';

class BlurOverlay extends StatelessWidget {
  const BlurOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Container(color: Colors.black), // Черный фон
          const Center(
            child: Text(
              'Жулик не воруй',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
