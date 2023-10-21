// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/base_viewmodel.dart';
import '../../di_container.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;

  const BaseView(
      {super.key, required this.builder, required this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = sl<T>();

  @override
  void initState() {
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      // ignore: sort_child_properties_last
      child: Consumer<T>(builder: widget.builder),
      value: model,
    );
  }
}
