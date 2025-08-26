void main(){
  String str="fleSruoYevileB";
  String reversedStr = str.split('').reversed.join('');
  print(reversedStr);
  List<int> num = [10,9,3,4,5,6,7,13];
  print("largest number is ${num.reduce((a, b) => a > b ? a : b)}");
  List<int> arr = [7, 18, 45, -6, 19, -1, 0];
  print("negative number is ${arr.where((num) => num < 0).toList()}");
  int num=641108;
  print("sum of digits is ${num.toString().split('').map(int.parse).reduce((a, b) => a + b)}");
  List<int> num=([1,2,2,3,4,4,5]);
  print("duplicate numbers are ${num.toSet().difference.(num.toSet())}");
  print("returning duplicate numbers are ${num.toSet().toList()}");
   Set<int> num = {1, 2, 4, 5};
  print("missing numbers are ${List.generate(num.last - num.first + 1, (index) => num.first + index).where((element) => !num.contains(element)).toList()}");
List<int> num = [3,34,4,12,5,2];
int sum = 9;
for (List<int> subset in subsets(sum)) {
  if (subset.reduce((a, b) => a + b) == sum) {
    print("true");
  } else {
    print("false");
  }
}
}


