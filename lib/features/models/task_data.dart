class TaskData {
  final BigInt id;
  final String name;
  final String description;
  final BigInt projectId;
  final BigInt subProjectId;
  final BigInt estimatedDuration;
  final BigInt status;
  final BigInt allocatedBudget;
  final String remark;
  final BigInt createdAt;

  TaskData(
      {required this.id,
      required this.name,
      required this.description,
      required this.projectId,
      required this.subProjectId,
      required this.estimatedDuration,
      required this.status,
      required this.allocatedBudget,
      required this.remark,
      required this.createdAt});

  factory TaskData.fromList(item) => TaskData(
      id: item[0],
      name: item[1],
      description: item[2],
      projectId: item[3],
      subProjectId: item[4],
      estimatedDuration: item[5],
      status: item[6],
      allocatedBudget: item[7],
      remark: item[8],
      createdAt: item[9]);
}
