void main() {
  // String name = '';
  // int age = 0;

  // print(name);
  // print(age);

  // Person2 p1 = Person2();
  // p1.nameChange('name');

  // print(p1.name);
}

// Class 내의 변수는 단드시 선언과 동시에 초기화를 시켜야 한다.
class Person1 {
  int age = 0;
}

class Person2 {
  // String name;
  // 선언과 동시에 초기화를 해야한다. name은 null 값을 받을 수 없다. if(name == null) <- 실행 안됨
  //String? name;
  // name 변수에 있을 수도있고 없을 수도 있다. (옵셔널)
  //late String name;
  // 나중에 변수 값을 초기화 한다
  // num x = 10;
  // num y = x!;
  // y값이 없을 수가 없다 할 때 느낌표

  // String nameChange(String name) {
  //   this.name = name.toUpperCase();
  //   return name;
  // }
}

int add({required int? a, required int b}) {
  // {}는 옵셔널 파라미터인데 required를 붙이면 필수적으로 값을 넘겨야 한다.

  if (a == null) {
    // int a에 ? 를 넣으면 a+b가 불가능하기 때문에 조건을 작성해야한다.
    return b;
  }
  return a + b;
}
