class Question {
  late String questionText ;
  late bool answer;

  // late keyword is used when the value is to be assigned before the variable being referenced.
/*  Question(String q, bool a){
     questionText = q;
     answer = a;
  }
 */

  // or a constructor using this can be used.
Question(this.questionText, this.answer);

}