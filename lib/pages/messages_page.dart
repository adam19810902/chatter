import 'package:chatter/helpers.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/models.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _Stories(),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          children: [
            const Text(
              'Stories',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: AppColors.textFaded,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return _StoryCard(storyData: StoryData(name: faker.person.name(),url: Helpers.randomPictureUrl()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}


class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
