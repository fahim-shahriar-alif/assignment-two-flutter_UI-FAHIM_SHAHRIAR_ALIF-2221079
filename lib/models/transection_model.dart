class TransactionModel {
  final String id;
  final String title;
  final String category;
  final String emoji;
  final String dateLabel;
  final double amount;
  final bool isDebit;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.title,
    required this.category,
    required this.emoji,
    required this.dateLabel,
    required this.amount,
    required this.isDebit,
    required this.date,
  });
}