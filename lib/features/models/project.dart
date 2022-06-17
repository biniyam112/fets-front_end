class Project {
  final BigInt status;
  final String name, description, location, companyId, accountNumber;
  final BigInt id, estimatedBudget, fundedMoney, estimatedDuration, createdAt;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.estimatedBudget,
    required this.fundedMoney,
    required this.estimatedDuration,
    required this.createdAt,
    required this.companyId,
    required this.accountNumber,
    required this.status,
  });

  factory Project.fromJson(json) => Project(
        id: json['id'],
        name: json['name'],
        estimatedDuration: json['estimatedDuration'],
        fundedMoney: json['fundedMoney'],
        status: json['status'],
        accountNumber: json['accountNumber'],
        createdAt: json['createdAt'],
        location: json['location'],
        companyId: json['companyId'],
        estimatedBudget: json['estimatedBudget'],
        description: json['description'],
      );
  factory Project.fromList(item) => Project(
      id: item[0],
      name: item[1],
      description: item[2],
      location: item[3],
      estimatedBudget: item[4],
      fundedMoney: item[5],
      estimatedDuration: item[6],
      createdAt: item[7],
      companyId: item[8],
      accountNumber: item[9],
      status: item[10]);
}

class FundedProject extends Project {
  final bool completed;
  final double progress;

  FundedProject({
    required this.completed,
    required this.progress,
    required BigInt id,
    required String name,
    required String description,
    required String location,
    required BigInt estimatedBudget,
    required BigInt fundedMoney,
    required BigInt estimatedDuration,
    required BigInt createdAt,
    required String companyId,
    required String accountNumber,
    required BigInt status,
  }) : super(
          id: id,
          name: name,
          description: description,
          location: location,
          estimatedBudget: estimatedBudget,
          fundedMoney: fundedMoney,
          estimatedDuration: estimatedDuration,
          createdAt: createdAt,
          companyId: companyId,
          accountNumber: accountNumber,
          status: status,
        );
}
