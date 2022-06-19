class Donation {
  final String donorUsername, projectId;
  final BigInt amount, donatedAt;

  Donation({
    required this.donorUsername,
    required this.projectId,
    required this.amount,
    required this.donatedAt,
  });

  factory Donation.formList(List item) => Donation(
        donorUsername: item[0],
        projectId: item[1],
        amount: item[2],
        donatedAt: item[3],
      );
}
