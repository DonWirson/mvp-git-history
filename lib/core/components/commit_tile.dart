import 'package:flutter/material.dart';

import '../../features/Github/domain/entities/commit_entity.dart';

class CommitTile extends StatelessWidget {
  const CommitTile({
    super.key,
    required this.commit,
    required this.date,
    required this.hour,
  });

  final CommitEntity commit;
  final String date;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              "Commiter: \n${commit.author!.name!}",
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 3,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                commit.message!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
                maxLines: 3,
              ),
            ),
          ),
          Text(
            date,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
