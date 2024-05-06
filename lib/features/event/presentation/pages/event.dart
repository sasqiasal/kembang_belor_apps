import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/event/presentation/provider/get_event/bloc/event_bloc.dart';
import 'package:kembang_belor_apps/features/event/presentation/widget/event_card.dart';
import 'package:kembang_belor_apps/features/event/presentation/widget/vendor_card.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _hideButtonController;
  late bool _isVisible;

  @override
  initState() {
    super.initState();

    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          /* only set when the previous state is false
             * Less widget rebuilds 
             */
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            /* only set when the previous state is false
               * Less widget rebuilds 
               */

            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const duration = Duration(milliseconds: 300);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventLoading) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }

              if (state is EventFailure) {
                return Expanded(
                  child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<EventBloc>().add(EventFetch());
                      },
                      child: CustomScrollView(slivers: [
                        SliverFillRemaining(
                          child: Center(
                            child: Text(state.exception),
                          ),
                        )
                      ])),
                );
              }

              if (state is EventSucces) {
                return Expanded(
                  child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<EventBloc>().add(EventFetch());
                        // await Future.delayed(const Duration(seconds: 2));
                      },
                      child: CustomScrollView(slivers: [
                        SliverFillRemaining(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vendor Collab Kembang Belor',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: state.entity.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (state.entity[index].is_open) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: state.entity[index].event_needed
                                                .isEmpty
                                            ? VendorCard(
                                                entity: state.entity[index])
                                            : Badge.count(
                                                count: state.entity[index]
                                                    .event_needed.length,
                                                child: VendorCard(
                                                  entity: state.entity[index],
                                                ),
                                              ),
                                      );
                                    }
                                    return SizedBox.shrink();
                                  },
                                ),
                              ),
                              Text(
                                'Event Kembang Belor',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: state.entity.length,
                                  controller: _hideButtonController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return EventCard(
                                        entity: state.entity[index]);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
                );
              }

              return Container();
            },
          )
        ]),
      ),
      floatingActionButton: AnimatedSlide(
        offset: _isVisible ? Offset.zero : const Offset(0, 2),
        duration: duration,
        child: AnimatedOpacity(
          duration: duration,
          opacity: _isVisible ? 1 : 0,
          child: FloatingActionButton.extended(
            label: const Text('Riwayat Event Anda'),
            icon: const Icon(Icons.history),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
