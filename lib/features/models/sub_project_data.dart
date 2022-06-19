class SubprojectData {
  final BigInt id;
  final BigInt projectId;
  final BigInt estimatedDuration;
  final BigInt createdAt;
  final String name;
  final String description;

  SubprojectData(
      {required this.id,
      required this.name,
      required this.description,
      required this.projectId,
      required this.estimatedDuration,
      required this.createdAt});

  factory SubprojectData.fromList(item) => SubprojectData(
      id: item[0],
      name: item[1],
      description: item[2],
      projectId: item[3],
      estimatedDuration: item[4],
      createdAt: item[5]);
}
