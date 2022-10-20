class Program {
  String? handle;
  String? from;
  String? name;
  String? image;
  bool? offer_payment;
  bool? public;

  Program(
      {this.handle = "",
      this.from,
      this.name,
      this.image,
      this.offer_payment = false,
      this.public = true});
}
