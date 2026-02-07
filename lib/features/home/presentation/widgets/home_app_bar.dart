import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.eco, size: 32),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'FreshCart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 28),
                onPressed: () {},
              ),
              Positioned(
                right: 4,
                top: 4,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.orange,
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
