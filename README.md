# llcomputing

## What
llcomputing is a repo for storing the code/implementation of a 4-node beowulf cluster implementing the MPI protocol using parallelized code.

It also aims to test the implmentation of this.

The tools used are all open source and work with many processor architectures, so while small in my particular project, the use cases can scale to a larger cluster quite easily.

 `Arch Linux`, `MPICH` (`C`), as well as python and nodejs are compatible with many processor architectures,


## Tools
- [Raspberry Pi 3](https://www.raspberrypi.org/magpi/raspberry-pi-3-specs-benchmarks/) w/ 1.2GHz 64-bit quad-core ARM Cortex-A53 CPI
- [Arch Linux]() Performant, minimalist [UNIX](https://en.wikipedia.org/wiki/Unix) operating system
- [mpich2](https://www.mpich.org/)'s implementation of the [mpi](https://en.wikipedia.org/wiki/Message_Passing_Interface) protocol
- [mpi4py](http://mpi4py.readthedocs.org/en/stable/) `python` library connecting high level code to low level bindings
- [nodejs](https://nodejs.org)'s `cluster` module `nodejs` forking processes to child CPU scores
- [loadtest](https://github.com/alexfernandez/loadtest) for testing it all!

## Guide

-- [Install](github.com/skilbjo/llcomputing/) // INSTALL.md
-- [MPICH]() // MPICH.md
-- [Multi core threading / forking w/ node.js]() // MULTI_CORE_NODEJS.md
-- [Using the repo]() REPO.md

## Scripts

- python/md5crack.py
- node/express.js && loadtest

### 
# 


## Measure speed

````
$ time mpiexec --machinefile machinefile --map-by node -n 4 hostname
real	0m1.101s

$ time mpiexec --machinefile machinefile --map-by core -n 4 hostname
real	0m1.112s



````

## Scripting


````
$ mpiexec --machinefile machinefile --map-by node -n 4 python python/md5_attack.py 

````
