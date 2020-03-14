# Connect Four

Connect four in command line using Test-driven development(TDD) and Ruby.

More information on connect four on [Wikipedia](https://en.wikipedia.org/wiki/Connect_Four).

More information on TDD on [Wikipedia](https://en.wikipedia.org/wiki/Test-driven_development).

## Installation

```bash
git clone git@github.com:MERatio/connect_four.git
```

## Usage

Command line

```bash
$ cd connect_four/
```

```bash
$ ruby lib/connect_four.rb
* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
1 2 3 4 5 6 7

Player1 (○) choose you column
1

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
○ * * * * * *
1 2 3 4 5 6 7

Player2 (●) choose you column
1

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
● * * * * * *
○ * * * * * *
1 2 3 4 5 6 7

Player1 (○) choose you column
2

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
● * * * * * *
○ ○ * * * * *
1 2 3 4 5 6 7

Player2 (●) choose you column
2

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
● ● * * * * *
○ ○ * * * * *
1 2 3 4 5 6 7

Player1 (○) choose you column
3

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
● ● * * * * *
○ ○ ○ * * * *
1 2 3 4 5 6 7

Player2 (●) choose you column
3

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
● ● ● * * * *
○ ○ ○ * * * *
1 2 3 4 5 6 7

Player1 (○) choose you column
4

* * * * * * *
* * * * * * *
* * * * * * *
* * * * * * *
● ● ● * * * *
○ ○ ○ ○ * * *
1 2 3 4 5 6 7

Player1 (○) Wins!
```
