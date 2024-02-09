import 'dart:convert';
import 'dart:typed_data';

List<HistoryResponse> historyResponseFromJson(Uint8List bin) =>
    List<HistoryResponse>.from(
        json.decode(utf8.decode(bin)).map((x) => HistoryResponse.fromJson(x)));

String historyResponseToJson(List<HistoryResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryResponse {
  final Commit? commit;
  final String? htmlUrl;

  HistoryResponse({
    this.commit,
    this.htmlUrl,
  });

  HistoryResponse copyWith({
    Commit? commit,
    String? htmlUrl,
    login,
  }) =>
      HistoryResponse(
        commit: commit ?? this.commit,
        htmlUrl: htmlUrl ?? this.htmlUrl,
      );

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      HistoryResponse(
        commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "commit": commit?.toJson(),
        "html_url": htmlUrl,
      };
}

class Commit {
  final Author? author;
  final int? commentCount;
  final Author? committer;
  final String? message;
  final Tree? tree;
  final String? url;
  final Verification? verification;

  Commit({
    this.author,
    this.commentCount,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.verification,
  });

  Commit copyWith({
    Author? author,
    int? commentCount,
    Author? committer,
    String? message,
    Tree? tree,
    String? url,
    Verification? verification,
  }) =>
      Commit(
        author: author ?? this.author,
        commentCount: commentCount ?? this.commentCount,
        committer: committer ?? this.committer,
        message: message ?? this.message,
        tree: tree ?? this.tree,
        url: url ?? this.url,
        verification: verification ?? this.verification,
      );

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        commentCount: json["comment_count"],
        committer: json["committer"] == null
            ? null
            : Author.fromJson(json["committer"]),
        message: json["message"],
        tree: json["tree"] == null ? null : Tree.fromJson(json["tree"]),
        url: json["url"],
        verification: json["verification"] == null
            ? null
            : Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "comment_count": commentCount,
        "committer": committer?.toJson(),
        "message": message,
        "tree": tree?.toJson(),
        "url": url,
        "verification": verification?.toJson(),
      };
}

class Author {
  final String? avatar;
  final DateTime? date;
  final String? email;
  final String? name;
  final String? login;

  Author({
    this.avatar,
    this.date,
    this.email,
    this.name,
    this.login,
  });

  Author copyWith({
    String? avatar,
    DateTime? date,
    String? email,
    String? name,
    String? login,
  }) =>
      Author(
        avatar: avatar ?? this.avatar,
        date: date ?? this.date,
        email: email ?? this.email,
        name: name ?? this.name,
        login: login ?? this.login,
      );

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        avatar: json["avatar"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        email: json["email"],
        name: json["name"],
        login: json["login"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "date": date?.toIso8601String(),
        "email": email,
        "name": name,
      };
}

class Tree {
  final String? sha;
  final String? url;

  Tree({
    this.sha,
    this.url,
  });

  Tree copyWith({
    String? sha,
    String? url,
  }) =>
      Tree(
        sha: sha ?? this.sha,
        url: url ?? this.url,
      );

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}

class Verification {
  final dynamic payload;
  final String? reason;
  final dynamic signature;
  final bool? verified;

  Verification({
    this.payload,
    this.reason,
    this.signature,
    this.verified,
  });

  Verification copyWith({
    dynamic payload,
    String? reason,
    dynamic signature,
    bool? verified,
  }) =>
      Verification(
        payload: payload ?? this.payload,
        reason: reason ?? this.reason,
        signature: signature ?? this.signature,
        verified: verified ?? this.verified,
      );

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        payload: json["payload"],
        reason: json["reason"],
        signature: json["signature"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload,
        "reason": reason,
        "signature": signature,
        "verified": verified,
      };
}
