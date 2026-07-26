import 'package:flutter/material.dart';
import '../utility/constant.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
              _buildTopBar(),
              const SizedBox(height: 20.00),
              _buildBalanceCard(),
              const SizedBox(height: 20.00),
              _buildQuickActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
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
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25.00),
      decoration: BoxDecoration(
        color: const Color(0xFF5B50F0),
        borderRadius: BorderRadius.circular(20.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Total Balance',
                  style: TextStyle(color: Colors.white70, fontSize: 14.00)),
              Icon(Icons.account_balance_wallet_outlined,
                  color: Colors.white70, size: 22.00),
            ],
          ),

          const SizedBox(height: 10.00),

          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text('\$8,945',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.00,
                      fontWeight: FontWeight.bold)),
              Text('.32',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 15.00),
          const Divider(color: Colors.white24, thickness: 1.00),
          const SizedBox(height: 10.00),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Savings: \$5,500',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.00)),
              Text('Last 30 days: +\$300  →',
                  style: TextStyle(color: Colors.white70, fontSize: 13.00)),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.swap_vert,        'Transfer'),
        _buildActionButton(Icons.toll_outlined,    'Pay Bills'),
        _buildActionButton(Icons.link,             'Invest'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.00, vertical: 15.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.00),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(18),
            blurRadius: 12.00,
            offset: const Offset(0.00, 4.00),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.00,
            backgroundColor: AppConstant.primaryColor.withAlpha(30),
            child: Icon(icon, color: AppConstant.primaryColor, size: 26.00),
          ),
          const SizedBox(height: 10.00),
          Text(label, style: const TextStyle(fontSize: 13.00, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }


}