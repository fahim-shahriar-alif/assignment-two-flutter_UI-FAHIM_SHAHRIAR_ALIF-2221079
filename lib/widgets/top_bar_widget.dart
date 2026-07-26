import 'package:flutter/material.dart';
import '../utility/constant.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22.00,
              backgroundColor: AppConstant.primaryColor,
              child: Text(
                AppConstant.profilePicture,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10.00),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome back,',
                    style: TextStyle(color: Colors.grey, fontSize: 12.00)),
                Text(AppConstant.studentName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.00)),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
            ),
            Positioned(
              right: 10.00,
              top: 10.00,
              child: Container(
                width: 8.00,
                height: 8.00,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
