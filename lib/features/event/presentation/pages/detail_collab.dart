import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/presentation/provider/insert_collab/bloc/insert_collab_bloc.dart';

class DetailCollabPage extends StatefulWidget {
  final EventEntity entity;

  const DetailCollabPage({super.key, required this.entity});

  @override
  State<DetailCollabPage> createState() => _DetailCollabPageState();
}

class _DetailCollabPageState extends State<DetailCollabPage> {
  String? _event;
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<InsertCollabBloc, InsertCollabState>(
          listener: (context, state) {
            if (state is InsertCollabSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Berhasil Mendaftar'),
                ),
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthStates>(
            builder: (context, authState) {
              if (authState is AuthUserAuthenticated) {
                return Stack(children: [
                  CachedNetworkImage(
                    imageUrl: widget.entity.poster_url,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                  ),
                  DraggableScrollableSheet(
                    key: sheet,
                    initialChildSize: 0.15,
                    maxChildSize: 0.6,
                    minChildSize: 0.15,
                    expand: true,
                    snap: true,
                    snapSizes: const [0.5],
                    controller: controller,
                    builder: (context, scrollController) => DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: CustomScrollView(
                          controller: scrollController,
                          slivers: [
                            SliverToBoxAdapter(
                              child: Text(
                                widget.entity.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SliverList.list(children: [
                              const Text(
                                'Dibutuhkan untuk keperluan event berikut ini : ',
                                textAlign: TextAlign.center,
                              ),
                              ListView.builder(
                                itemCount: widget.entity.event_needed.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ListTile(
                                  title: Center(
                                      child: Text(
                                          widget.entity.event_needed[index])),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, setState) => Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Pilih Bagian Event',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ListView.builder(
                                              itemCount: widget
                                                  .entity.event_needed.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  RadioListTile(
                                                title: Text(widget.entity
                                                    .event_needed[index]),
                                                value: widget
                                                    .entity.event_needed[index],
                                                groupValue: _event,
                                                onChanged: (value) {
                                                  setState(
                                                    () => _event = value,
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Batal'),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        if (_event == null) {
                                                          return;
                                                        }
                                                        Navigator.of(context)
                                                            .pop();
                                                        context.read<InsertCollabBloc>().add(InsertCollab(
                                                            entity: VendorCollabEntity(
                                                                id: null,
                                                                user_id:
                                                                    authState
                                                                        .user
                                                                        .id,
                                                                id_event: widget
                                                                    .entity.id,
                                                                needed_at:
                                                                    _event!,
                                                                is_accept: null,
                                                                title: null,
                                                                poster_url:
                                                                    null,
                                                                tanggal_daftar:
                                                                    null)));
                                                      },
                                                      child:
                                                          const Text("Daftar"))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text('Daftar Sekarang'),
                              )
                            ]),
                          ]),
                    ),
                  )
                ]);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: const SizedBox.expand(child: FlutterLogo()),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
