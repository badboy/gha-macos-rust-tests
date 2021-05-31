#!/bin/bash

set -xe

commit=ab06beff0b87a039398867d10c9e6570a1d5efc4

cargo install rustup-toolchain-install-master

rustup-toolchain-install-master \
  $commit \
  --targets aarch64-apple-ios-sim

rustc +$commit \
  --crate-type=staticlib \
  --target aarch64-apple-ios-sim \
  code.rs 

ls -lh
otool -l *.a
