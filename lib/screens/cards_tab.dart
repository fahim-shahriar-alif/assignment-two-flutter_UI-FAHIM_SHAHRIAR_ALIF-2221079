import 'package:flutter/material.dart';
import '../utility/constant.dart';
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
              const SizedBox(height: 16.00),
              _buildCreditCard(),
              const SizedBox(height: 20.00),
              _buildCardActions(),
              const SizedBox(height: 25.00),
              const Text('Linked Accounts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.00)),
              const SizedBox(height: 10.00),
              _buildLinkedAccount('S', 'Shared Savings', '\$5,500.00'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25.00),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2340),
        borderRadius: BorderRadius.circular(20.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48.00,
                height: 36.00,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8.00),
                ),
              ),
              const Text('BANK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 3.0)),
            ],
          ),

          const SizedBox(height: 25.00),

          const Text('4567  ****  ****  1234',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.00,
                  letterSpacing: 2.0)),

          const SizedBox(height: 20.00),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CARD HOLDER',
                      style: TextStyle(color: Colors.white54, fontSize: 10.00)),
                  const SizedBox(height: 4.00),
                  Text(AppConstant.studentName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.00)),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('EXPIRES',
                      style: TextStyle(color: Colors.white54, fontSize: 10.00)),
                  SizedBox(height: 4.00),
                  Text('12/28',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.00)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.close,        'Block'),
        _buildActionButton(Icons.credit_card,  'Details'),
        _buildActionButton(Icons.info_outline,  'Limit'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.00, vertical: 15.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.00),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 8.00,
            offset: const Offset(0.00, 3.00),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20.00,
            backgroundColor: AppConstant.primaryColor.withAlpha(25),
            child: Icon(icon, color: AppConstant.primaryColor, size: 20.00),
          ),
          const SizedBox(height: 8.00),
          Text(label, style: const TextStyle(fontSize: 12.00)),
        ],
      ),
    );
  }

  Widget _buildLinkedAccount(String initial, String name, String amount) {
    return Container(
      padding: const EdgeInsets.all(15.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.00),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.00,
            backgroundColor: AppConstant.primaryColor.withAlpha(30),
            child: Text(initial,
                style: TextStyle(
                    color: AppConstant.primaryColor,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 15.00),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(amount,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.00)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 14.00, color: Colors.grey),
        ],
      ),
    );
  }
}
