void main() {

  double totalAmount = 1000.0; 

  double josueAmount = totalAmount * 0.27;

  double tamarAmount = josueAmount * 0.85;

  double danielAmount = totalAmount * 0.25;

  double calebAmount = (josueAmount + danielAmount) * 0.23;
  
  double davidAmount = totalAmount - (josueAmount + tamarAmount + calebAmount + danielAmount);

  // Print the results
  print("Josué: \S${josueAmount.toStringAsFixed(2)} soles");
  print("Tamar: \S${tamarAmount.toStringAsFixed(2)} soles");
  print("Caleb: \S${calebAmount.toStringAsFixed(2)} soles");
  print("Daniel: \S${danielAmount.toStringAsFixed(2)} soles");
  print("David: \S${davidAmount.toStringAsFixed(2)} soles");
}