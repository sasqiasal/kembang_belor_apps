import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/ticket/bloc/ticket_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/widgets/ticket_card.dart';

class MyTicketPage extends StatelessWidget {
  const MyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
            BlocBuilder<AuthBloc, AuthStates>(builder: (context, authStates) {
              if (authStates is AuthUserAuthenticated) {
                return Container(
                  margin: EdgeInsets.only(top: 140),
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Tiket Saya',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<TicketBloc, TicketState>(
                        builder: (context, state) {
                          if (state.status == Status.initial) {
                            context
                                .read<TicketBloc>()
                                .add(MyTicketFetch(uuid: authStates.user.id));
                          }
                          if (state.status == Status.loading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state.status == Status.loaded) {
                            return Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  context.read<TicketBloc>().add(
                                      MyTicketFetch(uuid: authStates.user.id));
                                },
                                child: CustomScrollView(
                                  shrinkWrap: true,
                                  slivers: [
                                    SliverFillRemaining(
                                        child: ListView.builder(
                                            itemCount: state.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return TicketItem(
                                                  entity: state.data[index]);
                                            }))
                                  ],
                                ),
                              ),
                            );
                          }

                          return SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }
}
