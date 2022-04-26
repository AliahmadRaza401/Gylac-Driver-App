class DriverModel {
  String fullName;
  String email;
  String password;
  String mobileNumber;
  String dp;
  String vDp;
  String vehicleCompany;
  String vehicleNumber;
  String vehicleRegNumber;
  String vehicleDesign;
  String vehicleChassisNumber;
  String status;
  int wallet;
  int orderCount;
   int level;

  DriverModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.dp,
    required this.vDp,
    required this.vehicleCompany,
    required this.vehicleNumber,
    required this.vehicleRegNumber,
    required this.vehicleDesign,
    required this.vehicleChassisNumber,
    required this.orderCount,
    required this.status,
    required this.wallet,
        required this.level,
  });

  // receiving data from server
  factory DriverModel.fromMap(map) {
    return DriverModel(
        fullName: map["fullName"],
        email: map["email"],
        password: map["password"],
        mobileNumber: map["mobileNumber"],
        dp: map["dp"],
        vDp: map["vDp"],
        vehicleCompany: map["vehicleCompany"],
        vehicleNumber: map["vehicleNumber"],
        vehicleRegNumber: map["vehicleRegNumber"],
        vehicleDesign: map["vehicleDesign"],
        vehicleChassisNumber: map["vehicleChassisNumber"],
        status: map['status'],
        orderCount: map['orderCount'],
        wallet: map['wallet'],
        level: map['level'],
        );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'dp': dp,
      'vDp': vDp,
      'vehicleCompany': vehicleCompany,
      'vehicleNumber': vehicleNumber,
      'vehicleRegNumber': vehicleRegNumber,
      'vehicleDesign': vehicleDesign,
      'vehicleChassisNumber': vehicleChassisNumber,
      'wallet': wallet,
      "orderCount": orderCount,
      "status": status,
      'level' : level,
    };
  }
}
