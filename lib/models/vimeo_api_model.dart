class VimeoModel {
  int? total;
  int? page;
  int? perPage;
  Paging? paging;
  List<Data>? data;

  VimeoModel({this.total, this.page, this.perPage, this.paging, this.data});

  VimeoModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    perPage = json['per_page'];
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paging {
  Null? next;
  Null? previous;
  String? first;
  String? last;

  Paging({this.next, this.previous, this.first, this.last});

  Paging.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['previous'] = this.previous;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class Data {
  String? uri;
  String? name;
  Null? description;
  String? type;
  String? link;
  String? playerEmbedUrl;
  int? duration;
  int? width;
  Null? language;
  int? height;
  Embed? embed;
  String? createdTime;
  String? modifiedTime;
  String? releaseTime;
  List<String>? contentRating;
  String? contentRatingClass;
  bool? ratingModLocked;
  Null? license;
  Privacy? privacy;
  Comments? pictures;
  List<Null>? tags;
  Stats? stats;
  List<Null>? categories;
  Uploader? uploader;
  Metadata? metadata;
  User? user;
  App? app;
  Play? play;
  String? status;
  String? resourceKey;
  Null? upload;
  Null? transcode;
  bool? isPlayable;
  bool? hasAudio;
  EditSession? editSession;

  Data(
      {this.uri,
      this.name,
      this.description,
      this.type,
      this.link,
      this.playerEmbedUrl,
      this.duration,
      this.width,
      this.language,
      this.height,
      this.embed,
      this.createdTime,
      this.modifiedTime,
      this.releaseTime,
      this.contentRating,
      this.contentRatingClass,
      this.ratingModLocked,
      this.license,
      this.privacy,
      this.pictures,
      this.tags,
      this.stats,
      this.categories,
      this.uploader,
      this.metadata,
      this.user,
      this.app,
      this.play,
      this.status,
      this.resourceKey,
      this.upload,
      this.transcode,
      this.isPlayable,
      this.hasAudio,
      this.editSession});

  Data.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    link = json['link'];
    playerEmbedUrl = json['player_embed_url'];
    duration = json['duration'];
    width = json['width'];
    language = json['language'];
    height = json['height'];
    embed = json['embed'] != null ? new Embed.fromJson(json['embed']) : null;
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    releaseTime = json['release_time'];
    contentRating = json['content_rating'].cast<String>();
    contentRatingClass = json['content_rating_class'];
    ratingModLocked = json['rating_mod_locked'];
    license = json['license'];
    privacy =
        json['privacy'] != null ? new Privacy.fromJson(json['privacy']) : null;
    pictures = json['pictures'] != null
        ? new Comments.fromJson(json['pictures'])
        : null;
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    if (json['categories'] != null) {
      categories = <Null>[];
      json['categories'].forEach((v) {
        categories!.add(v);
      });
    }
    uploader = json['uploader'] != null
        ? new Uploader.fromJson(json['uploader'])
        : null;
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    app = json['app'] != null ? new App.fromJson(json['app']) : null;
    play = json['play'] != null ? new Play.fromJson(json['play']) : null;
    status = json['status'];
    resourceKey = json['resource_key'];
    upload = json['upload'];
    transcode = json['transcode'];
    isPlayable = json['is_playable'];
    hasAudio = json['has_audio'];
    editSession = json['edit_session'] != null
        ? new EditSession.fromJson(json['edit_session'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['link'] = this.link;
    data['player_embed_url'] = this.playerEmbedUrl;
    data['duration'] = this.duration;
    data['width'] = this.width;
    data['language'] = this.language;
    data['height'] = this.height;
    if (this.embed != null) {
      data['embed'] = this.embed!.toJson();
    }
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['release_time'] = this.releaseTime;
    data['content_rating'] = this.contentRating;
    data['content_rating_class'] = this.contentRatingClass;
    data['rating_mod_locked'] = this.ratingModLocked;
    data['license'] = this.license;
    if (this.privacy != null) {
      data['privacy'] = this.privacy!.toJson();
    }
    if (this.pictures != null) {
      data['pictures'] = this.pictures!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags;
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories;
    }
    if (this.uploader != null) {
      data['uploader'] = this.uploader!.toJson();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.app != null) {
      data['app'] = this.app!.toJson();
    }
    if (this.play != null) {
      data['play'] = this.play!.toJson();
    }
    data['status'] = this.status;
    data['resource_key'] = this.resourceKey;
    data['upload'] = this.upload;
    data['transcode'] = this.transcode;
    data['is_playable'] = this.isPlayable;
    data['has_audio'] = this.hasAudio;
    if (this.editSession != null) {
      data['edit_session'] = this.editSession!.toJson();
    }
    return data;
  }
}

class Embed {
  String? html;

  Embed({this.html});

  Embed.fromJson(Map<String, dynamic> json) {
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['html'] = this.html;
    return data;
  }
}

class Privacy {
  String? view;

  Privacy({this.view});

  Privacy.fromJson(Map<String, dynamic> json) {
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view'] = this.view;
    return data;
  }
}

class Comments {
  String? uri;
  String? active;
  List<String>? sizes;

  Comments({this.uri, this.active, this.sizes});

  Comments.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    active = json['active'];
    sizes = json['sizes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['active'] = this.active;
    data['sizes'] = this.sizes;
    return data;
  }
}

class Stats {
  int? plays;

  Stats({this.plays});

  Stats.fromJson(Map<String, dynamic> json) {
    plays = json['plays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plays'] = this.plays;
    return data;
  }
}

class Uploader {
  String? uri;
  String? name;

  Uploader({this.uri, this.name});

  Uploader.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    return data;
  }
}

class Metadata {
  Connections? connections;

  Metadata({this.connections});

  Metadata.fromJson(Map<String, dynamic> json) {
    connections = json['connections'] != null
        ? new Connections.fromJson(json['connections'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.connections != null) {
      data['connections'] = this.connections!.toJson();
    }
    return data;
  }
}

class Connections {
  Album? album;

  Connections({this.album});

  Connections.fromJson(Map<String, dynamic> json) {
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    return data;
  }
}

class Album {
  String? uri;

  Album({this.uri});

  Album.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    return data;
  }
}

class User {
  String? uri;
  String? name;

  User({this.uri, this.name});

  User.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    return data;
  }
}

class App {
  String? name;
  String? uri;

  App({this.name, this.uri});

  App.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uri'] = this.uri;
    return data;
  }
}

class Play {
  int? width;
  String? url;
  String? height;

  Play({this.width, this.url, this.height});

  Play.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    url = json['url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['url'] = this.url;
    data['height'] = this.height;
    return data;
  }
}

class EditSession {
  String? status;

  EditSession({this.status});

  EditSession.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
