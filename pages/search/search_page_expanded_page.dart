import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/bloc/query/query_bloc.dart';
import 'package:reapproveita_app/data/bloc/query/query_event.dart';
import 'package:reapproveita_app/data/bloc/query/query_state.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/app_bar/default_app_bar.dart';
import 'package:reapproveita_app/pages/search_results/search_results_page.dart';

class SeachPageExpandedPage extends StatefulWidget {
  const SeachPageExpandedPage({super.key});

  @override
  State<SeachPageExpandedPage> createState() => _SeachPageExpandedPageState();
}

class _SeachPageExpandedPageState extends State<SeachPageExpandedPage> {
  final _queryBloc = QueryBloc();
  List<String> suggestions = [];

  String? query;

  @override
  void initState() {
    super.initState();

    listenEvents();
  }

  void listenEvents() {
    _queryBloc.stream.listen((event) {
      if (event is QueryLoaded) {
        setState(() {
          suggestions = event.suggestions;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        deactivateTrailing: true,
        onSearch: (p0) {
          setState(() {
            query = p0;
          });
          _queryBloc.add(GetSuggestions(query: p0));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: GestureDetector(
                      onTap: () {
                        context.goPush(
                          SearchResultsPage(querySelected: suggestions[index]),
                        );
                      },
                      child: Text(suggestions[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _queryBloc.close();
    super.dispose();
  }
}
