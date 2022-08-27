import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cat_pics_riverpod_hooks/logic/cataas_service.dart';
import 'package:cat_pics_riverpod_hooks/logic/select_tags.dart';
import 'package:cat_pics_riverpod_hooks/model/response.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagSelectPage extends ConsumerWidget {
  const TagSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final service = ref.watch(cataasServiceProvider);
    final selectedTags = ref.watch(selectTagsProvider);

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

        final tags = data.tags;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Select tags'),
          ),
          body: ListView.builder(
            itemCount: tags.length,
            itemBuilder: (context, index) {
              final tag = tags[index];
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
                    ref.read(selectTagsProvider.notifier).state = [
                      ...selectedTags,
                      tag
                    ];
                  } else {
                    ref.read(selectTagsProvider.notifier).state = [
                      ...selectedTags.where((e) => e != tag),
                    ];
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
