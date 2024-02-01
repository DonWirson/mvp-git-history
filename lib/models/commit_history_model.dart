import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommitHistory {
  final String sha;
  final String nodeId;
  final Commit commit;
  final String url;
  final String htmlUrl;
  final String commentsUrl;
  final CommitHistoryAuthor author;
  final CommitHistoryAuthor committer;
  final List<Parent> parents;

  CommitHistory({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  factory CommitHistory.fromJson(String str) =>
      CommitHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommitHistory.fromMap(Map<String, dynamic> json) => CommitHistory(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: Commit.fromMap(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: CommitHistoryAuthor.fromMap(json["author"]),
        committer: CommitHistoryAuthor.fromMap(json["committer"]),
        parents:
            List<Parent>.from(json["parents"].map((x) => Parent.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit.toMap(),
        "url": url,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "author": author.toMap(),
        "committer": committer.toMap(),
        "parents": List<dynamic>.from(parents.map((x) => x.toMap())),
      };
}

class CommitHistoryAuthor {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  CommitHistoryAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory CommitHistoryAuthor.fromJson(String str) =>
      CommitHistoryAuthor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommitHistoryAuthor.fromMap(Map<String, dynamic> json) =>
      CommitHistoryAuthor(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Commit {
  final CommitAuthor author;
  final CommitAuthor committer;
  final String message;
  final Tree tree;
  final String url;
  final int commentCount;
  final Verification verification;

  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  factory Commit.fromJson(String str) => Commit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Commit.fromMap(Map<String, dynamic> json) => Commit(
        author: CommitAuthor.fromMap(json["author"]),
        committer: CommitAuthor.fromMap(json["committer"]),
        message: json["message"],
        tree: Tree.fromMap(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: Verification.fromMap(json["verification"]),
      );

  Map<String, dynamic> toMap() => {
        "author": author.toMap(),
        "committer": committer.toMap(),
        "message": message,
        "tree": tree.toMap(),
        "url": url,
        "comment_count": commentCount,
        "verification": verification.toMap(),
      };

  @override
  operator ==(o) => o is Commit && o.tree.sha == tree.sha;
}

class CommitAuthor {
  final String name;
  final String email;
  final DateTime date;

  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthor.fromJson(String str) =>
      CommitAuthor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommitAuthor.fromMap(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}

class Tree {
  final String sha;
  final String url;

  Tree({
    required this.sha,
    required this.url,
  });

  factory Tree.fromJson(String str) => Tree.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tree.fromMap(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "sha": sha,
        "url": url,
      };
}

class Verification {
  final bool verified;
  final String reason;
  final dynamic signature;
  final dynamic payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  factory Verification.fromJson(String str) =>
      Verification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Verification.fromMap(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toMap() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}

class Parent {
  final String sha;
  final String url;
  final String htmlUrl;

  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  factory Parent.fromJson(String str) => Parent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parent.fromMap(Map<String, dynamic> json) => Parent(
        sha: json["sha"],
        url: json["url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toMap() => {
        "sha": sha,
        "url": url,
        "html_url": htmlUrl,
      };
}
