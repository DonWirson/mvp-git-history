import 'dart:convert';


import '../../domain/entities/branch_entity.dart';
import 'commit_model.dart';

class BranchModel extends BranchEntity {
  const BranchModel({
    String? name,
    CommitModel? commit,
    bool? protected,
  }) : super(
          name: name,
          commit: commit,
          protected: protected,
        );

  factory BranchModel.fromRawJson(String str) =>
      BranchModel.fromJson(json.decode(str));

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        name: json["name"],
        commit: json["commit"] == null
            ? null
            : CommitModel.fromJson(json["commit"]),
        protected: json["protected"],
      );

  // static fromJsonToList(List<Map<String, dynamic> json>) {}
}
