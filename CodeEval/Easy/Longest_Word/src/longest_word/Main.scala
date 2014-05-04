//package longest_word

object Main extends App {
	  val lines = scala.io.Source.fromFile(args(0)).getLines.filter(_.length > 0)
	  for (l <- lines) {
		  val result = l.split(" ").reduceLeft((a, b) => if (a.length >= b.length) a else b)
		  println(result)
	  }
}