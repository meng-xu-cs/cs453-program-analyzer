# Assignment on "Evading" Program Analysis Tools

## Provision

If you have Vagrant and VirtualBox properly installed,
provisioning the VM should be as easy as `vagrant up`.
However, the provisioning might take a while.

## Helper-scripts for invoking program analysis tools

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

