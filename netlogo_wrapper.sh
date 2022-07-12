#!/bin/bash

# unzip the JDK
tar -xzf openjdk-17.0.1_linux-x64_bin.tar.gz
# Add the unzipped JDK folder to the environment
export PATH=$PWD/jdk-17.0.1/bin:$PATH
export JAVA_HOME=$PWD/jdk-17.0.1

./netlogo-headless.sh --model wolf_sheep.nlogo --experiment wolf_sheep --table -



