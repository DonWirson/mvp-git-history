import 'package:equatable/equatable.dart';

class TreeEntity extends Equatable {
  final String? sha;
  final String? url;

  const TreeEntity({
    this.sha,
    this.url,
  });
  @override
  List<Object?> get props => [sha, url];
}
