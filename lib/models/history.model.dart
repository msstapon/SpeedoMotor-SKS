class HistoryModel {
  int status;
  String message;
  List<Data> data;

  HistoryModel({this.status, this.message, this.data});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int speedTestKey;
  int userKey;
  String speed100m;
  String time100m;
  String speed200m;
  String time200m;
  String speed300m;
  String time300m;
  String speed400m;
  String time400m;
  String speed500m;
  String time500m;
  String speed600m;
  String time600m;
  String speed700m;
  String time700m;
  String speed800m;
  String time800m;
  String speed900m;
  String time900m;
  String speed1000m;
  String time1000m;
  String speed1100m;
  String time1100m;
  String speed1200m;
  String time1200m;
  String speed1300m;
  String time1300m;
  String speed1400m;
  String time1400m;
  String speed1500m;
  String time1500m;
  String speed1600m;
  String time1600m;
  String speed1700m;
  String time1700m;
  String speed1800m;
  String time1800m;
  String speed1900m;
  String time1900m;
  String speed2000m;
  String time2000m;
  String total;
  String average;
  String maxSpeed;

  Data(
      {this.speedTestKey,
        this.userKey,
        this.speed100m,
        this.time100m,
        this.speed200m,
        this.time200m,
        this.speed300m,
        this.time300m,
        this.speed400m,
        this.time400m,
        this.speed500m,
        this.time500m,
        this.speed600m,
        this.time600m,
        this.speed700m,
        this.time700m,
        this.speed800m,
        this.time800m,
        this.speed900m,
        this.time900m,
        this.speed1000m,
        this.time1000m,
        this.speed1100m,
        this.time1100m,
        this.speed1200m,
        this.time1200m,
        this.speed1300m,
        this.time1300m,
        this.speed1400m,
        this.time1400m,
        this.speed1500m,
        this.time1500m,
        this.speed1600m,
        this.time1600m,
        this.speed1700m,
        this.time1700m,
        this.speed1800m,
        this.time1800m,
        this.speed1900m,
        this.time1900m,
        this.speed2000m,
        this.time2000m,
        this.total,
        this.average,
        this.maxSpeed});

  Data.fromJson(Map<String, dynamic> json) {
    speedTestKey = json['speedTestKey'];
    userKey = json['userKey'];
    speed100m = json['speed100m'];
    time100m = json['time100m'];
    speed200m = json['speed200m'];
    time200m = json['time200m'];
    speed300m = json['speed300m'];
    time300m = json['time300m'];
    speed400m = json['speed400m'];
    time400m = json['time400m'];
    speed500m = json['speed500m'];
    time500m = json['time500m'];
    speed600m = json['speed600m'];
    time600m = json['time600m'];
    speed700m = json['speed700m'];
    time700m = json['time700m'];
    speed800m = json['speed800m'];
    time800m = json['time800m'];
    speed900m = json['speed900m'];
    time900m = json['time900m'];
    speed1000m = json['speed1000m'];
    time1000m = json['time1000m'];
    speed1100m = json['speed1100m'];
    time1100m = json['time1100m'];
    speed1200m = json['speed1200m'];
    time1200m = json['time1200m'];
    speed1300m = json['speed1300m'];
    time1300m = json['time1300m'];
    speed1400m = json['speed1400m'];
    time1400m = json['time1400m'];
    speed1500m = json['speed1500m'];
    time1500m = json['time1500m'];
    speed1600m = json['speed1600m'];
    time1600m = json['time1600m'];
    speed1700m = json['speed1700m'];
    time1700m = json['time1700m'];
    speed1800m = json['speed1800m'];
    time1800m = json['time1800m'];
    speed1900m = json['speed1900m'];
    time1900m = json['time1900m'];
    speed2000m = json['speed2000m'];
    time2000m = json['time2000m'];
    total = json['total'];
    average = json['average'];
    maxSpeed = json['maxSpeed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speedTestKey'] = this.speedTestKey;
    data['userKey'] = this.userKey;
    data['speed100m'] = this.speed100m;
    data['time100m'] = this.time100m;
    data['speed200m'] = this.speed200m;
    data['time200m'] = this.time200m;
    data['speed300m'] = this.speed300m;
    data['time300m'] = this.time300m;
    data['speed400m'] = this.speed400m;
    data['time400m'] = this.time400m;
    data['speed500m'] = this.speed500m;
    data['time500m'] = this.time500m;
    data['speed600m'] = this.speed600m;
    data['time600m'] = this.time600m;
    data['speed700m'] = this.speed700m;
    data['time700m'] = this.time700m;
    data['speed800m'] = this.speed800m;
    data['time800m'] = this.time800m;
    data['speed900m'] = this.speed900m;
    data['time900m'] = this.time900m;
    data['speed1000m'] = this.speed1000m;
    data['time1000m'] = this.time1000m;
    data['speed1100m'] = this.speed1100m;
    data['time1100m'] = this.time1100m;
    data['speed1200m'] = this.speed1200m;
    data['time1200m'] = this.time1200m;
    data['speed1300m'] = this.speed1300m;
    data['time1300m'] = this.time1300m;
    data['speed1400m'] = this.speed1400m;
    data['time1400m'] = this.time1400m;
    data['speed1500m'] = this.speed1500m;
    data['time1500m'] = this.time1500m;
    data['speed1600m'] = this.speed1600m;
    data['time1600m'] = this.time1600m;
    data['speed1700m'] = this.speed1700m;
    data['time1700m'] = this.time1700m;
    data['speed1800m'] = this.speed1800m;
    data['time1800m'] = this.time1800m;
    data['speed1900m'] = this.speed1900m;
    data['time1900m'] = this.time1900m;
    data['speed2000m'] = this.speed2000m;
    data['time2000m'] = this.time2000m;
    data['total'] = this.total;
    data['average'] = this.average;
    data['maxSpeed'] = this.maxSpeed;
    return data;
  }
}