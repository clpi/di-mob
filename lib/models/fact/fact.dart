import 'package:flutter/material.dart';

class Fact {
  const Fact({
    this.id,
    this.name,
    this.value,
    this.units,
    this.attributes,
    this.notes,
    this.createdAt,
  });

  final String id;
  final String name;
  final String value;
  final String units;
  final String attributes;
  final String notes;
  final DateTime createdAt;
}

class FactCard {
  const FactCard({
    this.fact,
    this.childHorizontal,
    this.childVertical,
  });

  final Fact fact;
  final Widget childHorizontal;
  final Widget childVertical;
}