# Bank Tech Test ![Travis CI](https://travis-ci.org/sliute/bank_tech_test.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/sliute/bank_tech_test/badge.svg?branch=master)](https://coveralls.io/github/sliute/bank_tech_test?branch=master) [![Code Climate](https://codeclimate.com/github/sliute/bank_tech_test/badges/gpa.svg)](https://codeclimate.com/github/sliute/bank_tech_test)

## User Stories

```
As a user,
So I can keep my money (relatively) safe,
I want to be able to deposit it into a bank account.

As a user,
So I can use the money I deposited into a bank account,
I want to be able to withdraw it.

As a user,
So I can (painfully) remember what I did with my money,
I want to be able to see a bank statement.
```

## How to Use

```
$ git clone https://github.com/sliute/bank_tech_test.git
$ cd bank_tech_test
$ bundle
$ rspec
$ irb
$ 2.4.0 :001 > require './lib/bank_account'
$ 2.4.0 :002 > bank_account = BankAccount.new
```
Test the first user story like so:
```
$ 2.4.0 :003 > bank_account.deposit(500)
$ 2.4.0 :004 > bank_account.balance
```
And the second one like so:
```
$ 2.4.0 :005 > bank_account.withdraw(100)
$ 2.4.0 :006 > bank_account.balance
```
Also test for edge cases by attempting to:
* deposit or withdraw negative amounts
* deposit or withdraw non-numbers (i.e. strings, symbols, classes etc.)
* withdraw more than the current balance
