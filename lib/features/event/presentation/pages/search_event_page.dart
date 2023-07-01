import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/event/data/models/request/search_event_body.dart';
import 'package:event_app/features/event/presentation/bloc/event_bloc.dart';
import 'package:event_app/features/event/presentation/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_search_appbar/good_search_appbar.dart';

class SearchEventPage extends StatefulWidget {
  const SearchEventPage({super.key});

  @override
  State<SearchEventPage> createState() => _SearchEventPageState();
}

class _SearchEventPageState extends State<SearchEventPage> {
  final eventBloc = sl<EventBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eventBloc,
      child: Scaffold(
        appBar: GoodSearchAppBar(
          title: 'cari event',
          onSearchChanged: (keyword) {
            eventBloc.add(
              SearchEventsEvent(body: SearchEventBody(keyword: keyword)),
            );
          },
        ),
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state is EventSuccess) {
              if (state.response.data.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.response.data.length,
                  itemBuilder: (context, i) =>
                      EventCard(data: state.response.data, index: i),
                );
              } else {
                return const Center(
                  child: Text('Event dengan Keyword tersebut kosong'),
                );
              }
            } else if (state is EventLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EventFailure) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Nothing();
            }
          },
        ),
      ),
    );
  }
}
