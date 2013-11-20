GitDB
=====

The power of UNIX, bash, and git combine to create a rudimentary DBMS.

What is GitDB?
--------------
Any functional SQL-ish DBMS needs a few things:

1. Code to handle disk and cache management
2. Logic to stream records through a query plan
3. A means by which to support concurrent access to tables

What does a standard Linux installation give us?

1. An Operating System (basic disk and cache management)
2. Some sweet UNIX piping possibilities (basic streaming)
3. Git (concurrent access control)


All the tools of database management are right there.  All that was needed was someone with some spare
time and a tendency to understand things by drawing abstract anaologies.

So yes, the goal of GitDB is to come close to something of a DBMS, featuring the ability to create and
drop tables, insert and remove records, join and compare tables, and filter out results based on searches.

What is GitDB NOT?
------------------
* A replacement for your PostgreSQL setup
* Practical in nearly every scenario
* An officially sanctioned implementation of SQL standards, nor is it trying to be
* Complex


What is the State of GitDB?
---------------------------
Well as of now, it is a work in progress. Time gets placed towards building it when available. It's a slow process.
