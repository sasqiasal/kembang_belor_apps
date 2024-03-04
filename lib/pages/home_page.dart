import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/data/models/edited_pariwisata.dart';
import 'package:kembang_belor_apps/providers/recently/bloc/recently_tourism_bloc.dart';
import 'package:kembang_belor_apps/providers/tourism/bloc/tourism_bloc.dart';
import 'package:kembang_belor_apps/widget/card_list_pariwisata.dart';
import 'package:kembang_belor_apps/widget/card_recently_updated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TourismBloc>().add(TourismFected());
    context.read<RecentlyTourismBloc>().add(RecentlyFacilityFected());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Explore \nKembang Belor',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Pariwisata',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: size.height / 5,
            child: BlocBuilder<TourismBloc, TourismState>(
              builder: (context, state) {
                if (state is TourismFailure) {
                  return Center(
                    child: Text(state.error!),
                  );
                }

                if (state is! TourismSuccess) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final data = state.model!;
                log(data.toString());

                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final tourism = data[index];
                      return PariwisataCard(
                        model: tourism,
                      );
                    });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Recently Updated',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
              child: BlocBuilder<RecentlyTourismBloc, RecentlyTourismState>(
            builder: (context, state) {
              if (state is RecentlyTourismFailure) {
                return Center(
                  child: Text(state.error!),
                );
              }

              if (state is! RecentlyTourismSuccess) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              log('${state.model}');
              final data = state.model!;

              return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return RecentlyUpdatedCard(
                    model: state.model![index],
                  );
                },
              );
            },
          ))
        ]),
      ),
    ));
  }
}
