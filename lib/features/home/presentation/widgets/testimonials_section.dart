import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '“The quality is incredible, everything is so fresh! The delivery was super fast too.”',
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '- Sarah L.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
