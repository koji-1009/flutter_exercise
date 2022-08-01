import 'package:cat_pics/logic/cataas_service.dart';
import 'package:cat_pics/logic/select_state_notifier.dart';
import 'package:cat_pics/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  static const routeName = '/select';

  @override
  Widget build(BuildContext context) {
    final service = context.watch<CataasService>();
    final selectedTags = context.select<SelectStateNotifier, List<String>>(
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
                title: Text(tag),
                value: selectedTags.contains(tag),
                onChanged: (newValue) {
                  if (newValue ?? false) {
                    context.read<SelectStateNotifier>().update(
                      newList: [...selectedTags, tag],
                    );
                  } else {
                    context.read<SelectStateNotifier>().update(
                      newList: [...selectedTags.where((e) => e != tag)],
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
