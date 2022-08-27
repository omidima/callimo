import 'package:callimoo/logic/cubit/call_log/call_log_cubit.dart';
import 'package:callimoo/presentation/screens/main/call_log/call_detail_screen.dart';
import 'package:callimoo/presentation/widget/call_log_item.dart';
import 'package:callimoo/presentation/widget/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallLimooScreen extends CallimooView {
  CallLimooScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: super.build(context)),
    );
  }

  @override
  Widget desktopView(BuildContext context) {
    return Container(
      width: 720,
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * .98,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(.12))
          ]),
      child: mobileView(context),
    );
  }

  @override
  Widget mobileView(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: _TasksList(),
      ),
    );
  }

  @override
  Widget tabletView(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0),
                color: Colors.black.withOpacity(.12))
          ]),
      child: mobileView(context),
    );
  }
}

class _TasksList extends StatefulWidget {
  _TasksList({Key? key}) : super(key: key);

  @override
  State<_TasksList> createState() => __TasksListState();
}

class __TasksListState extends State<_TasksList> {
  CallLogCubit _cubit = CallLogCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 12,
                        color: Colors.black.withOpacity(.05),
                        offset: const Offset(0, 0))
                  ]),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _cubit.onChangeList(value);
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "جستجو در جلسه‌ها ...",
                          border: InputBorder.none),
                    ),
                  ),
                  const Icon(Icons.search)
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: BlocBuilder<CallLogCubit, CallLogState>(
              buildWhen: (previous, current) => current is UpdateListState,
              builder: (context, state) => ListView.builder(
                itemCount: state is! UpdateListState
                    ? 0
                    : (state as UpdateListState).items.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CallLogItem(
                    title: (state as UpdateListState).items[index].name,
                    time: state.items[index].createdAt,
                    description: state.items[index].description,
                    onDeletedClick: () {
                      _cubit.onDeleteItem(state.items[index].id, index);
                    },
                    onGoClick: () {
                      Navigator.of(context).pushNamed(CallDetailScreen.pageName,
                          arguments: state.items[index]);
                    },
                    iconHash: state.items[index].iconHash,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
