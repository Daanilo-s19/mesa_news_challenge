enum MesaNewsType { NEWS, NEWSHIGHLIGHT }

extension SupportedSocialsExtension on MesaNewsType {
  String get string {
    switch (this) {
      case MesaNewsType.NEWS:
        return "Últimas notícias";
      case MesaNewsType.NEWSHIGHLIGHT:
        return " Destaques";
    }
    throw RangeError('enum ${this} not supported');
  }
}
