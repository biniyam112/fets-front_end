class Donation {
  final String donorUsername, projectId;
  final BigInt amount, donatedAt;

  Donation({
    required this.donorUsername,
    required this.projectId,
    required this.amount,
    required this.donatedAt,
  });
}
