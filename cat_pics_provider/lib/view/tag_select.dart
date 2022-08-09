import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cat_pics_provider/logic/cataas_service.dart';
import 'package:cat_pics_provider/logic/select_tags_notifier.dart';
import 'package:cat_pics_provider/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagSelectPage extends StatelessWidget {
  const TagSelectPage({super.key});

  static const routeName = '/select';

  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final service = context.watch<CataasService>();
    final selectedTags = context.select<SelectTagsNotifier, List<String>>(
      (notifier) => notifier.value,
    );

    return FutureBuilder<TagList>(
      future: service.tags(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Select tags'),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final tag = data.tags[index];
              if (tag.isEmpty) {
                return const SizedBox.shrink();
              }

              return CheckboxListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                title: Text(tag),
                value: selectedTags.contains(tag),
                onChanged: (newValue) {
                  if (newValue ?? false) {
                    context.read<SelectTagsNotifier>().update(
                      tags: [...selectedTags, tag],
                    );
                  } else {
                    context.read<SelectTagsNotifier>().update(
                      tags: [...selectedTags.where((e) => e != tag)],
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
