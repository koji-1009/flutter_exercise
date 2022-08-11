import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:cat_pics_stateful/model/response.dart';
import 'package:cat_pics_stateful/view/api_request.dart';
import 'package:flutter/material.dart';

class TagSelectPage extends StatefulWidget {
  const TagSelectPage({
    super.key,
    required this.initialTags,
  });

  final List<String> initialTags;

  @override
  State<TagSelectPage> createState() => _TagSelectPageState();
}

class _TagSelectPageState extends State<TagSelectPage> {
  List<String> selectedTags = [];
  List<String> tags = [];

  @override
  void initState() {
    Future(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;
    final service = ApiRequest.of(context).service;

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

        return WillPopScope(
          onWillPop: () async {
            // return selected tags
            Navigator.of(context).pop(selectedTags);
            return false;
          },
          child: Scaffold(
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
                    setState(() {
                      if (newValue ?? false) {
                        selectedTags = [...selectedTags, tag];
                      } else {
                        selectedTags = [...selectedTags.where((e) => e != tag)];
                      }
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
