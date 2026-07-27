import 'package:flutter/material.dart';
import '../widgets/top_bar_widget.dart';

class SpendingTab extends StatelessWidget {
  const SpendingTab({super.key});

  static const List<Map<String, dynamic>> _categories = [
    {'name': 'Food & Drink', 'amount': 450.00, 'percent': 0.35, 'color': Colors.red},
    {'name': 'Shopping',     'amount': 320.00, 'percent': 0.25, 'color': Colors.blue},
    {'name': 'Housing',      'amount': 280.00, 'percent': 0.22, 'color': Colors.orange},
    {'name': 'Transport',    'amount': 150.00, 'percent': 0.12, 'color': Colors.green},
    {'name': 'Other',        'amount': 70.00,  'percent': 0.06, 'color': Colors.grey},
  ];

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
          ...List.generate(_categories.length, (index) {
            final c = _categories[index];
            final percent = c['percent'] as double;
            final amount = c['amount'] as double;
            final percentInt = (percent * 100).toInt();
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.00),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(c['name'],
                          style: const TextStyle(fontSize: 14.00)),
                      Text('\$${amount.toStringAsFixed(2)} ($percentInt%)',
                          style: const TextStyle(
                              fontSize: 13.00, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 6.00),
                  LinearProgressIndicator(
                    value: percent,
                    backgroundColor: Colors.grey.shade200,
                    color: c['color'] as Color,
                    minHeight: 7.00,
                    borderRadius: BorderRadius.circular(4.00),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
