import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/event/presentation/provider/collab_history/bloc/collab_history_bloc.dart';
import 'package:kembang_belor_apps/features/event/presentation/widget/history_vendor_card.dart';

class HistoryVendorCollabPage extends StatelessWidget {
  const HistoryVendorCollabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthBloc, AuthStates>(builder: (context, authState) {
      if (authState is AuthUserAuthenticated) {
        return Stack(children: [
          Stack(children: [
            Image.asset(
              'assets/images/bernahdevalei.jpg',
              fit: BoxFit.cover,
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 80),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Riwayat Vendor',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<CollabHistoryBloc, CollabHistoryState>(
                  builder: (context, state) {
                    if (state.status == Status.initial) {
                      context
                          .read<CollabHistoryBloc>()
                          .add(FetchCollabHistory(authState.user.id));
                    }

                    if (state.status == Status.loading) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state.status == Status.failure) {
                      return Expanded(
                        child: RefreshIndicator(
                            child: const CustomScrollView(
                              slivers: [
                                SliverFillRemaining(
                                  child: Center(
                                    child: Text('Ada Kesalahan'),
                                  ),
                                )
                              ],
                            ),
                            onRefresh: () async {
                              context
                                  .read<CollabHistoryBloc>()
                                  .add(FetchCollabHistory(authState.user.id));
                            }),
                      );
                    }

                    if (state.status == Status.loaded) {
                      return Expanded(
                        child: RefreshIndicator(
                          child: ListView.builder(
                            itemCount: state.data.length,
                            itemBuilder: (context, index) =>
                                HistoryVendorCard(entity: state.data[index]),
                          ),
                          onRefresh: () async {
                            context
                                .read<CollabHistoryBloc>()
                                .add(FetchCollabHistory(authState.user.id));
                          },
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          )
        ]);
      }

      return const SizedBox.shrink();
    }));
  }
}
