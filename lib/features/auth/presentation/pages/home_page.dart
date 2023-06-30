import 'dart:developer';

import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/components/empty/nothing.dart';
import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:event_app/features/auth/presentation/widgets/home_appbar.dart';
import 'package:event_app/features/auth/presentation/widgets/search_card.dart';
import 'package:event_app/features/event/presentation/bloc/event_bloc.dart';
import 'package:event_app/features/event/presentation/widgets/event_card.dart';
import 'package:event_app/features/information/presentation/bloc/information_bloc.dart';
import 'package:event_app/features/information/presentation/widgets/home_information_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authBloc = sl<AuthBloc>();
  final eventBloc = sl<EventBloc>();
  final informationBloc = sl<InformationBloc>();

  @override
  void initState() {
    authBloc.add(GetProfileMemberEvent());
    eventBloc.add(GetAllEventsEvent());
    informationBloc.add(GetInformationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final prefs = sl<SharedPrefs>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authBloc,
        ),
        BlocProvider(
          create: (context) => eventBloc,
        ),
        BlocProvider(
          create: (context) => informationBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is ProfilMemberSuccess) {
                log(state.response.data.memberName);
              } else if (state is AuthFailure) {
                log('Auth gagal');
              }
            },
          ),
          BlocListener<EventBloc, EventState>(
            listener: (context, state) {
              if (state is EventSuccess) {
                log('event success');
              } else if (state is EventFailure) {
                log('event failure');
              }
            },
          ),
          BlocListener<InformationBloc, InformationState>(
            listener: (context, state) {
              if (state is InformationSuccess) {
                log('get information success');
              } else if (state is InformationFailure) {
                log('get information failure');
              }
            },
          ),
        ],
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeHeader(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Event Terbaru', style: MyTypography.titleMedium),
                        GestureDetector(
                          child: Text(
                            'See All',
                            style: MyTypography.labelSmall
                                .copyWith(color: Palette.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<EventBloc, EventState>(
                    builder: (context, state) {
                      if (state is EventSuccess) {
                        return Column(
                          children: List.generate(
                            2,
                            (index) => EventCard(
                              index: index,
                              data: state.response.data,
                            ),
                          ),
                        );
                      } else if (state is EventLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is EventFailure) {
                        return const Center(
                          child: Text('Event Failure'),
                        );
                      } else {
                        return const Nothing();
                      }
                    },
                  ),
                  // const EventCard(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Informasi Terbaru',
                          style: MyTypography.titleMedium,
                        ),
                        GestureDetector(
                          child: Text(
                            'See All',
                            style: MyTypography.labelSmall
                                .copyWith(color: Palette.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<InformationBloc, InformationState>(
                    builder: (context, state) {
                      if (state is InformationSuccess) {
                        return Column(
                          children: List.generate(
                            3,
                            (index) => HomeInformationCard(
                              index: index,
                              data: state.response.data,
                            ),
                          ),
                        );
                      } else if (state is InformationLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is InformationFailure) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return const Nothing();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        HomeAppBar(),
        SearchCard(),
      ],
    );
  }
}
