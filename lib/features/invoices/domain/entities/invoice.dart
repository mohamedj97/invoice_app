class Invoice {
  final String id;
  final double price;
  final String status;
  final DateTime date;
  final DateTime dueDate;
  final String toWho;
  final double subTotal;
  final double totalSales;
  final double netAmount;
  final double taxTotal;
  final double taxDiscount;
  final double total;

  Invoice({
    required this.toWho,
    required this.id,
    required this.price,
    required this.status,
    required this.date,
    required this.dueDate,
    required this.subTotal,
    required this.totalSales,
    required this.netAmount,
    required this.taxTotal,
    required this.taxDiscount,
    required this.total,
  });
}
