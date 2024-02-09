import 'dart:convert';

import 'package:flutter/foundation.dart';

RepoResponse repoResponseFromJson(Uint8List data) =>
    RepoResponse.fromJson(json.decode(utf8.decode(data)));

String repoResponseToJson(RepoResponse data) => json.encode(data.toJson());

class RepoResponse {
  final int? forks;
  final String? issueUrl;
  final int? issues;
  final String? name;
  final Owner? owner;
  final bool? private;
  final int? starts;
  final DateTime? updatedAt;

  RepoResponse({
    this.forks,
    this.issueUrl,
    this.issues,
    this.name,
    this.owner,
    this.private,
    this.starts,
    this.updatedAt,
  });

  RepoResponse copyWith({
    int? forks,
    String? issueUrl,
    int? issues,
    String? name,
    Owner? owner,
    bool? private,
    int? starts,
    DateTime? updatedAt,
  }) =>
      RepoResponse(
        forks: forks ?? this.forks,
        issueUrl: issueUrl ?? this.issueUrl,
        issues: issues ?? this.issues,
        name: name ?? this.name,
        owner: owner ?? this.owner,
        private: private ?? this.private,
        starts: starts ?? this.starts,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory RepoResponse.fromJson(Map<String, dynamic> json) => RepoResponse(
        forks: json["forks"],
        issueUrl: json["issue_url"],
        issues: json["issues"],
        name: json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        private: json["private"],
        starts: json["starts"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "forks": forks,
        "issue_url": issueUrl,
        "issues": issues,
        "name": name,
        "owner": owner?.toJson(),
        "private": private,
        "starts": starts,
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Owner {
  final String? avatarUrl;
  final String? eventsUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? gravatarId;
  final String? htmlUrl;
  final int? id;
  final String? login;
  final String? nodeId;
  final String? organizationsUrl;
  final String? receivedEventsUrl;
  final String? reposUrl;
  final bool? siteAdmin;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? type;
  final String? url;

  Owner({
    this.avatarUrl,
    this.eventsUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.gravatarId,
    this.htmlUrl,
    this.id,
    this.login,
    this.nodeId,
    this.organizationsUrl,
    this.receivedEventsUrl,
    this.reposUrl,
    this.siteAdmin,
    this.starredUrl,
    this.subscriptionsUrl,
    this.type,
    this.url,
  });

  Owner copyWith({
    String? avatarUrl,
    String? eventsUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? gravatarId,
    String? htmlUrl,
    int? id,
    String? login,
    String? nodeId,
    String? organizationsUrl,
    String? receivedEventsUrl,
    String? reposUrl,
    bool? siteAdmin,
    String? starredUrl,
    String? subscriptionsUrl,
    String? type,
    String? url,
  }) =>
      Owner(
        avatarUrl: avatarUrl ?? this.avatarUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        followersUrl: followersUrl ?? this.followersUrl,
        followingUrl: followingUrl ?? this.followingUrl,
        gistsUrl: gistsUrl ?? this.gistsUrl,
        gravatarId: gravatarId ?? this.gravatarId,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        id: id ?? this.id,
        login: login ?? this.login,
        nodeId: nodeId ?? this.nodeId,
        organizationsUrl: organizationsUrl ?? this.organizationsUrl,
        receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
        reposUrl: reposUrl ?? this.reposUrl,
        siteAdmin: siteAdmin ?? this.siteAdmin,
        starredUrl: starredUrl ?? this.starredUrl,
        subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
        type: type ?? this.type,
        url: url ?? this.url,
      );

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        avatarUrl: json["avatar_url"],
        eventsUrl: json["events_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        gravatarId: json["gravatar_id"],
        htmlUrl: json["html_url"],
        id: json["id"],
        login: json["login"],
        nodeId: json["node_id"],
        organizationsUrl: json["organizations_url"],
        receivedEventsUrl: json["received_events_url"],
        reposUrl: json["repos_url"],
        siteAdmin: json["site_admin"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "events_url": eventsUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "gravatar_id": gravatarId,
        "html_url": htmlUrl,
        "id": id,
        "login": login,
        "node_id": nodeId,
        "organizations_url": organizationsUrl,
        "received_events_url": receivedEventsUrl,
        "repos_url": reposUrl,
        "site_admin": siteAdmin,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "type": type,
        "url": url,
      };
}
