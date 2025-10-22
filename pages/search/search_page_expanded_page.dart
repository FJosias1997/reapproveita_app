import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/bloc/query/query_bloc.dart';
import 'package:reapproveita_app/data/bloc/query/query_event.dart';
import 'package:reapproveita_app/data/bloc/query/query_state.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/app_bar/default_app_bar.dart';
import 'package:reapproveita_app/pages/search_results/search_results_page.dart';

class SeachPageExpandedPage extends StatefulWidget {
  final String? initialQuery;
  const SeachPageExpandedPage({this.initialQuery, super.key});

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
        queryValue: widget.initialQuery,
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
                itemCount: suggestions.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ListTile(
                      title: GestureDetector(
                        onTap: () {
                          context.goPush(
                            SearchResultsPage(querySelected: query ?? ''),
                          );
                        },
                        child: Text(query ?? ''),
                      ),
                    );
                  } else {
                    return ListTile(
                      title: GestureDetector(
                        onTap: () {
                          context.goPush(
                            SearchResultsPage(
                              querySelected: suggestions[index - 1],
                            ),
                          );
                        },
                        child: Text(suggestions[index - 1]),
                      ),
                    );
                  }
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
