
---

# Enumerable methods

> This project is completed by Oscar Alfredo Gómez Elizarrarás, in partial requirements of the Microverse cirriculum and Odin project specifications by the following:

  1.  Create #my_each, a method that is identical to #each but (obviously) does not use #each. You’ll need to remember the yield statement. Make sure it returns the same thing as #each as well.
  2.  Create #my_each_with_index in the same way.
  3.  Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
  4.  Create #my_all? (continue as above)
  5.  Create #my_any?
  6.  Create #my_none?
  7.  Create #my_count
  8.  Create #my_map
  9.  Create #my_inject
  10.  Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els(\[2,4,5]) #=> 40
  11.  Modify your #my_map method to take a proc instead.
  12.  Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.


- ![Screenshot - 1920 x 1080 ](/assets/ruby-code.jpeg?raw=true "Screenshot")
- ![Screenshot - 1920 x 1080 ](/assets/ruby-code1.jpeg?raw=true "Screenshot")
- ![Screenshot - 1920 x 1080 ](/assets/ruby-code2.jpeg?raw=true "Screenshot")

---

## Live Demo

https://repl.it/repls/SpiritedImpossiblePassword

---

## Built With

- Ruby 2.6.5

---

### Prerequisites

- Ruby 2.6.5

### Dependencies

- Rubocop to check style errors.

### Install

`git clone https://github.com/AlfredoElizarraras/ruby-my-enumerables.git`

#### On command line:
`bundler install`

## Authors

👤 **Oscar Alfredo Gómez Elizarrarás**

- Github: [@AlfredoElizarraras](https://github.com/AlfredoElizarraras)
- Twitter: [@OscarAlfredoGm4](https://twitter.com/OscarAlfredoGm4)
- Linkedin: [@OscarAlfredoGómezElizarrarás](https://mx.linkedin.com/in/oscar-alfredo-gomez-elizarraras-999589186)

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AlfredoElizarraras/ruby-my-enumerables/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://microverse.org)
- [Odin project](https://www.theodinproject.com/)

---

## 📝 License

This project is [MIT](https://github.com/AlfredoElizarraras/ruby-my-enumerables/blob/master/LICENSE) licensed.

Copyright 2019 Oscar Alfredo Gómez Elizarrarás

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
