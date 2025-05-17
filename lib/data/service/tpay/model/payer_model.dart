
class Payer{
  final String email;
  final String name;
  final String? phone;
  final String? address;
  final String? code;
  final String? city;
  final String? country;
  final String? taxId;

  Payer({required this.email,required this.name, this.phone, this.address, this.code, this.city,
    this.country, this.taxId});


}