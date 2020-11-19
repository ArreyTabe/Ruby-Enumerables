


# RUBY-PROJECT-ENUMERABLES
In this project, we are implementing our own version of Ruby’s enumerable methods to look just like the original Ruby methods

![](https://img.shields.io/badge/Microverse-blueviolet)



# Ruby Enumerables
We are tasked to implement our own Ruby Enumerables, these enumerables include: 

- `#my_each`
- `#my_each_with_index`
- `#my_select`
- `#my_all?`
- `#my_any?`
- `#my_none?`
- `#my_count`
- `#my_map`
- `#my_inject`


## Instructions

1. Create a script file to house your methods and run it in IRB to test them later.
2. Add your new methods onto the existing Enumerable module.  Ruby makes this easy for you because any class or module can be added to without trouble ... just do something like:

~~~ruby
  module Enumerable
    def my_each
      # your code here
    end
  end
~~~

3. Create `#my_each`, a method that is identical to `#each` but (obviously) does not use `#each`.  You'll need to remember the `yield` statement.  Make sure it returns the same thing as `#each` as well.
4. Create `#my_each_with_index` in the same way.
5. Create `#my_select` in the same way, though you may use `#my_each` in your definition (but not `#each`).
6. Create `#my_all?` (continue as above)
7. Create `#my_any?`
8. Create `#my_none?`
9. Create `#my_count`
10. Create `#my_map`
11. Create `#my_inject`
12. Test your `#my_inject` by creating a method called `#multiply_els` which multiplies all the elements of the array together by using `#my_inject`, e.g. `multiply_els([2,4,5]) #=> 40`
13. Modify your `#my_map` method to take a proc instead.
14. Modify your `#my_map` method to take either a proc or a block. It won't be necessary to apply both a proc and a block in the same `#my_map` call since you could get the same effect by chaining together one `#my_map` call with the block and one with the proc. This approach is also clearer, since the user doesn't have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

  **Quick Tips:**

  * Remember `yield` and the `#call` method.

</div>


## Built With

- vs code
- git


## Getting Started

To get a local copy of this repository up and running follow these simple steps:

### Prerequisites

- A PC or device with internet connection with the ability to use command line  or terminal.

### Setup

- Open the command line  or terminal

### Install

- Go to your preferred directory
- Run `git clone git@github.com:wintan1418/RUBY-PROJECT-ENUMERABLES/.git` command

### Usage

- Open script.rb in any editor ofchoice

## Live Demo
[script demo](https://repl.it/@ARREYAFFTABE/RUBY-PROJECT-ENUMERABLES)

## Contributors

👤 **Arrey Tabe**

- Github: [ArreyTabe](https://github.com/ArreyTabe)
- Twitter: [@tabe_arrey](https://twitter.com/tabe_arrey)
- LinkedIn: [Arrey Affuembey](https://www.linkedin.com/in/arrey-affuembey-80a8b11a8/)

**Oluwadare Juwon**

- GitHub: [@wintan1418](https://github.com/wintan1418)
- Twitter: [@juwonoluwadare](https://twitter.com/oluwadarejuwon)
- LinkedIn: [Oluwadare Juwon](https://www.linkedin.com/in/oluwadare-juwon-048a391a8/)

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://choosealicense.com/licenses/mit/) licensed.
