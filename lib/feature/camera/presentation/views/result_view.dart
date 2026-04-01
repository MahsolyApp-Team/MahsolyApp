import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  // final Map<String, dynamic> result;

  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analysis Result")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // صورة
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              // child: Image.network(['image']),
            ),

            const SizedBox(height: 16),

            // اسم النبات
            Text(
              'ssss',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // الحالة
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.shade100,

                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // نسبة الثقة
          ],
        ),
      ),
    );
  }
}
