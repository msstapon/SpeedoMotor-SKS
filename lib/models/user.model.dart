
class UserModel {
  int userKey;
  String username;
  String firstName;
  String lastName;
  String phoneNo;
  bool isPremium;
  bool isLoggedIn;
  bool isAdmin;

  UserModel(
      {this.userKey,
        this.username,
        this.firstName,
        this.lastName,
        this.phoneNo,
        this.isPremium,
        this.isLoggedIn,
        this.isAdmin});

  UserModel.fromJson(Map<String, dynamic> json) {
    userKey = json['userKey'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNo = json['phoneNo'];
    isPremium = json['isPremium'];
    isLoggedIn = json['isLoggedIn'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userKey'] = this.userKey;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNo'] = this.phoneNo;
    data['isPremium'] = this.isPremium;
    data['isLoggedIn'] = this.isLoggedIn;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}