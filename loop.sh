#!/bin/bash
for rep in {1..100}
do
	slim -d mig1=0 -d mig2=0.25 migration_selection.slim 
done
