#!/bin/sh

goobook query "$*" | sed -e '/^$/d' -e 's/\(.*\) \(.*\)\t.*/\1 \2/' -e 's/\(^\&lt;.*\)\t\(.*\)/"\2" \&lt;\1\&gt;/'
