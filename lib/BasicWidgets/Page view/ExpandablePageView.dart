import 'package:flutter/material.dart';

class ExpandablePageView extends StatefulWidget {
  final List<Widget> children;
  final PageController? controller;
  final Function(int)? onPageChanged;
  final ScrollPhysics physics;
  final int initialPage;
  const ExpandablePageView({
    Key? key,
    @required this.children = const [],
    this.onPageChanged,
    this.controller,
    this.initialPage = 0,
    this.physics = const NeverScrollableScrollPhysics()
  }) : super(key: key);

  @override
  _ExpandablePageViewState createState() => _ExpandablePageViewState();
}

class _ExpandablePageViewState extends State<ExpandablePageView> with TickerProviderStateMixin {
  List<double> _heights = [];
  int _currentPage = 0;
  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    _heights = widget.children.map((e) => 0.0).toList();
    _currentPage = widget.initialPage;
    super.initState();
    widget.controller?.addListener(() {
        final _newPage = widget.controller?.page!.round();
        if (_currentPage != _newPage) {
          setState(() => _currentPage = _newPage ?? 0);
        }
      });
  }


 @override
 void dispose() {
   widget.controller?.dispose();
   super.dispose();
 }


  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 0),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        controller: widget.controller,
        onPageChanged: widget.onPageChanged,
        physics: widget.physics,
        children: _sizeReportingChildren
            .asMap() //
            .map((index, child) => MapEntry(index, child))
            .values
            .toList(),
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap() //
      .map(
        (index, child) => MapEntry(
          index,
          OverflowBox(
            //needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: SizeReportingWidget(
              onSizeChange: (size) => setState(() => _heights[index] = size.height),
              child: Align(child: child),
            ),
          ),
        ),
      )
      .values
      .toList();
}
class SizeReportingWidget extends StatefulWidget {
  final Widget? child;
  final ValueChanged<Size>? onSizeChange;

  const SizeReportingWidget({
    Key? key,
    @required this.child,
    @required this.onSizeChange,
  }) : super(key: key);

  @override
  _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size _oldSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _notifySize());
    return widget.child ?? Container();
  }

  void _notifySize() {
    if (!this.mounted) {
      return;
    }
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size!;
      widget.onSizeChange?.call(size);
    }
  }
}