class FaultListModel {
  FaultListModel({
    this.id,
    this.status,
    this.description,
    this.statusId,
    this.statusColor,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? status;
  String? statusColor;
  String? description;
  int? statusId;
  String? createdAt;
  String? updatedAt;

  factory FaultListModel.fromJson(Map<String, dynamic> json) => FaultListModel(
        id: json["id"],
        status: json["status"],
        description: json["description"],
        statusId: json["status_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
