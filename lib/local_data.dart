class Transaction {
  final String name;
  final double price;

  Transaction({this.name, this.price});
}

List<Transaction> localTransactions = [
  Transaction(name: "bought something something for Agomina", price: 23.99),
  Transaction(name: "bought something something for Portia", price: 55.99),
  Transaction(name: "transfered money to Agomina and Portia", price: 19.99),
  Transaction(name: "transfered money to Portia", price: 39.99)
];

List<String> paymentOptions = [
  "Tigo Cash",
  "Vodafone Cash",
  "MTN mobile money"
];
