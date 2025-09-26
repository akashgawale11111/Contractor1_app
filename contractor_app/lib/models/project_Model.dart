class projectModel {
  List<TotalProjects>? totalProjects;
  bool? status;
  int? statusCode;
  String? message;

  projectModel(
      {this.totalProjects, this.status, this.statusCode, this.message});

  projectModel.fromJson(Map<String, dynamic> json) {
    if (json['total_projects'] != null) {
      totalProjects = <TotalProjects>[];
      json['total_projects'].forEach((v) {
        totalProjects!.add(new TotalProjects.fromJson(v));
      });
    }
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalProjects != null) {
      data['total_projects'] =
          this.totalProjects!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class TotalProjects {
  int? id;
  String? name;
  int? clientId;
  String? location;
  String? city;
  String? address;
  String? state;
  String? pin;
  Null? startDate;
  Null? endDate;
  String? status;
  String? estimatedCost;
  String? actualCost;
  String? description;
  String? photo;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  TotalProjects(
      {this.id,
      this.name,
      this.clientId,
      this.location,
      this.city,
      this.address,
      this.state,
      this.pin,
      this.startDate,
      this.endDate,
      this.status,
      this.estimatedCost,
      this.actualCost,
      this.description,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  TotalProjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clientId = json['client_id'];
    location = json['location'];
    city = json['city'];
    address = json['address'];
    state = json['state'];
    pin = json['pin'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    estimatedCost = json['estimated_cost'];
    actualCost = json['actual_cost'];
    description = json['description'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['client_id'] = this.clientId;
    data['location'] = this.location;
    data['city'] = this.city;
    data['address'] = this.address;
    data['state'] = this.state;
    data['pin'] = this.pin;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['estimated_cost'] = this.estimatedCost;
    data['actual_cost'] = this.actualCost;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}