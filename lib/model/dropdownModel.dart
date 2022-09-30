class DropdownModel {
  int? code;
  String? message;

  DropdownModel({this.code, this.message});

  factory DropdownModel.fromJson(Map<String, dynamic> map) =>
      DropdownModel(code: map['code'], message: map['message']);
}
