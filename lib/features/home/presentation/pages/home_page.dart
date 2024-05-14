import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/recently/bloc/recently_tourism_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/tourism/bloc/tourism_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/widget/card_list_pariwisata.dart';
import 'package:kembang_belor_apps/features/home/presentation/widget/card_recently_updated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<TourismBloc>().add(TourismFected());
    context.read<RecentlyTourismBloc>().add(RecentlyFacilityFected());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<TourismBloc>().add(TourismFected());
          context.read<RecentlyTourismBloc>().add(RecentlyFacilityFected());
        },
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Explore \nKembang Belor',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  'Pariwisata',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height / 5,
                child: BlocBuilder<TourismBloc, TourismState>(
                  builder: (context, state) {
                    if (state is TourismFailure) {
                      return const Center(
                        child: Text('Unexpected Error'),
                      );
                    }

                    if (state is TourismLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is TourismSuccess) {
                      final data = state.model!;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final tourism = data[index];
                            return PariwisataCard(
                              model: tourism,
                            );
                          });
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  'Recently Updated',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                  child: BlocBuilder<RecentlyTourismBloc, RecentlyTourismState>(
                builder: (context, state) {
                  if (state is RecentlyTourismFailure) {
                    return const Center(
                      child: Text('Unexpected Error'),
                    );
                  }

                  if (state is RecentlyTourismLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is RecentlyTourismSuccess) {
                    final data = state.model!.length < 4
                        ? state.model!
                        : state.model!.getRange(0, 6);

                    return GridView.builder(
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                  }
                  return const SizedBox.shrink();
                },
              ))
            ]),
          ),
        ]),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
