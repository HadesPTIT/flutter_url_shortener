///
/// [BitlyException]
///
class BitlyException implements Exception {
  String? message;
  String? description;
  String? resource;
  List<Errors>? errors;

  BitlyException({
    this.message,
    this.description,
    this.resource,
    this.errors,
  });

  BitlyException.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    description = json['description'];
    resource = json['resource'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['message'] = this.message;
    data['description'] = this.description;
    data['resource'] = this.resource;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? field;
  String? errorCode;
  String? message;

  Errors({this.field, this.errorCode, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    errorCode = json['error_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['field'] = this.field;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}
