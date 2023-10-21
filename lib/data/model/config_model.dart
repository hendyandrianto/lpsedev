class ConfigModel {
  bool? _maintenanceMode;
  BaseUrls? _baseUrls;

  ConfigModel({bool? maintenanceMode, BaseUrls? baseUrls}) {
    _maintenanceMode = maintenanceMode;
    _baseUrls = baseUrls;
  }

  bool? get maintenanceMode => _maintenanceMode;
  BaseUrls? get baseUrls => _baseUrls;

  ConfigModel.fromJson(Map<String, dynamic> json) {
    _maintenanceMode = json['maintenance_mode'];
    _baseUrls = BaseUrls.fromJson(json['base_urls'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maintenance_mode'] = _maintenanceMode;
    data['base_urls'] = _baseUrls!.toJson();
    return data;
  }
}

class BaseUrls {
  String? _profileImageUrl;

  BaseUrls({String? profileImageUrl}) {
    _profileImageUrl = profileImageUrl;
  }

  String? get profileImageUrl => _profileImageUrl;

  BaseUrls.fromJson(Map<String, dynamic> json) {
    _profileImageUrl = json['profile_image_url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_image_url'] = _profileImageUrl;
    return data;
  }
}
