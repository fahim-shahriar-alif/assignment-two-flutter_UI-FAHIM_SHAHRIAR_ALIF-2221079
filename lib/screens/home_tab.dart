import 'package:flutter/material.dart';
import '../utility/constant.dart';
import '../models/transection_model.dart';
import '../widgets/top_bar_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static final List<TransactionModel> _transactions = [
    TransactionModel(id: '1', title: 'Netflix Subscription', category: 'Entertainment', emoji: '🎬', dateLabel: 'Today',      amount: 19.99,   isDebit: true,  date: DateTime.now()),
    TransactionModel(id: '2', title: 'Coffee Shop',          category: 'Food & Drink',  emoji: '☕', dateLabel: 'Today',      amount: 4.50,    isDebit: true,  date: DateTime.now()),
    TransactionModel(id: '3', title: 'Salary Deposit',       category: 'Income',        emoji: '💰', dateLabel: 'Yesterday',  amount: 3500.00, isDebit: false, date: DateTime.now()),
    TransactionModel(id: '4', title: 'Grocery Store',        category: 'Shopping',      emoji: '🛒', dateLabel: 'Yesterday',  amount: 55.80,   isDebit: true,  date: DateTime.now()),
    TransactionModel(id: '5', title: 'Amazon Purchase',      category: 'Shopping',      emoji: '🛒', dateLabel: '2 days ago', amount: 120.45,  isDebit: true,  date: DateTime.now()),
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
              _buildBalanceCard(),
              const SizedBox(height: 20.00),
              _buildQuickActions(),
              const SizedBox(height: 25.00),
              _buildTransactionsHeader(),
              const SizedBox(height: 10.00),
              _buildTransactionsList(),
            ],
          ),
        ),
      ),
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
        _buildActionButton(Icons.swap_vert,     'Transfer'),
        _buildActionButton(Icons.toll_outlined, 'Pay Bills'),
        _buildActionButton(Icons.link,          'Invest'),
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
          Text(label,
              style: const TextStyle(
                  fontSize: 13.00, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTransactionsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Recent Transactions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.00)),
        TextButton(onPressed: () {}, child: const Text('View All')),
      ],
    );
  }

  Widget _buildTransactionsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        final TransactionModel t = _transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8.00),
          padding: const EdgeInsets.symmetric(
              horizontal: 15.00, vertical: 12.00),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.00),
          ),
          child: Row(
            children: [

              Container(
                width: 48.00,
                height: 48.00,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(t.emoji,
                      style: const TextStyle(fontSize: 22.00)),
                ),
              ),

              const SizedBox(width: 12.00),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.00)),
                    const SizedBox(height: 3.00),
                    Text('${t.category} • ${t.dateLabel}',
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12.00)),
                  ],
                ),
              ),

              Text(
                '${t.isDebit ? '' : '+'}\$${t.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: t.isDebit ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.00,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}