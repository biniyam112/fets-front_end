class Project {
  final int status;
  final String name, description, location, companyId, accountNumber;
  final double id, estimatedBudget, fundedMoney, estimatedDuration, createdAt;

  Project({
    required this.id,
    required this.name,
    required this.estimatedDuration,
    required this.fundedMoney,
    required this.status,
    required this.accountNumber,
    required this.createdAt,
    required this.location,
    required this.companyId,
    required this.estimatedBudget,
    required this.description,
  });
}

class FundedProject extends Project {
  final bool completed;
  final double progress;

  FundedProject({
    required this.completed,
    required this.progress,
    required double id,
    required String name,
    required int status,
    required String location,
    required double createdAt,
    required String companyId,
    required String description,
    required double fundedMoney,
    required double estimatedBudget,
    required double estimatedDuration,
    required String accountNumber,
  }) : super(
          id: id,
          name: name,
          status: status,
          location: location,
          fundedMoney: fundedMoney,
          createdAt: createdAt,
          accountNumber: accountNumber,
          estimatedDuration: estimatedDuration,
          estimatedBudget: estimatedBudget,
          companyId: companyId,
          description: description,
        );
}
