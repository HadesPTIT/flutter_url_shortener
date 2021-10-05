class BitlyModel {
  String link;
  String id;
  String longUrl;
  String title;
  bool archived;
  String createdAt;
  String createdBy;
  String clientId;
  List<String> customBitlinks;
  List<String> tags;
  List<String> launchpadIds;
  List<Deeplinks> deeplinks;

  BitlyModel({
    this.link,
    this.id,
    this.longUrl,
    this.title,
    this.archived,
    this.createdAt,
    this.createdBy,
    this.clientId,
    this.customBitlinks,
    this.tags,
    this.launchpadIds,
    this.deeplinks,
  });

  BitlyModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    id = json['id'];
    longUrl = json['long_url'];
    title = json['title'];
    archived = json['archived'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    clientId = json['client_id'];
    customBitlinks = json['custom_bitlinks']?.cast<String>();
    tags = json['tags']?.cast<String>();
    launchpadIds = json['launchpad_ids']?.cast<String>();
    if (json['deeplinks'] != null) {
      deeplinks = new List<Deeplinks>();
      json['deeplinks'].forEach((v) {
        deeplinks.add(new Deeplinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['id'] = this.id;
    data['long_url'] = this.longUrl;
    data['title'] = this.title;
    data['archived'] = this.archived;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['client_id'] = this.clientId;
    data['custom_bitlinks'] = this.customBitlinks;
    data['tags'] = this.tags;
    data['launchpad_ids'] = this.launchpadIds;
    if (this.deeplinks != null) {
      data['deeplinks'] = this.deeplinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Deeplinks {
  String guid;
  String bitlink;
  String appUriPath;
  String installUrl;
  String appGuid;
  String os;
  String installType;
  String created;
  String modified;
  String brandGuid;

  Deeplinks(
      {this.guid,
      this.bitlink,
      this.appUriPath,
      this.installUrl,
      this.appGuid,
      this.os,
      this.installType,
      this.created,
      this.modified,
      this.brandGuid});

  Deeplinks.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    bitlink = json['bitlink'];
    appUriPath = json['app_uri_path'];
    installUrl = json['install_url'];
    appGuid = json['app_guid'];
    os = json['os'];
    installType = json['install_type'];
    created = json['created'];
    modified = json['modified'];
    brandGuid = json['brand_guid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['bitlink'] = this.bitlink;
    data['app_uri_path'] = this.appUriPath;
    data['install_url'] = this.installUrl;
    data['app_guid'] = this.appGuid;
    data['os'] = this.os;
    data['install_type'] = this.installType;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['brand_guid'] = this.brandGuid;
    return data;
  }
}
