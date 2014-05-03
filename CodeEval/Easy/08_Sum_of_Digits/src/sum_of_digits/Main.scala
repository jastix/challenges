//package sum_of_digits

object Main extends App {
  val lines = scala.io.Source.fromFile(args(0)).getLines.filter(_.length > 0)
  for (l <- lines) {
    println(l.map{_.asDigit}.reduceLeft(_ + _))
  }
}