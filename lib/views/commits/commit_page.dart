import 'package:flutter/material.dart';

import '../../models/commit_model.dart';

class CommitPage extends StatelessWidget {
  const CommitPage({required this.branchSha, super.key});
  final String branchSha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
