// https://www.codewars.com/kata/functional-lists

class List {}

class ListNode extends List {

  constructor(value, next) {
    super()
    this.value = value
    this.next = next
  }

  isEmpty() {
    return false
  }

  toString() {
    return `(${this.value}${this.next.toString().replace('()', ')').replace('(', ' ')}`
  }

  head() {
    return this.value
  }

  tail() {
    return this.next
  }

  length() {
    return 1 + this.next.length()
  }

  push(value) {
    return new ListNode(value, this)
  }

  remove(value) {
    const newnext = this.next.remove(value)
    if (this.value === value) {
      return newnext
    } else if (this.next === newnext) {
      return this
    } else {
      return new ListNode(this.value, newnext)
    }
  }

  append(xs) {
    if (xs.isEmpty()) {
      return this
    } else {
      return new ListNode(this.value, this.next.append(xs))
    }
  }

}

class EmptyList extends List {

  constructor() {
    super()
  }

  toString() {
    return '()'
  }

  isEmpty() {
    return true
  }

  length() {
    return 0
  }

  push(value) {
    return new ListNode(value, this)
  }

  remove(value) {
    return this
  }

  append(xs) {
    return xs
  }

}
