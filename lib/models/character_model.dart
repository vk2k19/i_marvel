import 'dart:convert';
import 'package:flutter/foundation.dart';

class CharacterModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  CharactersResponseData? data;

  CharacterModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  fromJson(Map<String, dynamic> json) {
    try {
      status = json["status"];
      copyright = json["copyright"];
      attributionText = json["attributionText"];
      attributionHtml = json["attributionHTML"];
      etag = json["etag"];
      if (json['data'] != null) {
        data = CharactersResponseData().fromJson(json['data']);
      }
      if (json["code"] != null) {
        code = json["code"];
      }
    } catch (_) {
      if (kDebugMode) {
        print("Error in JSON: $_");
      }
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> character = <String, dynamic>{};
    character["code"] = code;
    character["status"] = status;
    character["copyright"] = copyright;
    character["attributionText"] = attributionText;
    character["attributionHtml"] = attributionHtml;
    character["etag"] = etag;
    character["data"] = data;
    return character;
  }
}

class CharactersResponseData {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Character>? results;

  CharactersResponseData({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  fromJson(Map<String, dynamic> json) {
    offset = json["offset"] as int;
    limit = json["limit"] as int;
    total = json["total"] as int;
    count = json["count"] as int;
    try {
      results = <Character>[];
      json["results"]
          .forEach((result) => results!.add(Character().fromJson(result)));
    } catch (e) {
      if (kDebugMode) {
        print("Error in results: $e ${jsonEncode(json)}");
      }
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["offset"] = offset;
    data["limit"] = limit;
    data["total"] = total;
    data["count"] = count;
    data["results"] = results;
    return data;
  }
}

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url>? urls;

  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"] as String;
    description = json["description"] as String;
    modified = json["modified"] as String;
    thumbnail = Thumbnail().fromJson(json["thumbnail"]);
    resourceUri = json["resourceURI"] as String;
    comics = Comics().fromJson(json["comics"]);
    series = Comics().fromJson(json["series"]);
    stories = Stories().fromJson(json["stories"]);
    events = Comics().fromJson(json["events"]);
    urls = <Url>[];
    json["urls"].forEach((url) => urls!.add(Url().fromJson(url)));
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["modified"] = modified;
    data["thumbnail"] = thumbnail;
    data["resourceURI"] = resourceUri;
    data["comics"] = comics;
    data["series"] = series;
    data["stories"] = stories;
    data["events"] = events;
    data["urls"] = urls;
    return data;
  }
}

class Comics {
  int? available;
  String? collectionUri;
  List<ComicsItem>? items;
  int? returned;

  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  fromJson(Map<String, dynamic> json) {
    available = json["available"] as int;
    collectionUri = json["collectionURI"] as String;
    items = <ComicsItem>[];
    json["items"].forEach((x) => items!.add(ComicsItem().fromJson(x)));
    returned = json["returned"] as int;
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["available"] = available;
    data["collectionUri"] = collectionUri;
    data["items"] = items;
    data["returned"] = returned;
    return data;
  }
}

class ComicsItem {
  String? resourceUri;
  String? name;

  ComicsItem({
    this.resourceUri,
    this.name,
  });

  fromJson(Map<String, dynamic> json) {
    if (json["resourceURI"] != null) {
      resourceUri = json["resourceURI"] as String;
    }
    if (json["name"] != null) {
      name = json["name"] as String;
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["resourceUri"] = resourceUri;
    data["name"] = name;
    return data;
  }
}

class Stories {
  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  fromJson(Map<String, dynamic> json) {
    available = json["available"] as int;
    collectionUri = json["collectionURI"] as String;
    items = <StoriesItem>[];
    if (json["items"] != null && json["items"].isNotEmpty) {
      json["items"].forEach((x) => items!.add(StoriesItem().fromJson(x)));
    }
    returned = json["returned"] as int;
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["available"] = available;
    data["collectionUri"] = collectionUri;
    data["items"] = items;
    data["returned"] = returned;
    return data;
  }
}

class StoriesItem {
  String? resourceUri;
  String? name;
  ItemType? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  fromJson(Map<String, dynamic> json) {
    resourceUri = json["resourceURI"] as String;
    name = json["name"] as String;
    if (json["type"] != null && json["type"].isNotEmpty) {
      type =
          ItemType.values.firstWhere((e) => e.name == json["type"] as String);
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, String?> data = <String, String?>{};
    data["resourceUri"] = resourceUri;
    data["name"] = name;
    data["type"] = type?.name;
    return data;
  }
}

enum ItemType { cover, interiorStory, pinup }

class Thumbnail {
  String? path;
  Extension? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  fromJson(Map<String, dynamic> json) {
    path = json["path"] as String;
    extension = Extension.values
        .firstWhere((e) => e.name == json["extension"] as String);
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, String?> data = <String, String?>{};
    data["path"] = path;
    data["extension"] = extension?.name;
    return data;
  }
}

enum Extension { gif, jpg }

class Url {
  UrlType? type;
  String? url;

  Url({
    this.type,
    this.url,
  });

  fromJson(Map<String, dynamic> json) {
    type = UrlType.values.firstWhere((e) => e.name == json["type"] as String);
    url = json["url"] as String;
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, String?> data = <String, String?>{};
    data["type"] = type?.name;
    data["url"] = url;
    return data;
  }
}

enum UrlType { comiclink, detail, wiki }
