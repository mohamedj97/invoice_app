import 'invoices_totals.dart';

class SubmittedInvoicesTotals {
  late InvoicesTotals invoicesTotal_Daily;
  late InvoicesTotals creditTotal_Daily;
  late InvoicesTotals total_Daily;
  late InvoicesTotals invoicesTotal_Monthly;
  late InvoicesTotals creditTotal_Monthly;
  late InvoicesTotals total_Monthly;
  late InvoicesTotals invoicesTotal_Yearly;
  late InvoicesTotals creditTotal_Yearly;
  late InvoicesTotals total_Yearly;

  SubmittedInvoicesTotals({
    required this.invoicesTotal_Daily,
    required this.creditTotal_Daily,
    required this.total_Daily,
    required this.invoicesTotal_Monthly,
    required this.creditTotal_Monthly,
    required this.total_Monthly,
    required this.invoicesTotal_Yearly,
    required this.creditTotal_Yearly,
    required this.total_Yearly,
  });

  @override
  List<Object?> get props => [
        invoicesTotal_Daily,
        creditTotal_Daily,
        total_Daily,
        invoicesTotal_Monthly,
        creditTotal_Monthly,
        total_Monthly,
        invoicesTotal_Yearly,
        creditTotal_Yearly,
        total_Yearly,
      ];
}
