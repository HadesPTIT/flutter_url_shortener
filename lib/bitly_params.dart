class BitlyParams {
  String longUrl;
  String domain;
  String groupId;
  String title;
  List<String> tags;
  List<DeeplinkParams> deeplinks;

  BitlyParams({
    this.longUrl,
    this.domain,
    this.groupId,
    this.title,
    this.tags,
    this.deeplinks,
  });

  BitlyParams.fromJson(Map<String, dynamic> json) {
    longUrl = json['long_url'];
    domain = json['domain'];
    groupId = json['group_guid'];
    title = json['title'];
    tags = json['tags']?.cast<String>();
    if (json['deeplinks'] != null) {
      deeplinks = List<DeeplinkParams>();
      json['deeplinks'].forEach((v) {
        deeplinks.add(new DeeplinkParams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['long_url'] = this.longUrl;
    data['domain'] = this.domain;
    data['group_guid'] = this.groupId;
    data['title'] = this.title;
    data['tags'] = this.tags;
    if (this.deeplinks != null) {
      data['deeplinks'] = this.deeplinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeeplinkParams {
  String appId;
  String appUriPath;
  String installUrl;
  String installType;

  DeeplinkParams({
    this.appId,
    this.appUriPath,
    this.installUrl,
    this.installType,
  });

  DeeplinkParams.fromJson(Map<String, dynamic> json) {
    appId = json['app_id'];
    appUriPath = json['app_uri_path'];
    installUrl = json['install_url'];
    installType = json['install_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_id'] = this.appId;
    data['app_uri_path'] = this.appUriPath;
    data['install_url'] = this.installUrl;
    data['install_type'] = this.installType;
    return data;
  }
}
