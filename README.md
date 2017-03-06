# Bank Tech Test [![Code Climate](https://codeclimate.com/github/sliute/bank_tech_test/badges/gpa.svg)](https://codeclimate.com/github/sliute/bank_tech_test)

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
