import 'package:flutter/material.dart';
import '../widgets/top_bar_widget.dart';

class SpendingTab extends StatelessWidget {
  const SpendingTab({super.key});

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
              const Text('Monthly Spending Report',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.00)),
              const SizedBox(height: 16.00),
              _buildTotalCard(),
              const SizedBox(height: 20.00),
              _buildBreakdownCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Expenses (Last 30 days)',
              style: TextStyle(color: Colors.grey, fontSize: 13.00)),
          const SizedBox(height: 6.00),
          const Text('-\$1270.00',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 32.00,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6.00),
          Row(
            children: const [
              Icon(Icons.arrow_upward, color: Colors.red, size: 14.00),
              SizedBox(width: 4.00),
              Text('Up 12% from last month',
                  style: TextStyle(color: Colors.red, fontSize: 12.00)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.00),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Spending Breakdown',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.00)),
          const SizedBox(height: 16.00),
          _buildCategoryRow('Food & Drink', 450.00, 35, Colors.red),
          _buildCategoryRow('Shopping',     320.00, 25, Colors.blue),
          _buildCategoryRow('Housing',      280.00, 22, Colors.orange),
          _buildCategoryRow('Transport',    150.00, 12, Colors.green),
          _buildCategoryRow('Other',         70.00,  6, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(String name, double amount, int percent, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: const TextStyle(fontSize: 14.00)),
              Text('\$$amount ($percent%)',
                  style: const TextStyle(fontSize: 13.00, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 6.00),
          LinearProgressIndicator(
            value: percent / 100,
            backgroundColor: Colors.grey.shade200,
            color: color,
            minHeight: 7.00,
            borderRadius: BorderRadius.circular(4.00),
          ),
        ],
      ),
    );
  }
}
