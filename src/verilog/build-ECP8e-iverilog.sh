#!/usr/bin/env bash
set -e
iverilog TC_Universe.v -o TC_Universe-iv.out -y builtin_components -y . -y "ECP8_components" -y "ECP8_components/subsys" "$@"
