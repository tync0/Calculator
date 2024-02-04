class Functions {
  num calculator(String a) {
    List<String> operations = [];
    List<num> number = [];
    String c = '';
    int x = 0;
    num result = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != '+' &&
          a[i] != '=' &&
          a[i] != '-' &&
          a[i] != '*' &&
          a[i] != '/') {
        c += a[i];
      } else {
        if (a[i] != '=') {
          operations.add(a[i]);
        }
        x = int.parse(c);
        number.add(x);
        c = '';
      }
    }
    for (int i = 0; i < operations.length; i++) {
      switch (operations[i]) {
        //toplama
        case '+':
          if (i != operations.length - 1) {
            if (operations[i + 1] == '*' || operations[i + 1] == '/') {
              switch (operations[i + 1]) {
                case '*':
                  result = number[i + 1] * number[i + 2];
                  number[i + 1] = result;
                  number.remove(number[i + 2]);
                  i--;
                  operations.remove('*');
                  break;
                case '/':
                  result = number[i + 1] / number[i + 2];
                  number[i + 1] = result;
                  number.remove(number[i + 2]);
                  i--;
                  operations.remove('/');
                  break;
              }
            } else {
              i == 0
                  ? result = number[i] + number[i + 1]
                  : result += number[i + 1];
            }
          } else {
            i == 0
                ? result = number[i] + number[i + 1]
                : result += number[i + 1];
          }
          break;
        //cixma
        case '-':
          if (i != operations.length - 1) {
            if (operations[i + 1] == '*' || operations[i + 1] == '/') {
              switch (operations[i + 1]) {
                case '*':
                  result = number[i + 1] * number[i + 2];
                  number[i + 1] = result;
                  number.remove(number[i + 2]);
                  i--;
                  operations.remove('*');
                  break;
                case '/':
                  result = number[i + 1] / number[i + 2];
                  number[i + 1] = result;
                  number.remove(number[i + 2]);
                  i--;
                  operations.remove('/');
                  break;
              }
            } else {
              i == 0
                  ? result = number[i] - number[i + 1]
                  : result -= number[i + 1];
            }
          } else {
            i == 0
                ? result = number[i] - number[i + 1]
                : result -= number[i + 1];
          }
          break;
        //vurma
        case '*':
          result = number[i] * number[i + 1];
          number[i] = result;
          number.remove(number[i + 1]);
          i--;
          operations.remove('*');
          break;
        //bolme
        case '/':
          result = number[i] / number[i + 1];
          number[i] = result;
          number.remove(number[i + 1]);
          i--;
          operations.remove('/');
          break;
      }
    }
    return result;
  }
}
