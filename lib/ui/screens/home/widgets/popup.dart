import 'package:flutter/material.dart';
import 'package:scanner_app/ui/theme/color.dart';

class PopupContent extends StatefulWidget {
  final Offset position;
  final Widget content;
  final AnimationController animationController;
  final Animation animation;
  final double marginLeft;

  const PopupContent({Key? key, required this.position, required this.content, required this.animationController, required this.animation, required this.marginLeft})
      : super(key: key);

  @override
  State<PopupContent> createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        closePopup();
        return false;
      },
      child: GestureDetector(
        onTap: () => closePopup(),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: (MediaQuery.of(context).size.width - widget.position.dx),
                  top: widget.position.dy + 10,
                  child: AnimatedBuilder(
                    animation: widget.animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: widget.animation.value,
                        alignment: Alignment.topRight,
                        child: Opacity(
                            opacity: widget.animation.value,
                            child: child,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(12.5),
                        margin: EdgeInsets.only(
                          left: widget.marginLeft,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors().backgroundColor,
                          borderRadius: BorderRadius.circular(12.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: widget.content,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void closePopup() {
    widget.animationController.reverse().whenComplete(() {
      Navigator.of(context).pop();
    });
  }
}

