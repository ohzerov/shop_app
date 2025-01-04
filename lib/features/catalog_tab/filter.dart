class ProductFilter {
  String? skinType;
  String? productType;
  String? skinProblem;
  String? effect;
  String? cosmeticsLine;
  ProductFilter({
    this.skinType,
    this.skinProblem,
    this.cosmeticsLine,
    this.productType,
    this.effect,
  });
  @override
  String toString() {
    return '$skinType  $skinProblem  $cosmeticsLine $productType $effect';
  }
}
