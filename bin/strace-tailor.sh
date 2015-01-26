#!/bin/bash

strace -e trace=file,process -f -o strace.log $@
sed -n 's/^.*"\(\/opt\/Xilinx\/[^"]*\)".*$/\1/p' strace.log \
	| sort | uniq | tr '\n' '\0' \
	| xargs -0 cp --parent --no-dereference --preserve=all -t .
