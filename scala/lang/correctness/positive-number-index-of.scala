class Test {
   def bad1(){
      val color = "blue"
      val strings = List("blue", "bob")
      // ruleid: positive-number-index-of
      if(strings.indexOf(color) > 0){
         println("This is if statement");
      }
   }

   def bad2(){
      val name = "bob"
      // ruleid: positive-number-index-of
      if(name.indexOf("b") > 2){
         println("This is if statement");
      }
   }

   def ok1() {
      val color = "blue"
      val strings = List("blue", "bob")
      // ok: positive-number-index-of
      if(strings.indexOf(color) > -1){
         println("This is if statement");
      }
   }

   def ok2(){
      val name = "bob"
      // ok: positive-number-index-of
      if(name.indexOf("b") >= 0){
         println("This is if statement");
      }
   }
}
