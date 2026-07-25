class TransactionModel {
  final String id;
  final String title;
  final String category;
  final double amount;
  final bool isDebit;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.isDebit,
    required this.date,
  });
}