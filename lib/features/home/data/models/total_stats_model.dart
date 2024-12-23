class TotalStatsModel {
  final int totalBalance;
  final int totalIncomes;
  final int totalExpenses;

  const TotalStatsModel(
      {required this.totalBalance,
      required this.totalIncomes,
      required this.totalExpenses});

  @override
  String toString() {
    return "TotalStatsModel: totalBalance -> $totalBalance, totalIncomes -> $totalIncomes, totalExpenses -> $totalExpenses";
  }
}
