import 'package:flutter/material.dart';

class ContactNestedScrollControllerPhysics extends ScrollPhysics {
  final ScrollController? parentController;
  const ContactNestedScrollControllerPhysics(
      {this.parentController, super.parent});

  @override
  ContactNestedScrollControllerPhysics applyTo(ScrollPhysics? ancestor) {
    return ContactNestedScrollControllerPhysics(
        parentController: parentController, parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (parentController == null || !parentController!.hasClients) {
      return super.applyPhysicsToUserOffset(position, offset);
    }

    final double scrollPixels = position.pixels;
    final double parentScrollOffset = parentController!.offset;
    final double parentMaxScrollExtent =
        parentController!.position.maxScrollExtent - 140;

    if (parentScrollOffset < parentMaxScrollExtent && offset.isNegative) {
      parentController?.jumpTo(parentScrollOffset - offset);
      return 0.0;
    } else if (scrollPixels == 0.0 && !offset.isNegative) {
      parentController?.jumpTo(parentScrollOffset - offset);
    }
    return super.applyPhysicsToUserOffset(position, offset);
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (parentController == null || !parentController!.hasClients) {
      return super.applyBoundaryConditions(position, value);
    }

    final double offset = value - position.pixels;
    final double parentScrollOffset = parentController!.offset;
    final double parentMaxScrollExtent =
        parentController!.position.maxScrollExtent - 140;

    if (parentScrollOffset < parentMaxScrollExtent) {
      parentController!.jumpTo(parentScrollOffset + offset);
    } else if (value <= 0.0 && parentController!.position.atEdge) {
      parentController!.animateTo(0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    }

    return super.applyBoundaryConditions(position, value);
  }
}
