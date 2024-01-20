import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class AsyncValueWidget<T> extends StatelessWidget {
  ///
  const AsyncValueWidget({
    required this.value,
    required this.data,
    super.key,
    this.loading,
    this.error,
  });

  ///
  final AsyncValue<T> value;

  /// [INFO]
  /// function for success, then return the data
  final Widget Function(T data) data;

  /// [INFO]
  /// function for loading, make loading parent customize
  final Widget Function(Widget loadingWidget)? loading;

  /// [INFO]
  /// function for error, make error parent customize
  final Widget Function(Widget errorWidget)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () {
        const loadingWidget = Center(
          child: CircularProgressIndicator.adaptive(),
        );
        return loading?.call(loadingWidget) ?? loadingWidget;
      },
      error: (e, stacktrace) {
        final message = e.toString();
        final errorWidget = Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 10, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        );
        return error?.call(errorWidget) ?? errorWidget;
      },
    );
  }
}
