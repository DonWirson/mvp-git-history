import 'commit_entity.dart';

class BranchEntity {
  final String? name;
  final CommitEntity? commit;
  final bool? protected;

  const BranchEntity({
    required this.name,
    required this.commit,
    required this.protected,
  });
}
