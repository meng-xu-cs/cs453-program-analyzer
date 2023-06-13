# Assignment on "Evading" Program Analysis Tools

The goal of this assignment is to embed a bug
in a program that is hard for any of the program
analysis tools to find.
For details, please refer to the
[instruction file](https://cs.uwaterloo.ca/~m285xu/courses/cs489-s23/assets/assignments/a2.pdf).

## Provision

If you have Vagrant and VirtualBox properly installed,
provisioning the VM should be as easy as `vagrant up`.
However, the provisioning might take a while.

## Package layout

```
<package>/
    |-- main.c    // mandatory: the only code file to submit
    |-- input/    // mandatory: the test suite with 100% gcov coverage
    |    |-- <*>  //   test case name can be arbitrary valid filename
    |-- crash/    // mandatory: sample inputs that crash the program
    |    |-- <*>  //   sample name can be arbitrary valid filename
    |-- README.md // optional: an explanatory note on the code and embedded bug
```

## Helper-scripts

All commands in this section should be executed in
the provisioned VM:

### Run gcov

```bash
./workdir/run-gcov.sh <path-to-package>
```

### Run AFL++

```bash
./workdir/run-afl.sh <path-to-package>
```

### Run KLEE

```bash
./workdir/run-klee.sh <path-to-package>
```

### Run SymCC

```bash
./workdir/run-symcc.sh <path-to-package>
```

