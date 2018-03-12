// https://leetcode.com/problems/range-sum-query-mutable

class NumArray(numbers: Array[Int]) {

  var tree = Tree build numbers

  def sumRange(start: Int, end: Int): Int = tree query Range(start, end + 1)

  def update(index: Int, value: Int) { tree = tree update (index, value) }

}

sealed trait Tree {

  /** @param range [x, y) */
  def query(range: Range): Int

  def update(index: Int, value: Int): Tree

  def value: Int

}

case class Branch(indices: Range, value: Int, left: Tree, right: Tree) extends Tree {

  import Tree.RangeOps

  def query(range: Range): Int =
    if (range encloses indices) value else tryQueryLeft(range) + tryQueryRight(range)

  def tryQueryLeft(range: Range) = if (indices.startHalf disjoints range) 0 else left query range

  def tryQueryRight(range: Range) = if (indices.endHalf disjoints range) 0 else right query range

  def update(index: Int, value: Int) =
    if (indices.isSingle && indices.start == index) {
      this copy (value = value)
    } else if (indices.startHalf contains index) {
      val leftN = left update (index, value)
      val valueN = leftN.value + right.value
      this copy (value = valueN, left = leftN)
    } else if (indices.endHalf contains index) {
      val rightN = right update (index, value)
      val valueN = left.value + rightN.value
      this copy (value = valueN, right = rightN)
    } else {
      this
    }

}

case object Empty extends Tree {

  def query(range: Range) = 0

  def update(index: Int, value: Int) = this

  def value = 0

}

object Tree {

  def build(numbers: Array[Int]): Tree =
    if (numbers.isEmpty) Empty else build(numbers, numbers.indices)

  def build(numbers: Array[Int], indices: Range): Branch =
    if (indices.isSingle) Branch(indices, numbers(indices.start), Empty, Empty)
    else {
      val left = build(numbers, indices.startHalf)
      val right = build(numbers, indices.endHalf)
      val value = left.value + right.value
      Branch(indices, value, left, right)
    }

  implicit final class RangeOps(private val range: Range) extends AnyVal {
    def isSingle = range.end - range.start <= 1
    def startHalf = range.start until range.middle
    def endHalf = range.middle until range.end
    def middle = (range.start + range.end) / 2
    def intersects(rhs: Range) = !(range disjoints rhs)
    def disjoints(rhs: Range) = rhs.end <= range.start || range.end <= rhs.start
    def encloses(rhs: Range) = range.start <= rhs.start && rhs.end <= range.end
  }

}
