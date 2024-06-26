class SubCategory {
  final String id;
  final String name;
  final String code;
  final String orderIndex;
  final String imgUrl;
  final String imgUrlPath;
  final String parentId;
  final String parent;
  final String tType;
  final String remarks;
  final bool active;
  final String companyId;
  final String branchId;
  final String faId;
  final String userId;
  final String updateDate;
  final bool isDelete;

  SubCategory({
    required this.id,
    required this.name,
    required this.code,
    required this.orderIndex,
    required this.imgUrl,
    required this.imgUrlPath,
    required this.parentId,
    required this.parent,
    required this.tType,
    required this.remarks,
    required this.active,
    required this.companyId,
    required this.branchId,
    required this.faId,
    required this.userId,
    required this.updateDate,
    required this.isDelete,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['Id'],
      name: json['Name'],
      code: json['Code'],
      orderIndex: json['OrderIndex'],
      imgUrl: json['ImgUrl'],
      imgUrlPath: json['ImgUrlPath'],
      parentId: json['ParentId'],
      parent: json['Parent'],
      tType: json['TType'],
      remarks: json['Remarks'],
      active: json['Active'] == 'True',
      companyId: json['CompanyId'],
      branchId: json['BranchId'],
      faId: json['FaId'],
      userId: json['UserId'],
      updateDate: json['UpdateDate'],
      isDelete: json['IsDelete'] == 'False',
    );
  }
}
