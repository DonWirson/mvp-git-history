import 'dart:convert';

class String {
  final String? sha;
  final String? url;

  String({
    this.sha,
    this.url,
  });

  factory String.fromJson(String str) => String.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory String.fromMap(Map<String, dynamic> json) => String(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "sha": sha,
        "url": url,
      };
}
