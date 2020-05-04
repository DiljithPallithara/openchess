import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  final Widget child;
  final T bloc;

  const Provider({
    Key key,
    this.bloc,
    this.child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(Provider<T> oldWidget) {
    return oldWidget.bloc != bloc;
  }

  static T of<T>(BuildContext context) {
    final Provider<T> blocProvider =
        context.dependOnInheritedWidgetOfExactType<Provider<T>>();
    return blocProvider.bloc;
  }
}

class BlocProvider<T> extends StatefulWidget {
  final void Function(BuildContext context, T bloc) onDispose;
  final T Function(BuildContext context, T bloc) builder;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.builder,
    @required this.onDispose,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<T>> {
  T bloc;

  @override
  void initState() {
    super.initState();
    if (widget.builder != null) {
      bloc = widget.builder(context, bloc);
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(context, bloc);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      bloc: bloc,
      child: widget.child,
    );
  }
}
