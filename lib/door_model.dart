
class DoorModel {
  final bool? status;
  final Data? data;
  final String? message;

  DoorModel({
    this.status,
    this.data,
    this.message,
  });

  factory DoorModel.fromJson(Map<String, dynamic> json) => DoorModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  final List<Datum>? data;
  final Pagination? pagination;

  Data({
    this.data,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  final int? id;
  final User? user;
  final String? name;
  final String? mobileNo;
  final String? alternateContactNumber;
  final String? email;
  final String? planName;
  final int? status;
  final String? statusTxt;
  final String? statusColor;
  final Plan? planType;
  final Plan? planPattern;
  final String? createdAt;
  final String? expiryDate;
  final String? plotLength;
  final String? plotWidth;
  final Plan? planBudgetAmount;
  final int? isQuotationComplete;
  final int? isSend;
  final int? isEditable;
  final dynamic orderId;
  final String? quotationId;
  final int? otherInquiriesCount;

  Datum({
    this.id,
    this.user,
    this.name,
    this.mobileNo,
    this.alternateContactNumber,
    this.email,
    this.planName,
    this.status,
    this.statusTxt,
    this.statusColor,
    this.planType,
    this.planPattern,
    this.createdAt,
    this.expiryDate,
    this.plotLength,
    this.plotWidth,
    this.planBudgetAmount,
    this.isQuotationComplete,
    this.isSend,
    this.isEditable,
    this.orderId,
    this.quotationId,
    this.otherInquiriesCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    name: json["name"],
    mobileNo: json["mobile_no"],
    alternateContactNumber: json["alternate_contact_number"],
    email: json["email"],
    planName: json["plan_name"],
    status: json["status"],
    statusTxt: json["status_txt"],
    statusColor: json["status_color"],
    planType: json["plan_type"] == null ? null : Plan.fromJson(json["plan_type"]),
    planPattern: json["plan_pattern"] == null ? null : Plan.fromJson(json["plan_pattern"]),
    createdAt: json["created_at"],
    expiryDate: json["expiry_date"],
    plotLength: json["plot_length"],
    plotWidth: json["plot_width"],
    planBudgetAmount: json["plan_budget_amount"] == null ? null : Plan.fromJson(json["plan_budget_amount"]),
    isQuotationComplete: json["is_quotation_complete"],
    isSend: json["is_send"],
    isEditable: json["is_editable"],
    orderId: json["order_id"],
    quotationId: json["quotation_id"],
    otherInquiriesCount: json["other_inquiries_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "name": name,
    "mobile_no": mobileNo,
    "alternate_contact_number": alternateContactNumber,
    "email": email,
    "plan_name": planName,
    "status": status,
    "status_txt": statusTxt,
    "status_color": statusColor,
    "plan_type": planType?.toJson(),
    "plan_pattern": planPattern?.toJson(),
    "created_at": createdAt,
    "expiry_date": expiryDate,
    "plot_length": plotLength,
    "plot_width": plotWidth,
    "plan_budget_amount": planBudgetAmount?.toJson(),
    "is_quotation_complete": isQuotationComplete,
    "is_send": isSend,
    "is_editable": isEditable,
    "order_id": orderId,
    "quotation_id": quotationId,
    "other_inquiries_count": otherInquiriesCount,
  };
}

class Plan {
  final int? id;
  final String? name;

  Plan({
    this.id,
    this.name,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? countryCode;
  final String? mobileNo;
  final String? image;
  final int? isOnline;
  final dynamic deviceId;
  final String? deviceType;
  final String? lastLogin;

  User({
    this.id,
    this.name,
    this.email,
    this.countryCode,
    this.mobileNo,
    this.image,
    this.isOnline,
    this.deviceId,
    this.deviceType,
    this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    countryCode: json["country_code"],
    mobileNo: json["mobile_no"],
    image: json["image"],
    isOnline: json["is_online"],
    deviceId: json["device_id"],
    deviceType: json["device_type"],
    lastLogin: json["last_login"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "country_code": countryCode,
    "mobile_no": mobileNo,
    "image": image,
    "is_online": isOnline,
    "device_id": deviceId,
    "device_type": deviceType,
    "last_login": lastLogin,
  };
}

class Pagination {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    lastPage: json["last_page"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "last_page": lastPage,
  };
}
